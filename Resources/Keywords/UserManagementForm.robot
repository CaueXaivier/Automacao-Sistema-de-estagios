***Settings***


Variables   ../Locators/UserManagementForm.py
Variables    ../TestData/Testdata.py
Library    SeleniumLibrary



***Keywords***

Valido se o formulário para cadastro de servidor é corretamente apresentado
    Wait Until Element Is Visible   ${loc_title_form}   10
    Element Should Be Visible       ${loc_list_server_button}
    Element Should Be Visible       ${loc_unlock_email_button}
    Element Should Be Visible       ${loc_position_select}
    Element Should Be Visible       ${loc_name_input}
    Element Should Be Visible       ${loc_email_input}
    Element Should Be Visible       ${loc_course_select}
    Element Should Be Visible       ${loc_pwd_input}
    Element Should Be Visible       ${loc_pwd_confirm_input}
    Element Should Be Visible       ${loc_register_button}
    Capture Page Screenshot
    

Preencho o formulário de cadastro do servidor
    Click Element   ${loc_position_select}
    Click Element   ${loc_position_option}
    Input Text      ${loc_name_input}    ${NAME_SERVER_REGISTER}   
    Input Text      ${loc_email_input}   ${EMAIL_SERVER_REGISTER} 
    Input Text      ${loc_pwd_input}   ${USER_PASSWORD} 
    Input Text      ${loc_pwd_confirm_input}   ${USER_PASSWORD}
    Capture Page Screenshot 
    Click Element   ${loc_register_button}
    Wait Until Element Is Visible  ${loc_success_msg}   10

Valido se a opção Lista dos servidores é apresentada
    Wait Until Element Is Visible   ${loc_title_form}   10
    Element Should Be Visible       ${loc_list_server_button}
    Element Should Be Visible       ${loc_unlock_email_button}
    Capture Page Screenshot

