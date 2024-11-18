
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
${ROUTE_DELETE_SERVER}    delete_server
${ROUTE_ID_COURSE_ACTIVE}    id_course_active
${ROUTE_ID_COURSE_INACTIVE}    id_course_inactive
${ROUTE_ACTIVE_COURSE}    active_course
${ROUTE_INACTIVE_COURSE}    inactive_course
${ROUTE_INSERT_COURSE}    insert_course
${ROUTE_INSERT_REQUEST}    insert_request
${ROUTE_ID_SERVER}    id_server
${ROUTE_INSERT_SERVER_USER}  insert_server_user
${ROUTE_INSERT_SERVER}  insert_server
${ROUTE_ID_STUDENT}    id_student
${ROUTE_INSERT_STUDENT_USER}  insert_student_user
${ROUTE_INSERT_STUDENT}  insert_student
${ENROLL_STUDENT}  2019005300
${ROLES_ID_SERVER} =  3
${ROLES_ID_STUDENT} =  1


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

Executo a higienização do bando de dados
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
        Log  ${response.text}

        Create Session  alias= DELETA HISTÓRICO DA SOLICITAÇÃO   url=${HOST}
        ${response}   DELETE On Session   alias= DELETA HISTÓRICO DA SOLICITAÇÃO   url=/${ROUTE_DELETE_HISTORY_REQUEST}/${REQUEST_ID}  headers=${headers}  expected_status=200
        Log  ${response.text}

        Create Session  alias= DELETA REGISTRO TABELA ESTAGIARIOS  url=${HOST}
        ${response}   DELETE On Session   alias= DELETA REGISTRO TABELA ESTAGIARIOS   url=/${ROUTE_DELETE_INTERNS}/${REQUEST_ID}  headers=${headers}  expected_status=200
        Log  ${response.text}

        Create Session  alias= DELETA SOLICITAÇÃO DE ESTAGIO  url=${HOST}
        ${response}   DELETE On Session   alias= DELETA SOLICITAÇÃO DE ESTAGIO   url=/${ROUTE_DELETE_REQUEST}/${REQUEST_ID}  headers=${headers}  expected_status=200
        Log  ${response.text}

    END

Executo a higienazação do banco de dados excluindo o servidor
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
    
    ${headers}=    Create Dictionary    Authorization=Bearer ${TOKEN}
    Create Session  alias= EXCLUÍ SERVIDOR    url=${HOST}
    ${response}   DELETE On Session  alias= EXCLUÍ SERVIDOR   url=/${ROUTE_DELETE_SERVER}/${EMAIL_SERVER_REGISTER}  headers=${headers}  expected_status=200
    Log  ${response.text}

Verifico se existe curso ativo
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
    ${headers}=    Create Dictionary    Authorization=Bearer ${TOKEN}

    Create Session  alias= Verifica se curso ativo existe    url=${HOST}
    ${response}   GET On Session  alias= Verifica se curso ativo existe   url=/${ROUTE_ID_COURSE_ACTIVE}/${NAME_COURSE}  headers=${headers}  expected_status=200
    ${result}=   Run Keyword And Return Status  Should Contain  ${response.text}    ${NAME_COURSE}
    IF   ${result}
        Log  ${response.text}
        Create Session  alias= Verifica se curso inativo existe    url=${HOST}
        ${response}   GET On Session  alias= Verifica se curso inativo existe   url=/${ROUTE_ID_COURSE_INACTIVE}/${NAME_COURSE}  headers=${headers}  expected_status=200
        ${result}=   Run Keyword And Return Status  Should Contain  ${response.text}    ${NAME_COURSE} 
        IF   ${result}
            Log  ${response.text} 
            ${PAYLOAD}         Create Dictionary       status=${STATUS_COURSE}  nome=${NAME_COURSE} 
            Create Session  alias= Cadastra curso    url=${HOST}
            ${response}   POST On Session  alias= Cadastra curso   url=/${ROUTE_INSERT_COURSE}  json=${PAYLOAD}  expected_status=200
            Log  ${response.text} 
        ELSE
            ${COURSE_ID}=  Set Variable  ${response.text}   
            ${COURSE_ID}=  Fetch From Right   ${COURSE_ID}  :
            ${COURSE_ID}=  Remove String   ${COURSE_ID}  "    
            ${COURSE_ID}=  Remove String   ${COURSE_ID}  ]
            ${COURSE_ID}=  Remove String   ${COURSE_ID}  }
            ${COURSE_ID}=  Remove String   ${COURSE_ID}  \n
            ${COURSE_ID}=  Strip String   ${COURSE_ID}

            Create Session  alias= Ativa curso   url=${HOST}
            ${response}   PUT On Session   alias= Ativa curso   url=/${ROUTE_ACTIVE_COURSE}/${COURSE_ID}   headers=${headers}   expected_status=200
            ${result}=   Run Keyword And Return Status  Should Contain  ${response.text}    ${COURSE_ID} 
            IF   ${result}
                Log  ${response.text} 
            ELSE
                Log  ${response.text}    
            END

        END
    END



