*** Settings ***
Documentation     Realizar o indeferimento de uma solicitação de estágio pelo setor de estágios

Resource         ../Resources/Keywords/Common.robot
Resource         ../Resources/Keywords/ListRequest.robot
Resource         ../Resources/Keywords/DetailsRequestInternship.robot
Resource         ../Resources/Keywords/ListRequestStudent.robot
Resource         ../Resources/Keywords/RequestInternship.robot


Suite Setup       Abrir navegador
Suite Teardown    Fechar navegador

*** Test Cases ***
Test Case 01: Acessa Minha conta do usuário
    Executo a higienização do bando de dados
    Acesso a home page
    Realizo o login como "aluno"
    Valido se a Home é corretamente apresentada
    Clico no botão para criar uma nova solicitação
    Valido se o formulário é corretamente apresentado
    Preencho o formulário de cadastro
    Valido se a nova solicitação de estágio "Obrigatório" foi registrada com sucesso

Test Case 02: Acessa Minha conta do usuário
    Acesso a home page
    Realizo o login como "servidor"
    Valido se as opções da Home são corretamente apresentadas

Test Case 03: Acessa a lista com as solicitações de estágios
    Clico em ir para solicitações de estágio
    Valido se a lista é corretamente carregada

Test Case 04: Realizo o indeferimento da solicitação de estágio 
    Clico em analisar
    Clico em indeferir
    Valido se a solicitação de estágio consta como indeferida
    Executo a higienização do bando de dados

    
