***Settings***


Variables   ../Locators/ListRequestStudent.py
Variables   ../Locators/Commom.py
Variables    ../TestData/Testdata.py
Library    SeleniumLibrary

***Keywords***

Clico no botão para criar uma nova solicitação
    Click Element  ${loc_new_request}

Valido se a nova solicitação de estágio "${TYPE_INTERNSHIP}" foi registrada com sucesso
    Run Keyword And Ignore Error   Wait Until Element Is Visible   ${loc_status_new_request}  10
    Element Should Contain     ${loc_status_new_request}      Nova
    Element Should Contain     ${loc_title_internship}      Solicitação de estágio ${TYPE_INTERNSHIP}
    Element Should Contain     ${loc_cont_internship}    Data da solicitação: ${INIT_INTERNSHIP}
    Element Should Contain     ${loc_cont_internship}    Empresa: ${NAME_ENTERPRISE}
    Element Should Contain     ${loc_edit_doc_button}     Editar documentos
    Element Should Contain     ${loc_details_request}     Detalhes
    Capture Page Screenshot

Valido se a solicitação de estágio consta como aprovada
    ${status_request}=   Run Keyword And Return Status  Element Should Be Visible   ${loc_status_processing_request}
    WHILE  ${status_request}    limit=15
        Sleep  15
        Reload Page
        ${status_request}=   Run Keyword And Return Status  Element Should Be Visible   ${loc_status_processing_request}
    END    
    Wait Until Element Is Visible   ${loc_status_approved_request}  10
    Element Should Contain     ${loc_status_approved_request}      Aprovado
    Page Should Contain Element   ${loc_send_report_button}
    Page Should Contain Element   ${loc_download_docs_button}
    Capture Page Screenshot
    Click Element   ${loc_details_request}
    Wait Until Element Is Visible   ${loc_status_approved_request}  10
    Element Should Contain     ${loc_approved_details_request}      Aprovado
    Element Should Be Visible   ${loc_step1_details_request}
    Element Should Be Visible  ${loc_step2_details_request}
    Element Should Be Visible   ${loc_step3_details_request}
    Element Should Be Visible   ${loc_step4_details_request}
    Element Should Be Visible   ${loc_step5_details_request}
    Element Should Be Visible   ${loc_completed_details_request}
    Capture Page Screenshot

Realizo logout do sistema
    Click Element  ${loc_logout}
    Wait Until Element Is Visible   ${loc_email_field}

Valido se a solicitação de estágio consta como finalizada
    Wait Until Element Is Visible   ${loc_status_finished_report}  10
    Element Should Contain     ${loc_status_finished_report}      Finalizado
    Page Should Not Contain   ${loc_send_report_button}
    Page Should Contain Element   ${loc_download_docs_button}
    Capture Page Screenshot
    Click Element   ${loc_details_report}
    Wait Until Element Is Visible   ${loc_finished_details_request}  10
    Element Should Contain     ${loc_finished_details_request}      Finalizado
    Element Should Be Visible   ${loc_step1_details_request}
    Element Should Be Visible  ${loc_step2_details_request}
    Element Should Be Visible   ${loc_step3_details_request}
    Element Should Be Visible   ${loc_step4_details_request}
    Element Should Be Visible   ${loc_step5_details_request}
    Capture Page Screenshot

Valido se a solicitação de renovação consta como aprovada
    ${status_request}=   Run Keyword And Return Status  Element Should Be Visible   ${loc_status_processing_request}
    WHILE  ${status_request}    limit=15
        Sleep  15
        Reload Page
        ${status_request}=   Run Keyword And Return Status  Element Should Be Visible   ${loc_status_processing_request}
    END    
    Wait Until Element Is Visible   ${loc_status_approved_renewal}  10
    Element Should Contain     ${loc_status_approved_renewal}      Aprovado
    Page Should Contain Element   ${loc_send_report_button}
    Page Should Contain Element   ${loc_download_docs_button}
    Capture Page Screenshot
    Click Element   ${loc_details_renewal}
    Wait Until Element Is Visible   ${loc_approved_details_request}  10
    Element Should Contain     ${loc_approved_details_request}      Aprovado
    Element Should Be Visible   ${loc_step1_details_request}
    Element Should Be Visible  ${loc_step2_details_request}
    Element Should Be Visible   ${loc_step3_details_request}
    Element Should Be Visible   ${loc_step4_details_request}
    Element Should Be Visible   ${loc_step5_details_request}
    Element Should Be Visible   ${loc_completed_details_request}
    Capture Page Screenshot

Valido se a solicitação de aproveitamento consta como aprovada 
   ${status_request}=   Run Keyword And Return Status  Element Should Be Visible   ${loc_status_processing_request}
    WHILE  ${status_request}    limit=15
        Sleep  15
        Reload Page
        ${status_request}=   Run Keyword And Return Status  Element Should Be Visible   ${loc_status_processing_request}
    END 
    Wait Until Element Is Visible   ${loc_status_approved_credit}  10
    Element Should Contain     ${loc_status_approved_credit}      Aprovado
    Page Should Contain Element   ${loc_send_report_button}
    Page Should Contain Element   ${loc_download_docs_button}
    Capture Page Screenshot
    Click Element   ${loc_details_credit }
    Wait Until Element Is Visible   ${loc_approved_details_request}  10
    Element Should Contain     ${loc_approved_details_request}      Aprovado
    Element Should Be Visible   ${loc_step1_details_request}
    Element Should Be Visible  ${loc_step2_details_request}
    Element Should Be Visible   ${loc_step3_details_request}
    Element Should Be Visible   ${loc_step4_details_request}
    Element Should Be Visible   ${loc_step5_details_request}
    Element Should Be Visible   ${loc_completed_details_request}
    Capture Page Screenshot







