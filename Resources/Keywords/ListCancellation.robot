***Settings***


Variables   ../Locators/ListCancellation.py
Variables    ../TestData/Testdata.py
Library    String
Library    SeleniumLibrary

***Keywords***


Valido se a lista de cancelamentos é corretamente carregada
    Click Element   ${loc_filter_name}
    Input Text   ${loc_filter_name}     ${NAME_STUDENT}
    Click Element   ${loc_filter_analysis_radio}
    Click Element   ${loc_filter_btn}
    ${type_intertnship}=  Get Text  ${loc_type_intertnship_request}
    ${TYPE_INTERNSHIP}=  Set Suite Variable  ${type_intertnship}
    ${name_student}=  Get Text  ${loc_name_student_request}
    ${name_student}=  Fetch From Right   ${name_student}  :
    ${name_student}=  Strip String   ${name_student}
    ${NAME_STUDENT}=  Set Suite Variable  ${name_student}
    ${status_request}=  Get Text  ${loc_status_analysis_request}
    ${STATUS_REQUEST}=  Set Suite Variable  ${status_request}
    ${course_request}=  Get Text  ${loc_course_request}
    ${course_request}=  Fetch From Right   ${course_request}  :
    ${course_request}=  Strip String   ${course_request}
    ${COURSE_REQUEST}=  Set Suite Variable  ${course_request}
    ${date_request}=  Get Text  ${loc_date_request}
    ${date_request}=  Fetch From Right   ${date_request}  :
    ${date_request}=  Strip String   ${date_request}
    ${DATE_REQUEST}=  Set Suite Variable  ${date_request}
    Page Should Contain Element   ${loc_request_cancellation}
    Page Should Contain Element   ${loc_analyze_request}
    Page Should Contain Element   ${loc_details_request}
    Capture Page Screenshot

Clico em analisar cancelamento
    Click Element  ${loc_analyze_request}

Valido se a solicitação deferida pelo "${DEFERMENT_USER}" consta como em análise
    ${coordinator_deferral}=   Run Keyword And Return Status  Should Be Equal     ${DEFERMENT_USER}    coordenador
    Wait Until Element Is Visible   ${loc_filter_name}   10
    Click Element   ${loc_filter_name}
    Input Text   ${loc_filter_name}     ${NAME_STUDENT}
    Wait Until Element Is Visible   ${loc_filter_analysis_radio}   10
    Click Element   ${loc_filter_analysis_radio}
    Wait Until Element Is Visible   ${loc_filter_name}    10
    Click Element   ${loc_filter_name}
    Input Text   ${loc_filter_name}     ${NAME_STUDENT}
    Wait Until Element Is Visible   ${loc_filter_btn} 
    Click Element   ${loc_filter_btn}
    Wait Until Element Is Visible   ${loc_status_analysis_request}   10
    Element Should Be Visible     ${loc_status_analysis_request}
    Page Should Contain Element   ${loc_request_cancellation}
    Page Should Contain Element   ${loc_analyze_request}
    Page Should Contain Element   ${loc_details_request}
    Capture Page Screenshot
    Click Element   ${loc_analyze_request}
    IF  ${coordinator_deferral}
        Wait Until Element Is Visible   ${loc_cancellation_text1}
        Page Should Contain Element   ${loc_cancellation_text1}
        Page Should Contain Element   ${loc_cancellation_text2}
        Capture Page Screenshot
    ELSE
        Wait Until Element Is Visible   ${loc_cancellation_history1}
        Page Should Contain Element   ${loc_cancellation_history1}
        Page Should Contain Element   ${loc_cancellation_history2}
        Capture Page Screenshot
    END
    

