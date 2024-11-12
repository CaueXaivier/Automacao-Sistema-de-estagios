
*** Settings ***

Library      SeleniumLibrary
Library      RequestsLibrary
Library    String
Variables    ../Locators/Common.py
Variables    ../TestData/Testdata.py

*** Variables ***

${HOST}   http://127.0.0.1:5000
${ROUTE_LOGIN}   auth
${ROUTE_DELETE_DOCS}  delete_docs
${ROUTE_DELETE_HISTORY_REQUEST}  delete_history_request
${ROUTE_DELETE_REQUEST}  delete_request
${ROUTE_DELETE_INTERNS}  delete_interns
${ROUTE_ID_REQUEST}    id_request
${ENROLL_STUDENT}  2019005300



*** Keywords ***

### SETUP e TEARDOWN
Abrir navegador
    Open Browser    about:blank    ${BROWSER}
    IF    "${BROWSER}" == "headlesschrome"
        Set Window Size    1920    1080    True
    ELSE
        Maximize Browser Window
    END
    
Fechar navegador
    Close Browser

Acesso a home page
    Set Suite Variable    ${URL}    ${URL_PROD}
    Go To    ${URL}
Realizo o login
    Create Session  alias=deleta_docs   url=${HOST}
    ${response}   GET On Session  alias=deleta_docs  url=/${ROUTE}/${REQUEST_ID_DOCS}   expected_status=200    
    Wait Until Element Is Visible    ${loc_email_field}    45
    Input Text                       ${loc_email_field}       ${USER_STUDENT}
    Input Text                       ${loc_password_field}    ${USER_PASSWORD}
    Click Element                    ${loc_enter_button}
    Wait Until Page Does Not Contain Element   ${loc_email_field}  15

Valido se a Home é corretamente apresentada
    Wait Until Element Is Visible    ${loc_welcome}    45
    Element Should Be Visible    ${loc_logout}    45
    Element Should Be Visible     ${loc_new_request}  
    Capture Page Screenshot


Valido se as opções da Home são corretamente apresentadas
    Wait Until Element Is Visible    ${loc_welcome}    45
    Element Should Be Visible    ${loc_logout} 
    Page Should Contain Element   ${loc_list_requests_internship}
    Page Should Contain Element     ${loc_list_requests_internship} 
    Page Should Contain Element     ${loc_list_requests_reports}  
    Page Should Contain Element     ${loc_list_requests_cancellations}  
    Page Should Contain Element     ${loc_list_requests_renewals}   
    Capture Page Screenshot

Realizo o login como coordendor do curso 
    Wait Until Element Is Visible    ${loc_email_field}    45
    Input Text                       ${loc_email_field}       ${USER_SERVER}
    Input Text                       ${loc_password_field}    ${USER_PASSWORD}
    Click Element                    ${loc_enter_button}
    Wait Until Page Does Not Contain Element   ${loc_email_field}  15

Realizo o login como "${TYPE_USER}"
    Wait Until Element Is Visible    ${loc_email_field}    45
    ${type_user_student}=   Run Keyword And Return Status  Should Be Equal     ${TYPE_USER}    aluno
    ${type_user_server}=   Run Keyword And Return Status  Should Be Equal     ${TYPE_USER}    servidor 
    ${type_user_coordinator}=   Run Keyword And Return Status  Should Be Equal     ${TYPE_USER}    coordenador 
    ${type_user_director}=   Run Keyword And Return Status  Should Be Equal     ${TYPE_USER}    diretor    
    IF  ${type_user_student}
        Input Text                       ${loc_email_field}       ${USER_STUDENT}
    END
    IF  ${type_user_server}
        Input Text                       ${loc_email_field}       ${USER_SERVER}
    END
    IF  ${type_user_coordinator}
        Input Text                       ${loc_email_field}       ${USER_COORDINATOR}
    END
    IF  ${type_user_director}
        Input Text                       ${loc_email_field}       ${USER_DIRECTOR}
    END
    Input Text                       ${loc_password_field}    ${USER_PASSWORD}
    Click Element                    ${loc_enter_button}
    Wait Until Page Does Not Contain Element   ${loc_email_field}  15

