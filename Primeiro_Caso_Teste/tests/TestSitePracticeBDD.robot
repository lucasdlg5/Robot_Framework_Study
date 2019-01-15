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
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "Blouse"
    Então o produto "Blouse" deve ser listado na página de resultado da busca

Caso de Teste 02: Pesquisar produto não existente
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "produtoNãoExistente"
    Então a página deve exibir a mensagem "No results were found for your search "produtoNãoExistente""

*** Keywords ***
#REUTILIZANDO AS KEYWORDS JA CRIADAS

#A FORMA ABAIXO PODEMOS REFERENCIAR AS KEYWORDS DO TESTE COM A RESOURCE
Dado que estou na página home do site
    Acessar página home do site

Quando eu pesquisar pelo produto "${PRODUTO}"
    Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Clicar no botão de pesquisa

Então o produto "${PRODUTO}" deve ser listado na página de resultado da busca
    Conferir o produto "${PRODUTO}" foi listado no site

Então a página deve exibir a mensagem "${MENSAGEM_ALERTA}"
    O sistema deve exibir a mensagem "${MENSAGEM_ALERTA}" 

