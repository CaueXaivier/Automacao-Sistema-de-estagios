*** Settings ***
Documentation     Cadastro de um novo servidor.

Resource         ../Resources/Keywords/Common.robot
Resource         ../Resources/Keywords/ListRequest.robot
Resource         ../Resources/Keywords/UserManagement.robot
Resource         ../Resources/Keywords/UserManagementForm.robot
Resource         ../Resources/Keywords/ListServer.robot




Suite Setup       Abrir navegador
Suite Teardown    Fechar navegador

*** Test Cases ***
Test Case 01: Acessa Minha conta do usuário
    Executo a higienazação do banco de dados excluindo o servidor
    Acesso a home page
    Realizo o login como "servidor"
    Valido se as opções da Home são corretamente apresentadas

Test Case 02: Acessa o formulário para cadastrar nova solicitação de estágio
    Clico na opção para gerenciar usuários
    Clico na opção servidores
    Valido se o formulário para cadastro de servidor é corretamente apresentado

Test Case 03: Realizo o cadastro de um novo servidor
    Preencho o formulário de cadastro do servidor
    Valido se o servidor foi cadastrado com sucesso

Test Case 04: Realizo a higienização do banco de dados
   Executo a higienazação do banco de dados excluindo o servidor


    
