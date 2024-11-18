***Settings***


Variables   ../Locators/ListStudent.py
Variables    ../TestData/Testdata.py
Library    SeleniumLibrary



***Keywords***

Valido se a tabela com a lista de alunos é carrregada
    Wait Until Element Is Visible   ${loc_title_list}   10
    Wait Until Element Is Visible       ${loc_filter_registration_input}  10
    Element Should Be Visible   ${loc_filter_name_input}
    Element Should Be Visible   ${loc_name_student_list}
    Element Should Be Visible   ${loc_email_student_list}
    Element Should Be Visible   ${loc_turn_student_list}
    Element Should Be Visible   ${loc_course_student_list}
    Element Should Be Visible   ${loc_registration_student_list}
    Element Should Be Visible   ${loc_delete_button_list}
    Capture Page Screenshot

Clico na opção para excluir aluno
    Input Text   ${loc_filter_registration_input}    ${REGISTRATION_STUDENT_DELETE}    
    Click Element    ${loc_delete_button}
    Click Element    ${loc_confirm_delete_button}

Valido se aluno foi excluído
    Sleep  3
    Reload Page
    Input Text   ${loc_filter_registration_input}    ${REGISTRATION_STUDENT_DELETE}
    Wait Until Element Is Not Visible  ${loc_email_student}   10
    Element Should Not Be Visible   ${loc_turn_student}
    Element Should Not Be Visible  ${loc_course_student}
    Element Should Not Be Visible   ${loc_registration_student}
    Element Should Not Be Visible   ${loc_delete_button}
    Capture Page Screenshot

