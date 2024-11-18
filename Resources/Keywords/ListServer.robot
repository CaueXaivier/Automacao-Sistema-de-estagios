***Settings***


Variables   ../Locators/UserManagementForm.py
Variables   ../Locators/ListServer.py
Variables    ../TestData/Testdata.py
Library    SeleniumLibrary



***Keywords***

Valido se o servidor foi cadastrado com sucesso
    Wait Until Element Is Visible   ${loc_title_form}   10
    Click Element       ${loc_list_server_button}
    Wait Until Element Is Visible   ${loc_title_list}   10
    Wait Until Element Is Visible   ${loc_name_server} 
    Element Should Be Visible   ${loc_name_server}
    Element Should Be Visible   ${loc_email_server}
    Element Should Be Visible   ${loc_position_server}
    Element Should Be Visible   ${loc_course_server}
    Element Should Be Visible   ${loc_delete_button}
    Capture Page Screenshot

Valido se a tabela com a lista de servidores é carrregada
    Wait Until Element Is Visible   ${loc_title_form}   10
    Click Element       ${loc_list_server_button}
    Wait Until Element Is Visible   ${loc_title_list}   10
    Wait Until Element Is Visible   ${loc_name_server_list} 
    Element Should Be Visible   ${loc_name_server_list}
    Element Should Be Visible   ${loc_email_server_list}
    Element Should Be Visible   ${loc_position_server_list}
    Element Should Be Visible   ${loc_course_server_list}
    Element Should Be Visible   ${loc_delete_button_list}
    Capture Page Screenshot

Clico em mostrar histórico de servidores
    Click Element       ${loc_list_server_button}
    Wait Until Element Is Visible   ${loc_server_history}   10
    Click Element       ${loc_server_history}

Valido se é apresentado o histórico de servidores
    Wait Until Element Is Visible   ${loc_server_list}   10
    Element Should Be Visible       ${loc_filter_course}
    Wait Until Element Is Visible   ${loc_id_server_history} 
    Element Should Be Visible   ${loc_id_server_history}
    Element Should Be Visible   ${loc_name_server_history}
    Element Should Be Visible   ${loc_course_server_history}
    Element Should Be Visible   ${loc_action_server_history}
    Element Should Be Visible   ${loc_date_server_history}
    Capture Page Screenshot


Clico na opção para excluir servidor
    Click Element   ${loc_delete_button_server_delete}
    Click Element   ${loc_confirm_delete_button}

Valido se o servidor foi excluído
    Wait Until Element Is Not Visible  ${loc_name_server_delete}   10
    Element Should Not Be Visible   ${loc_name_server_delete}
    Element Should Not Be Visible  ${loc_email_server_delete}
    Element Should Not Be Visible   ${loc_position_server_delete}
    Element Should Not Be Visible   ${loc_course_server_delete}
    Element Should Not Be Visible   ${loc_delete_button_server_delete}
    Capture Page Screenshot
    
    
    

