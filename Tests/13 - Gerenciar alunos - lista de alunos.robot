*** Settings ***
Documentation     Consultar lista de alunos.

Resource         ../Resources/Keywords/Common.robot
Resource         ../Resources/Keywords/ListRequest.robot
Resource         ../Resources/Keywords/UserManagement.robot
Resource         ../Resources/Keywords/ListStudent.robot




Suite Setup       Abrir navegador
Suite Teardown    Fechar navegador

*** Test Cases ***
Test Case 01: Acessa Minha conta do usuário
    Acesso a home page
    Realizo o login como "servidor"
    Valido se as opções da Home são corretamente apresentadas

Test Case 02: Acessa a página de gerenciamento de usuários
    Clico na opção para gerenciar usuários
    Clico na opção alunos

Test Case 03: Visualizo a listagem de alunos
    Valido se a tabela com a lista de alunos é carrregada




    
