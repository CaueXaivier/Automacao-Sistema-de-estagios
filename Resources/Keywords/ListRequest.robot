***Settings***


Variables   ../Locators/ListRequest.py
Variables    ../TestData/Testdata.py
Library    String
Library    SeleniumLibrary

***Keywords***

Clico em ir para solicitações de estágio
    Click Element   ${loc_list_requests_internship}
    Wait Until Element Is Visible    ${loc_type_intertnship_request}   45

Valido se a lista é corretamente carregada
    Click Element   ${loc_filter_name}
    Input Text   ${loc_filter_name}     ${NAME_STUDENT}
    Click Element   ${loc_filter_new_radio}
    Click Element   ${loc_filter_btn}
    ${type_intertnship}=  Get Text  ${loc_type_intertnship_request}
    ${TYPE_INTERNSHIP}=  Set Suite Variable  ${type_intertnship}
    ${name_student}=  Get Text  ${loc_name_student_request}
    ${name_student}=  Fetch From Right   ${name_student}  :
    ${name_student}=  Strip String   ${name_student}
    ${NAME_STUDENT}=  Set Suite Variable  ${name_student}
    ${status_request}=  Get Text  ${loc_status_new_request}
    ${STATUS_REQUEST}=  Set Suite Variable  ${status_request}
    ${course_request}=  Get Text  ${loc_course_request}
    ${course_request}=  Fetch From Right   ${course_request}  :
    ${course_request}=  Strip String   ${course_request}
    ${COURSE_REQUEST}=  Set Suite Variable  ${course_request}
    ${date_request}=  Get Text  ${loc_date_request}
    ${date_request}=  Fetch From Right   ${date_request}  :
    ${date_request}=  Strip String   ${date_request}
    ${DATE_REQUEST}=  Set Suite Variable  ${date_request}
    Page Should Contain Element   ${loc_analyze_request}
    Page Should Contain Element   ${loc_details_request}
    Capture Page Screenshot

Clico em analisar
    Click Element  ${loc_analyze_request}
    

Valido se a lista de solicitações é corretamente carregada
    Click Element   ${loc_filter_name}
    Input Text   ${loc_filter_name}     ${NAME_STUDENT}
    ${type_intertnship}=  Get Text  ${loc_type_intertnship_request}
    ${TYPE_INTERNSHIP}=  Set Suite Variable  ${type_intertnship}
    ${name_student}=  Get Text  ${loc_name_student_request}
    ${name_student}=  Fetch From Right   ${name_student}  :
    ${name_student}=  Strip String   ${name_student}
    ${NAME_STUDENT}=  Set Suite Variable  ${name_student}
    ${course_request}=  Get Text  ${loc_course_request}
    ${course_request}=  Fetch From Right   ${course_request}  :
    ${course_request}=  Strip String   ${course_request}
    ${COURSE_REQUEST}=  Set Suite Variable  ${course_request}
    ${date_request}=  Get Text  ${loc_date_request}
    ${date_request}=  Fetch From Right   ${date_request}  :
    ${date_request}=  Strip String   ${date_request}
    ${DATE_REQUEST}=  Set Suite Variable  ${date_request}
    Page Should Contain Element   ${loc_analyze_request}
    Page Should Contain Element   ${loc_details_request}
    Capture Page Screenshot

Clico na opção para gerenciar usuários
    Click Element   ${loc_management_user}

Clico no menu cursos
    Click Element   ${loc_header_courses}

Valido se a solicitação de estágio consta como indeferida
    Wait Until Element Is Visible   ${loc_list_requests_internship}   10
    Sleep   5
    Click Element    ${loc_list_requests_internship}
    Wait Until Element Is Visible   ${loc_filter_reject_radio}   10
    Click Element   ${loc_filter_reject_radio}
    Wait Until Element Is Visible   ${loc_filter_name}    10
    Click Element   ${loc_filter_name}
    Wait Until Element Is Visible   ${loc_filter_name}   10
    Input Text   ${loc_filter_name}     ${NAME_STUDENT}
    Wait Until Element Is Visible   ${loc_filter_btn} 
    Click Element   ${loc_filter_btn}
    Wait Until Element Is Visible   ${loc_status__reject_request}   10
    Element Should Be Visible     ${loc_status__reject_request}
    Should Contain    ${loc_status_reject_text}    Indeferido
    Capture Page Screenshot
    


    

