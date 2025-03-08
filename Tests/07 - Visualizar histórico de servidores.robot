*** Settings ***
Documentation     Consultar histórico de servidores.

Resource         ../Resources/Keywords/Common.robot
Resource         ../Resources/Keywords/ListRequest.robot
Resource         ../Resources/Keywords/UserManagement.robot
Resource         ../Resources/Keywords/UserManagementForm.robot
Resource         ../Resources/Keywords/ListServer.robot




Suite Setup       Abrir navegador
Suite Teardown    Fechar navegador

*** Test Cases ***
Test Case 01: Acessa Minha conta do usuário
    Acesso a home page
    Realizo o login como "servidor"
    Valido se as opções da Home são corretamente apresentadas

Test Case 02: Acessa a página de gerenciamento de usuários
    Clico na opção para gerenciar usuários
    Clico na opção servidores
    Valido se a opção Lista dos servidores é apresentada

Test Case 03: Visualizo a listagem de servidores
    Clico em mostrar histórico de servidores

Test Case 04: Visualizo o histórico de servidores
    Valido se é apresentado o histórico de servidores




    
