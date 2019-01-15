*** Settings ***
Library             SeleniumLibrary

#Como teremos keyworkds em um arquivo de resource, podemos importalos aqui
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
Caso de Teste 01: Pesquisar produto Existente
    Acessar página home do site
    Página home deve ser exibida
    Digitar o nome de produto "Blouse" no campo de pesquisa
    Clicar no botão de pesquisa
    O sistema deve exibir a tela com o resultado da pesquisa, listando o produto pesquisado


Caso de Teste 02: Pesquisar produto não existente
    Acessar página home do site
    Página home deve ser exibida
    Digitar o nome de produto "produtoNãoExistente" no campo de pesquisa.
    Clicar no botão de pesquisa
    Conferir mensarem de erro "No results were found for your search "produtoNãoExistente""


*** Keywords ***