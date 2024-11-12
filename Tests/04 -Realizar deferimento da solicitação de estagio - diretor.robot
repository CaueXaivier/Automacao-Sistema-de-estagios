*** Settings ***
Documentation     Realizar o deferimento de uma solicitação de estágio pelo diretor

Resource         ../Resources/Keywords/Common.robot
Resource         ../Resources/Keywords/ListRequest.robot
Resource         ../Resources/Keywords/ListRequestStudent.robot
Resource         ../Resources/Keywords/DetailsRequestInternship.robot


Suite Setup       Abrir navegador
Suite Teardown    Fechar navegador

*** Test Cases ***
Test Case 01: Acessa Minha conta do usuário
    Acesso a home page
    Realizo o login como "diretor"
    Valido se as opções da Home são corretamente apresentadas

Test Case 02: Acessa a lista com as solicitações de estágios
    Clico em ir para solicitações de estágio
    Valido se a lista de solicitações é corretamente carregada

Test Case 03: Realizo o deferimento da solicitação de estágio 
    Clico em analisar
    Valido as informações e como "diretor" defiro a solicitação de estágio

Test Case 04: confirmo se a solicitação de está deferida 
    Realizo o login como "aluno"
    Valido se a solicitação de estágio consta como aprovada

    
