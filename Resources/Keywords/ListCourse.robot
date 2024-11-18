***Settings***


#Variables   ../Locators/UserManagementForm.py
Variables   ../Locators/ListServer.py
Variables   ../Locators/ListCourse.py
Variables    ../TestData/Testdata.py
Library    SeleniumLibrary



***Keywords***

Valido se a lista de curso é carregada corretamente
    Wait Until Element Is Visible   ${loc_title_course_management}   10
    Element Should Be Visible    ${loc_name_course_input}
    Element Should Be Visible    ${loc_add_course_button}
    Wait Until Element Is Visible   ${loc_name_course_list}   10
    Element Should Be Visible    ${loc_name_course_list}
    Element Should Be Visible    ${loc_id_course_list}

    Element Should Be Visible    ${loc_status_course_list}
    Element Should Be Visible    ${loc_alter_status_course_button}
    Element Should Be Visible    ${loc_delete_course_button}
    Capture Page Screenshot

Clico em desativar curso
    Click Element   ${loc_alter_status_course_active}
    

Valido se o curso foi desativado
    Wait Until Element Is Visible    ${loc_alter_status_course_disabled}   10
    Element Should Be Visible    ${loc_alter_status_course_disabled}
    Element Should Be Visible    ${loc_status_course_inactive}
    Capture Page Screenshot

Clico em ativar curso
    Click Element   ${loc_alter_status_course_disabled}

Valido se o curso foi ativado
    Wait Until Element Is Visible    ${loc_status_course}   10
    Element Should Be Visible    ${loc_status_course}
    Element Should Be Visible    ${loc_alter_status_course_active}
    Capture Page Screenshot
    
Clico em excluir curso
    Click Element   ${loc_delete_course} 
    Click Element   ${loc_confirm_delete_button}  
    Wait Until Element Is Visible  ${loc_success_msg}  10

Valido se o curso foi excluído
    Wait Until Element Is Not Visible   ${loc_success_msg}   10
    Page Should Not Contain   ${loc_name_course}
    Page Should Not Contain   ${loc_status_course}
    Page Should Not Contain   ${loc_alter_status_course_active}
    Page Should Not Contain   ${loc_delete_course}
    Page Should Not Contain   ${loc_alter_status_course_disabled}
    Page Should Not Contain   ${loc_status_course_inactive}
    Capture Page Screenshot
    
