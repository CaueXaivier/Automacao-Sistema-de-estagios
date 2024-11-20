*** Settings ***
Documentation     Realizar o deferimento de uma solicitação de renovação pelo diretor

Resource         ../Resources/Keywords/Common.robot
Resource         ../Resources/Keywords/ListRequestStudent.robot
Resource         ../Resources/Keywords/ListRenewals.robot
Resource         ../Resources/Keywords/ListRequest.robot
Resource         ../Resources/Keywords/DetailsRequestInternship.robot


Suite Setup       Abrir navegador
Suite Teardown    Fechar navegador

*** Test Cases ***
Test Case 01: Acessa Minha conta do usuário
    Verifico o status da requisição de renovação para "diretor"
    Acesso a home page
    Realizo o login como "diretor"
    Valido se as opções da Home são corretamente apresentadas

Test Case 02: Acessa a lista com as solicitações de renovação
    Clico em ir para solicitações de renovação
    Valido se a lista de renovações é corretamente carregada

Test Case 03: Realizo o deferimento da solicitação de renovação 
    Clico em analisar renovação
    Valido as informações e como "diretor" defiro a solicitação de renovação

Test Case 04: Verifico se a solicitação de relatório está aprovada 
    Acesso a home page
    Realizo o login como "aluno"
    Valido se a Home é corretamente apresentada
    Valido se a solicitação de renovação consta como aprovada
    Executo a higienização do bando de dados excluindo a renovação aprovada

    