Verifico se existe curso inativo
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
    ${headers}=    Create Dictionary    Authorization=Bearer ${TOKEN}

    Create Session  alias= Verifica se curso inativo existe    url=${HOST}
    ${response}   GET On Session  alias= Verifica se curso inativo existe   url=/${ROUTE_ID_COURSE_INACTIVE}/${NAME_COURSE}  headers=${headers}  expected_status=200
    ${result}=   Run Keyword And Return Status  Should Contain  ${response.text}    ${NAME_COURSE}
    IF   ${result}
        Log  ${response.text}
        Create Session  alias= Verifica se curso ativo existe    url=${HOST}
        ${response}   GET On Session  alias= Verifica se curso ativo existe   url=/${ROUTE_ID_COURSE_ACTIVE}/${NAME_COURSE}  headers=${headers}  expected_status=200
        ${result}=   Run Keyword And Return Status  Should Contain  ${response.text}    ${NAME_COURSE} 
        IF   ${result}
            Log  ${response.text} 
            ${PAYLOAD}         Create Dictionary       status=${STATUS_COURSE_INACTIVE}  nome=${NAME_COURSE} 
            Create Session  alias= Cadastra curso inativo   url=${HOST}
            ${response}   POST On Session  alias= Cadastra curso inativo  url=/${ROUTE_INSERT_COURSE}  json=${PAYLOAD}  expected_status=200
            Log  ${response.text} 
        ELSE
            ${COURSE_ID}=  Set Variable  ${response.text}   
            ${COURSE_ID}=  Fetch From Right   ${COURSE_ID}  :
            ${COURSE_ID}=  Remove String   ${COURSE_ID}  "    
            ${COURSE_ID}=  Remove String   ${COURSE_ID}  ]
            ${COURSE_ID}=  Remove String   ${COURSE_ID}  }
            ${COURSE_ID}=  Remove String   ${COURSE_ID}  \n
            ${COURSE_ID}=  Strip String   ${COURSE_ID}

            Create Session  alias= Desativa curso   url=${HOST}
            ${response}   PUT On Session   alias= Desativa curso   url=/${ROUTE_INACTIVE_COURSE}/${COURSE_ID}   headers=${headers}   expected_status=200
            ${result}=   Run Keyword And Return Status  Should Contain  ${response.text}    ${COURSE_ID} 
            IF   ${result}
                Log  ${response.text} 
            ELSE
                Log  ${response.text}    
            END

        END
    END

Insiro uma nova solicitação de estágio
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
    ${headers}=    Create Dictionary    Authorization=Bearer ${TOKEN}
    
    #Create Dictionary       agente=${AGENT}  cancelamento=${CANCELLATION}  carga_horaria=${WORKLOAD}  contato_empresa=${CONTACT_ENTERPRISE}   data_solicitacao=${DATE_INTERNSHIP}   e_privada=${E_PRIVATE}    editavel=${EDITABLE}    etapa=${STAGE}     final_data_estagio=${DATE_INTERNSHIP}    inicio_data_estagio=${DATE_INTERNSHIP}   nome_empresa=${NAME_ENTERPRISE}   observacao=${OBSERVATION}   relatorio_entregue=${REPORT_DELIVERED}  resposta=${RESPONSE_REQUEST}  salario=${SALARY}    status=${STATUS}  status_etapa_coordenador=${STAGE_STATUS_COORDINATOR}   status_etapa_diretor=${STAGE_STATUS_DIRECTOR}    status_setor_estagio=${STAGE_STATUS_SERVER}    tipo=${TYPE}   turno_estagio=${INTERNSHIP_SHIFT}    aluno_id=${ID_STUDENT}     curso_id=${ID_COURSE}   
    Create Session  alias= Inserir solicitação de estágio    url=${HOST}
    Log To Console   ${PAYLOAD_INSERT_REQUEST}
    ${response}   POST On Session  alias= Inserir solicitação de estágio   url=/${ROUTE_INSERT_REQUEST}  json=${PAYLOAD_INSERT_REQUEST}  expected_status=200
    Log   ${response.text}

