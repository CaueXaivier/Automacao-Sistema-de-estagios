*** Settings ***
Documentation     Gerenciamento de cursos - desativar curso.

Resource         ../Resources/Keywords/Common.robot
Resource         ../Resources/Keywords/ListRequest.robot
Resource         ../Resources/Keywords/ListCourse.robot





Suite Setup       Abrir navegador
Suite Teardown    Fechar navegador

*** Test Cases ***
Test Case 01: Acessa Minha conta do usuário
    Verifico se existe curso ativo
    Acesso a home page
    Realizo o login como "servidor"
    Valido se as opções da Home são corretamente apresentadas

Test Case 02: Acessa a página de gerenciamento de cursos
    Clico no menu cursos
    Valido se a lista de curso é carregada corretamente

Test Case 03: Realizo a desativação do curso
    Clico em desativar curso
    Valido se o curso foi desativado






    
