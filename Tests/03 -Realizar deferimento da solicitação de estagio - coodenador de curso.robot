*** Settings ***
Documentation     Realizar o deferimento de uma solicitação de estágio pelo coordenador de curso

Resource         ../Resources/Keywords/Common.robot
Resource         ../Resources/Keywords/ListRequest.robot
Resource         ../Resources/Keywords/DetailsRequestInternship.robot


Suite Setup       Abrir navegador
Suite Teardown    Fechar navegador

*** Test Cases ***
Test Case 01: Acessa Minha conta do usuário
    Acesso a home page
    Realizo o login como "coordenador"
    Valido se as opções da Home são corretamente apresentadas

Test Case 02: Acessa a lista com as solicitações de estágios
    Clico em ir para solicitações de estágio
    Valido se a lista de solicitações é corretamente carregada

Test Case 03: Realizo o deferimento da solicitação de estágio 
    Clico em analisar
    Valido as informações e como "coordenador" defiro a solicitação de estágio

    