Verifico se o servidor está cadastrado

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
    ${headers}=    Create Dictionary    Authorization=Bearer ${TOKEN}

    Create Session  alias= Verifica se o servidor está cadastrado   url=${HOST}
    ${response}   GET On Session  alias= Verifica se o servidor está cadastrado   url=/${ROUTE_ID_SERVER}/${EMAIL_SERVER_DELETE}  headers=${headers}  expected_status=200
    ${result}=   Run Keyword And Return Status  Should Contain  ${response.text}    ${EMAIL_SERVER_DELETE}
    IF   ${result}
        Create Session  alias= Cadastra servidor tabela usuarios   url=${HOST}
        ${response}   POST On Session  alias= Cadastra servidor tabela usuarios   url=/${ROUTE_INSERT_SERVER_USER}  json=${PAYLOAD_INSERT_SERVER}  expected_status=200
        Log  ${response.text} 
        
        ${response}   GET On Session  alias= Verifica se o servidor está cadastrado   url=/${ROUTE_ID_SERVER}/${EMAIL_SERVER_DELETE}  headers=${headers}  expected_status=200
        ${result}=   Run Keyword And Return Status  Should Contain  ${response.text}    ${EMAIL_SERVER_DELETE}
        ${USER_SERVER_ID}=  Set Variable  ${response.text}   
        ${USER_SERVER_ID}=  Fetch From Right   ${USER_SERVER_ID}  :
        ${USER_SERVER_ID}=  Remove String   ${USER_SERVER_ID}  "    
        ${USER_SERVER_ID}=  Remove String   ${USER_SERVER_ID}  ]
        ${USER_SERVER_ID}=  Remove String   ${USER_SERVER_ID}  }
        ${USER_SERVER_ID}=  Remove String   ${USER_SERVER_ID}  \n
        ${USER_SERVER_ID}=  Strip String   ${USER_SERVER_ID}

        ${PAYLOAD}  Create Dictionary       cargo=${POSITION_SERVER}  nome=${NAME_SERVER_DELETE}   curso_id=${COURSE_ID_SERVER}  role_id=${ROLES_ID_SERVER}   usuario_sistema_id=${USER_SERVER_ID}
        Create Session  alias= Cadastra servidor    url=${HOST}
        ${response}   POST On Session  alias= Cadastra servidor   url=/${ROUTE_INSERT_SERVER}  json=${PAYLOAD}  expected_status=200
        Log  ${response.text} 
    ELSE
        Log  ${response.text}
    END

Verifico se o aluno está cadastrado
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
    ${headers}=    Create Dictionary    Authorization=Bearer ${TOKEN}

    Create Session  alias= Verifica se o aluno está cadastrado   url=${HOST}
    ${response}   GET On Session  alias= Verifica se o aluno está cadastrado   url=/${ROUTE_ID_STUDENT}/${EMAIL_STUDENT_DELETE}  headers=${headers}  expected_status=200
    ${result}=   Run Keyword And Return Status  Should Contain  ${response.text}    ${EMAIL_STUDENT_DELETE}
    IF   ${result}
        ${PAYLOAD}  Create Dictionary       email=${EMAIL_STUDENT_DELETE}  senha=${USER_PASSWORD}   roles_id=${ROLES_ID_STUDENT}
        Create Session  alias= Cadastra aluno tabela usuarios   url=${HOST}
        ${response}   POST On Session  alias= Cadastra aluno tabela usuarios   url=/${ROUTE_INSERT_STUDENT_USER}  json=${PAYLOAD}  expected_status=200
        Log  ${response.text} 
        
        ${response}   GET On Session  alias= Verifica se o aluno está cadastrado   url=/${ROUTE_ID_STUDENT}/${EMAIL_STUDENT_DELETE}  headers=${headers}  expected_status=200
        ${result}=   Run Keyword And Return Status  Should Contain  ${response.text}    ${EMAIL_SERVER_DELETE}
        ${USER_STUDENT_ID}=  Set Variable  ${response.text}   
        ${USER_STUDENT_ID}=  Fetch From Right   ${USER_STUDENT_ID}  :
        ${USER_STUDENT_ID}=  Remove String   ${USER_STUDENT_ID}  "    
        ${USER_STUDENT_ID}=  Remove String   ${USER_STUDENT_ID}  ]
        ${USER_STUDENT_ID}=  Remove String   ${USER_STUDENT_ID}  }
        ${USER_STUDENT_ID}=  Remove String   ${USER_STUDENT_ID}  \n
        ${USER_STUDENT_ID}=  Strip String   ${USER_STUDENT_ID}

        ${PAYLOAD}  Create Dictionary       matricula=${REGISTRATION_STUDENT_DELETE}  nome_completo=${NAME_STUDENT}   turno=${TURN_COURSE}    curso_id=${COURSE_ID_STUDENT}  role_id=${ROLES_ID_STUDENT}   usuario_sistema_id=${USER_STUDENT_ID}
        Log To Console   ${PAYLOAD}
        Create Session  alias= Cadastra aluno    url=${HOST}
        ${response}   POST On Session  alias= Cadastra aluno   url=/${ROUTE_INSERT_STUDENT}  json=${PAYLOAD}  expected_status=200
        Log  ${response.text} 
    ELSE
        Log  ${response.text}
    END