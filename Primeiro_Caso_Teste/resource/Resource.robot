#Este e a IMPLEMETAÇÃO das Keywords, não terá TESTES

#Comando para rodar especificado local para os resultados: robot -d ./results tests\TestSitePractice.robot

#Padrao
#robot tests\TestSitePractice.robot

#Usando um browser especifico
#robot -v BROWSER:firefox tests\TestSitePractice.robot

#Executando um teste em especifico
#robot -t "Cenário 01: Pesquisar produto Existente" tests\TestSitePractice.robot

#Multiplos parametros
#robot -t "Cenário 02: Pesquisar produto não existente" -v BROWSER:firefox -d ./results tests\TestSitePractice.robot

*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}      http://automationpractice.com/index.php
${BROWSER}  chrome 
#Para usar os navegadores, pecisamos baixar o WEBDRIVER e inserir na pasta de SCRIPTS detro da pasta do PYTHON
#C:\Users\ldgomes\appdata\local\programs\python\Python37-32\Scripts

*** Keywords ***
### Setup e Teardown
#As palavas do Keyword aqui foram definidas nos arquivos de tese
Abrir Navegador
    Open Browser    about:blank  ${BROWSER}

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

Conferir o produto "${PRODUTO}" foi listado no site
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

#Então a página deve exibir a mensagem "No results were found for your search "${PRODUTO}""
#    #Colocar uma espera para que a pagina carrege antes para que prossiga com os testes
#    Wait until Element Is Visible   css=#center_column > h1
#    Title Should Be     Search - My Store
#    Wait Until Page Contains Element  xpath=//*[@id="center_column"]//p[contains(text(),"${PRODUTO}")]

O sistema deve exibir a mensagem "${MENSAGEM_ALERTA}" 
    #Colocar uma espera para que a pagina carrege antes para que prossiga com os testes
    Wait until Element Is Visible    xpath=//*[@id="center_column"]//p[@class='alert alert-warning']
    Element Text Should Be  xpath=//*[@id="center_column"]//p[@class='alert alert-warning']  ${MENSAGEM_ALERTA}

Clicar no botão "${TEXTO_BOTAO}" do produto
    Page Should Contain Element   css=#center_column > ul > li > div
    Mouse Over      css=#center_column > ul > li > div
    Click Link     css=#center_column > ul > li > div > div.right-block > div.button-container > a.button.ajax_add_to_cart_button.btn.btn-default

Uma tela de confirmação deve ser exibida
    Wait until Element Is Visible   css=#layer_cart > div.clearfix > div.layer_cart_product.col-xs-12.col-md-6 > h2
    Page Should Contain Image       xpath=//*[@id="layer_cart"]//img[@src="http://automationpractice.com/img/p/7/7-home_default.jpg"]
    # Page Should Contain Button      css=#layer_cart > div.clearfix > div.layer_cart_cart.col-xs-12.col-md-6 > div.button-container > a

# Tela Carrinho
#     Wait until Element Is Visible  name=cart_title
#     Page should contain Element     xpath=//*[@id="cart_title"]/text()

Passar o mouse por cima da categoria "${CATEGORIA}" no menu principal superior de categorias.
    Mouse Over  css=#block_top_menu > ul > li:nth-child(1) > a

As sub categorias devem ser exibidas
    Mouse Over  css=#block_top_menu > ul > li:nth-child(1) > a
    Page should contain Element     css=#block_top_menu > ul > li:nth-child(1) > ul > li:nth-child(1) > a

Clicar na sub categoria "${CATEGORIA}"
    Mouse Over  css=#block_top_menu > ul > li:nth-child(1) > a
    Wait Until Element Is Visible         css=#block_top_menu > ul > li:nth-child(1) > ul > li:nth-child(2) > ul > li:nth-child(3) > a 
    Click Element   css=#block_top_menu > ul > li:nth-child(1) > ul > li:nth-child(2) > ul > li:nth-child(3) > a

Uma página com os produtos da categoria selecionada deve ser exibida
    Page should contain Element     xpath=//*[@id="center_column"]//span[contains(text(),"Summer Dresses")]

Clicar no botão "Proceed to checkout"
    Click Link  css=#layer_cart > div.clearfix > div.layer_cart_cart.col-xs-12.col-md-6 > div.button-container > a

A tela do carrinho de compras deve ser exibido, juntamente com os dados do produto adicionado e os devidos valores.
    # Page should contains Element    xpath=//*[@id="cart_title"][contains(text(),"Shopping-cart summary")]
    Page should contain Element    xpath=//*[@id="cart_title"]/span
    Page should contain Image    xpath=//*[@id="product_2_7_0_0"]//img[@src="http://automationpractice.com/img/p/7/7-small_default.jpg"]
    Page should contain Element   xpath=//*[@id="total_price"][contains(text(),"$29.00")]