#Este e a IMPLEMETAÇÃO das Keywords, não terá TESTES

#Comando para rodar: robot -d ./results tests\TestSitePractice.robot
#robot tests\TestSitePractice.robot

*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}      http://automationpractice.com/index.php
${BROWSER}  chrome

*** Keywords ***
### Setup e Teardown
#As palavas do Keyword aqui foram definidas nos arquivos de tese
Abrir Navegador
    Open Browser    ${URL}  ${BROWSER}

Fechar Navegador
    Close Browser  

###Passo a passo
Acessar página home do site
    Go to  ${URL}
    Title Should be     My Store

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text  name=search_query   ${PRODUTO}

Clicar no botão de pesquisa
    Click Element   name=submit_search

Então o produto "${PRODUTO}" deve ser listado na página de resultado da busca
    #Colocar uma espera para que a pagina carrege antes para que prossiga com os testes
    Wait until Element Is Visible   css=#center_column > h1
    Title Should Be     Search - My Store
    Page Should Contain Image   xpath=//*[@id="center_column"]//*[@src="http://automationpractice.com/img/p/7/7-home_default.jpg"]
    
    #Pesquisa usando CTRL + F
    #Inicio
    #//*[@id="center_column"]/ul/li/div/div[2]/h5/a
    #Podemos retirar:         ul/li/div/div[2]/h5
    #Ficando: //*[@id="center_column"]//a -- Deixando sempre o // entre o que foi retirado
    #Final
    #//*[@id="center_column"]//a[@class="product-name"][contains(text(),"${PRODUTO}")]
    #[contains(text(),"${PRODUTO}")] -- Faz uma consulta se contém um nome com o texxto de "Blouse" sobre o item selecionado
    Page Should Contain Link    xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),"${PRODUTO}")]

Então a página deve exibir a mensagem "No results were found for your search "${PRODUTO}""
    #Colocar uma espera para que a pagina carrege antes para que prossiga com os testes
    Wait until Element Is Visible   css=#center_column > h1
    Title Should Be     Search - My Store
    Wait Until Page Contains Element  xpath=//*[@id="center_column"]//p[contains(text(),"${PRODUTO}")]