Executo a higienazação do bando de dados
    ${PAYLOAD}         Create Dictionary       email=${USER_STUDENT}  senha=${USER_PASSWORD}
    
    Create Session  alias= REALIZA LOGIN   url=${HOST}
    ${response}   POST On Session    alias= REALIZA LOGIN   url=/${ROUTE_LOGIN}    json=${PAYLOAD}
    Should Be Equal As Numbers    ${response.status_code}    200
    ${TOKEN}=     Set Variable  ${response.text}   
    ${TOKEN}=  Fetch From Right   ${TOKEN}  :
    ${TOKEN}=  Remove String   ${TOKEN}  "    
    ${TOKEN}=  Remove String   ${TOKEN}  ]
    ${TOKEN}=  Remove String   ${TOKEN}  }
    ${TOKEN}=  Remove String   ${TOKEN}  \n
    ${TOKEN}=  Strip String   ${TOKEN}
    
    ${enroll_student}=  Set Variable   ${ENROLL_STUDENT}
    ${headers}=    Create Dictionary    Authorization=Bearer ${TOKEN}
    Create Session  alias= PEGA ID REQUISIÇÃO   url=${HOST}
    ${response}   GET On Session  alias= PEGA ID REQUISIÇÃO   url=/${ROUTE_ID_REQUEST}/${ENROLL_STUDENT}  headers=${headers}  expected_status=200
    ${result}=   Run Keyword And Return Status  Should Contain  ${response.text}    ${enroll_student}
    IF   ${result}
        Log  Não foi localizada nenhuma requisição de estágio
    ELSE
        ${REQUEST_ID}=  Set Variable  ${response.text}   
        ${REQUEST_ID}=  Fetch From Right   ${REQUEST_ID}  :
        ${REQUEST_ID}=  Remove String   ${REQUEST_ID}  "    
        ${REQUEST_ID}=  Remove String   ${REQUEST_ID}  ]
        ${REQUEST_ID}=  Remove String   ${REQUEST_ID}  }
        ${REQUEST_ID}=  Remove String   ${REQUEST_ID}  \n
        ${REQUEST_ID}=  Strip String   ${REQUEST_ID}
        
        Create Session  alias= DELETA DOCUMENTOS   url=${HOST}
        ${response}   DELETE On Session   alias= DELETA DOCUMENTOS   url=/${ROUTE_DELETE_DOCS}/${REQUEST_ID}   headers=${headers}   expected_status=200
        Log To Console  ${response.text}

        Create Session  alias= DELETA HISTÓRICO DA SOLICITAÇÃO   url=${HOST}
        ${response}   DELETE On Session   alias= DELETA HISTÓRICO DA SOLICITAÇÃO   url=/${ROUTE_DELETE_HISTORY_REQUEST}/${REQUEST_ID}  headers=${headers}  expected_status=200
        Log To Console  ${response.text}

        Create Session  alias= DELETA REGISTRO TABELA ESTAGIARIOS  url=${HOST}
        ${response}   DELETE On Session   alias= DELETA REGISTRO TABELA ESTAGIARIOS   url=/${ROUTE_DELETE_INTERNS}/${REQUEST_ID}  headers=${headers}  expected_status=200
        Log To Console  ${response.text}

        Create Session  alias= DELETA SOLICITAÇÃO DE ESTAGIO  url=${HOST}
        ${response}   DELETE On Session   alias= DELETA SOLICITAÇÃO DE ESTAGIO   url=/${ROUTE_DELETE_REQUEST}/${REQUEST_ID}  headers=${headers}  expected_status=200
        Log To Console  ${response.text}

    END



