*** Settings ***
Documentation     Cadastro de nova solicitação de estágio.

Resource         ../Resources/Keywords/Common.robot
Resource         ../Resources/Keywords/ListRequestStudent.robot
Resource         ../Resources/Keywords/RequestInternship.robot


Suite Setup       Abrir navegador
Suite Teardown    Fechar navegador

*** Test Cases ***
Test Case 01: Acessa Minha conta do usuário
    Executo a higienazação do bando de dados
    Acesso a home page
    Realizo o login como "aluno"
    Valido se a Home é corretamente apresentada

Test Case 02: Acessa o formulário para cadastrar nova solicitação de estágio
    Clico no botão para criar uma nova solicitação
    Valido se o formulário é corretamente apresentado

Test Case 03: Acessa Detalhes de um pedido
    Preencho o formulário de cadastro
    Valido se a nova solicitação de estágio "Obrigatório" foi registrada com sucesso

    
