***Settings***


Variables   ../Locators/DetailsRequestInternship.py
Library    SeleniumLibrary

*** Variables ***

${FILE_PATH}        ${EXECDIR}/Resources/TestData/Docs/tce.pdf


***Keywords***

Valido as informações e envio a solicitação para o coordenador de curso
    ${loc_name_student_details_request}=   Set Variable   //span[contains(text(),'${NAME_STUDENT}')]
    Wait Until Element Is Visible     ${loc_name_student_details_request}   45
    ${name_student_details_request}=   Get Text   ${loc_name_student_details_request}
    Should Be Equal  ${name_student_details_request}   ${NAME_STUDENT}

    ${loc_course_details_request}=   Set Variable   //b[contains(text(),'${COURSE_REQUEST}')]
    ${course_details_request}=   Get Text   ${loc_course_details_request}
    Should Be Equal  ${course_details_request}   ${COURSE_REQUEST}

    ${loc_date_details_request}=   Set Variable   //span[contains(text(),'${DATE_REQUEST}')]
    ${date_details_request}=   Get Text   ${loc_date_details_request}
    Should Be Equal  ${date_details_request}   ${DATE_REQUEST}
    Capture Page Screenshot
    Execute Javascript    window.scrollBy(0, 700)
    Click Element   ${loc_analyze_coordinator}
    Click Element   ${loc_confirm_request}
    Wait Until Element Is Not Visible   ${loc_analyze_coordinator}   10
    Capture Page Screenshot
    Wait Until Element Is Not Visible   ${loc_sucess_msg}
    Reload Page
    Wait Until Element Is Visible    ${loc_stage_history}   10
    Page Should Contain Element      ${loc_stage_history}
    Capture Page Screenshot

Valido as informações e como "${DEFERMENT_USER}" defiro a solicitação de estágio

    ${coordinator_deferral}=   Run Keyword And Return Status  Should Be Equal     ${DEFERMENT_USER}    coordenador

    ${loc_name_student_details_request}=   Set Variable   //span[contains(text(),'${NAME_STUDENT}')]
    Wait Until Element Is Visible     ${loc_name_student_details_request}   45
    ${name_student_details_request}=   Get Text   ${loc_name_student_details_request}
    Should Be Equal  ${name_student_details_request}   ${NAME_STUDENT}

    ${loc_course_details_request}=   Set Variable   //b[contains(text(),'${COURSE_REQUEST}')]
    ${course_details_request}=   Get Text   ${loc_course_details_request}
    Should Be Equal  ${course_details_request}   ${COURSE_REQUEST}

    ${loc_date_details_request}=   Set Variable   //span[contains(text(),'${DATE_REQUEST}')]
    ${date_details_request}=   Get Text   ${loc_date_details_request}
    Should Be Equal  ${date_details_request}   ${DATE_REQUEST}
    Capture Page Screenshot
    Execute Javascript    window.scrollBy(0, 700)
    Click Element   ${loc_attach_docs_button}
    Choose File    ${loc_choose_document}   ${FILE_PATH}
    Wait Until Element Is Not Visible    ${loc_upload_doc_msg}    30
    Wait Until Element Is Visible   ${loc_save_document}
    Sleep  2
    Click Element  ${loc_save_document}
    Wait Until Element Is Not Visible   ${loc_docs_sucess_msg}   10
    IF  ${coordinator_deferral}
        Click Element   ${loc_director_signature}
        Click Element   ${loc_confirm_request}
        Wait Until Element Is Not Visible   ${loc_director_signature}   10
        Capture Page Screenshot
        Wait Until Element Is Not Visible   ${loc_sucess_msg}
        Reload Page
        Wait Until Element Is Visible    ${loc_stage_history}   10
        Page Should Contain Element      ${loc_stage_history}
        Page Should Contain Element      ${loc_stage_history_coordinator_to_director}
        Capture Page Screenshot
    ELSE
        Wait Until Element Is Visible    ${loc_defer_button}
        Execute Javascript    window.scrollBy(0, 700)
        Click Element   ${loc_defer_button}
        Click Element   ${loc_confirm_request}
        Capture Page Screenshot
        Wait Until Element Is Not Visible   ${loc_defer_button}   10
        Click Element   ${loc_logout}        
    END

