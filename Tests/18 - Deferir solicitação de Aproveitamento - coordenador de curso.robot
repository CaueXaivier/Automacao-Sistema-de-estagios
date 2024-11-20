*** Settings ***
Documentation     Realizar o deferimento de uma solicitação de aproveitamento pelo coordenador de curso

Resource         ../Resources/Keywords/Common.robot
Resource         ../Resources/Keywords/ListRequest.robot
Resource         ../Resources/Keywords/DetailsRequestInternship.robot
Resource         ../Resources/Keywords/ListRequestStudent.robot


Suite Setup       Abrir navegador
Suite Teardown    Fechar navegador

*** Test Cases ***
Test Case 01: Acessa Minha conta do usuário
    Verifico se existe solicitação de aproveitamento
    Acesso a home page
    Realizo o login como "coordenador"
    Valido se as opções da Home são corretamente apresentadas

Test Case 02: Acessa a lista com as solicitações de aproveitamento
    Clico em ir para solicitações de estágio
    Valido se a lista de solicitações é corretamente carregada

Test Case 03: Realizo o deferimento da solicitação de aproveitamento
    Clico em analisar
    Valido as informações e como "coordenador" defiro a solicitação de aproveitamento

Test Case 04: Verifico se a solicitação de aproveitamento está finalizada
    Acesso a home page
    Realizo o login como "aluno"
    Valido se a Home é corretamente apresentada
    Valido se a solicitação de aproveitamento consta como aprovada
    Executo a higienização do bando de dados excluindo a requisição de aproveitamento

    
