***Settings***


Variables   ../Locators/RequestInternship.py
Variables    ../TestData/Testdata.py
Library    SeleniumLibrary

*** Variables ***

${FILE_PATH}        ${EXECDIR}/Resources/TestData/Docs/tce.pdf

***Keywords***

Valido se o formulário é corretamente apresentado
    Wait Until Element Is Visible   ${loc_title_form}   45
    Wait Until Element Is Visible   ${loc_observation_student}   45
    Page Should Contain Element   ${loc_type_internship}
    Page Should Contain Element   ${loc_name_enterprise}
    Page Should Contain Element   ${loc_end_internship}
    Page Should Contain Element  ${loc_contact_enterprise}
    Page Should Contain Element   ${loc_integrating_agent_select}
    Page Should Contain Element   ${loc_salary}
    Page Should Contain Element   ${loc_shift_select}
    Page Should Contain Element   ${loc_workload }
    Page Should Contain Element  ${loc_full_name}
    Page Should Contain Element   ${loc_course_name}
    Page Should Contain Element  ${loc_registration}
    Capture Page Screenshot
    Execute JavaScript    window.scrollBy(0, 700)
    Page Should Contain Element   ${loc_other_documents}
    Page Should Contain Element   ${loc_send_request}
    Page Should Contain Element  ${loc_observation_student}
    Capture Page Screenshot

Preencho o formulário de cadastro
    Click Element   ${loc_type_internship}
    Click Element   ${loc_mandatory_internship}
    Input Text      ${loc_init_internship}  ${INIT_INTERNSHIP}
    Input Text      ${loc_name_enterprise}  ${NAME_ENTERPRISE}
    Input Text      ${loc_end_internship}   ${END_INTERNSHIP}
    Input Text      ${loc_contact_enterprise}  ${CONTACT_ENTERPRISE}
    Click Element   ${loc_integrating_agent_select}
    Click Element   ${loc_integrating_agent_option}
    Input Text      ${loc_salary}   ${SALARY}
    Click Element   ${loc_shift_select}
    Click Element   ${loc_shift_option}
    Input Text      ${loc_workload}   ${WORKLOAD}
    Execute JavaScript    window.scrollBy(0, 700)
    Choose File    ${loc_tce_button}   ${FILE_PATH}
    Choose File    ${loc_activity_plan}   ${FILE_PATH}
    Click Element  ${loc_send_request}
    Wait Until Element Is Visible   ${loc_confirm_request}
    Click Element   ${loc_confirm_request}







 
