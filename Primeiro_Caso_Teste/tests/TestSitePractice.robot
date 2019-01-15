*** Settings ***
#Library             SeleniumLibrary

#Como teremos keyworkds em um arquivo de resource, podemos importa-los aqui
Resource        ../Resource/resource.robot

#Setup e Teardown
#Setup: Roda Keywords antes da suite ou antes de um Teste
#Teardown: Roda Keywords depois de uma suite ou um teste

#Suite Setup         Abrir Navegador
Test Setup          Abrir Navegador
#Suite Teardown      Fechar Navegador
Test Teardown       Fechar Navegador

*** Variables ***
#Sera importado de Resources

*** Test Case ***
Cenário 01: Pesquisar produto Existente
    #[Setup]     Fechar navegador Firefox -- Apenas para este teste, na ira executar os Testes de Setup & Teardown PADRÕES
    #Dado que estou na página home do site
    #Quando eu pesquisar pelo produto "Blouse"
    #Então o produto "Blouse" deve ser listado na página de resultado da busca
    #[Teardown] Fechar Firefox

    Acessar página home do site
    Digitar o nome de produto "Blouse" no campo de pesquisa
    Clicar no botão de pesquisa
    Então o produto "Blouse" deve ser listado na página de resultado da busca


#Cenário 02: Pesquisar produto não existente
#    Dado que estou na página home do site
#    Quando eu pesquisar pelo produto "produtoNãoExistente"
#    Então a página deve exibir a mensagem "No results were found for your search "produtoNãoExistente""
#
#*** Keywords ***