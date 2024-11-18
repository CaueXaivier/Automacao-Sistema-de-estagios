***Settings***


Variables   ../Locators/UserManagement.py
Library    SeleniumLibrary


***Keywords***

Clico na opção servidores
    Wait Until Element Is Visible   ${loc_management_user_server}
    Element Should Be Visible       ${loc_management_user_server}
    Element Should Be Visible       ${loc_management_user_student}
    Element Should Be Visible       ${loc_header_opportunities}
    Element Should Be Visible       ${loc_header_courses}
    Element Should Be Visible       ${loc_header_user_management}
    Element Should Be Visible       ${loc_header_list_interns}
    Element Should Be Visible       ${loc_header_requests}
    Capture Page Screenshot
    Click Element   ${loc_management_user_server}

Clico na opção alunos
    Wait Until Element Is Visible   ${loc_management_user_server}
    Element Should Be Visible       ${loc_management_user_server}
    Element Should Be Visible       ${loc_management_user_student}
    Element Should Be Visible       ${loc_header_opportunities}
    Element Should Be Visible       ${loc_header_courses}
    Element Should Be Visible       ${loc_header_user_management}
    Element Should Be Visible       ${loc_header_list_interns}
    Element Should Be Visible       ${loc_header_requests}
    Capture Page Screenshot
    Click Element   ${loc_management_user_student}
