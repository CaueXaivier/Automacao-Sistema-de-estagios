*** Settings ***
Documentation     Realizar o deferimento de uma solicitação de cancelamento pelo diretor

Resource         ../Resources/Keywords/Common.robot
Resource         ../Resources/Keywords/ListCancellation.robot
Resource         ../Resources/Keywords/ListRequest.robot
Resource         ../Resources/Keywords/DetailsRequestInternship.robot


Suite Setup       Abrir navegador
Suite Teardown    Fechar navegador

*** Test Cases ***
Test Case 01: Acessa Minha conta do usuário
    Verifico se existe requisição de estágio apto para cancelamento pelo diretor
    Acesso a home page
    Realizo o login como "diretor"
    Valido se as opções da Home são corretamente apresentadas

Test Case 02: Acessa a lista com as solicitações de cancelamento
    Clico em ir para solicitações de cancelamento
    Valido se a lista de cancelamentos é corretamente carregada

Test Case 03: Realizo o deferimento da solicitação de cancelamento
    Clico em analisar cancelamento
    Valido as informações e como "diretor" defiro a solicitação de cancelamento

Test Case 04: Verifico se a solicitação de cancelamento está em análise
    Acesso a home page
    Realizo o login como "servidor"
    Valido se as opções da Home são corretamente apresentadas
    Clico em ir para solicitações de cancelamento
    Valido se a solicitação deferida pelo "diretor" consta como em análise
    Executo a higienização do bando de dados excluindo o cancelamento aprovado

    
