*** Settings ***
Documentation     Realizar o deferimento de uma solicitação de relatório pelo coordenador de curso

Resource         ../Resources/Keywords/Common.robot
Resource         ../Resources/Keywords/ListRequest.robot
Resource         ../Resources/Keywords/ListRequestStudent.robot
Resource         ../Resources/Keywords/ListReport.robot
Resource         ../Resources/Keywords/DetailsRequestInternship.robot


Suite Setup       Abrir navegador
Suite Teardown    Fechar navegador

*** Test Cases ***
Test Case 01: Acessa Minha conta do usuário
    Verifico o status da requisição de estágio
    Acesso a home page
    Realizo o login como "coordenador"
    Valido se as opções da Home são corretamente apresentadas

Test Case 02: Acessa a lista com as solicitações de relatórios
    Clico em ir para solicitações de relatório
    Valido se a lista de relatório é corretamente carregada

Test Case 03: Realizo o deferimento da solicitação de relatório 
    Clico em analisar relatório
    Valido as informações e como "coordenador" defiro a solicitação de relatório

Test Case 04: Verifico se a solicitação de relatório está finalizada 
    Acesso a home page
    Realizo o login como "aluno"
    Valido se a Home é corretamente apresentada
    Valido se a solicitação de estágio consta como finalizada
    Executo a higienização do bando de dados excluindo a requisição finalizada

    
