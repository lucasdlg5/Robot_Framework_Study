#Instalar Robot (Ter instalado o Python Ver. 2.7)
#pip install robotframework

#Instalando Selenium Library para Web
#pip install --upgrade robotframework-seleniumlibrary

#Baixando Web Drivers (Sera quem reconhecerá quando for executado um teste automatizado)
#http://chromedriver.chromium.org/downloads (Chrome)
#https://github.com/mozilla/geckodriver/releases (Firefox)
#https://developer.microsoft.com/en-us/microsoft-edge/tools/webdriver/ (Edge)

#Apos baixado o Webdriver de preferencia, adicionar dentro da pasta de Scripts do Python dentro da pasta de instalação (somente o aplicativo executavel):
#Ex.: C:\Users\LUCASDOMINGOSLEAOGOM\AppData\Local\Programs\Python\Python37-32\Scripts 

#Executar o teste
#Local de execução CMD: Pasta Primeiro_Caso_Teste
#robot -d .\Primeiro_Caso_Teste\results .\Primeiro_Caso_Teste\tests\Loja_E-commerce.robot

#Executando somente um teste
#robot -t "Caso de uso 03 - Listar Produtos" -d .\Primeiro_Caso_Teste\results .\Primeiro_Caso_Teste\tests\Loja_E-commerce.robot

***Settings
Library     SeleniumLibrary
Resource  ../Resource/resource.robot
Test Setup          Abrir Navegador
Test Teardown       Fechar Navegador

***Variables
#Importado de Resource.robot

***Test Cases
Caso de uso 01 - Pesquisar Produtos Existentes
    Acessar página home do site
    Digitar o nome de produto "Blouse" no campo de pesquisa
    Clicar no botão de pesquisa
    O sistema deve exibir a tela com o resultado da pesquisa, listando o produto pesquisado

Caso de uso 02 - Pesquisar Produtos não Existentes
    Acessar página home do site
    Digitar o nome de produto "produtoNãoExistente" no campo de pesquisa
    Clicar no botão de pesquisa
    O sistema deve exibir a mensagem "No results were found for your search "produtoNãoExistente""

Caso de uso 03 - Listar Produtos
    Acessar página home do site
    Passar o mouse por cima da categoria "Women" no menu principal superior de categorias.
    As sub categorias devem ser exibidas
    Clicar na sub categoria "Summer Dresses"
    Uma página com os produtos da categoria selecionada deve ser exibida

Caso de uso 04 - Adicionar Produtos no Carrinho
    Acessar página home do site
    Digitar o nome de produto "Blouse" no campo de pesquisa
    Clicar no botão de pesquisa
    O sistema deve exibir a tela com o resultado da pesquisa, listando o produto pesquisado
    Clicar no botão "Add to cart" do produto
    Uma tela de confirmação deve ser exibida
    Clicar no botão "Proceed to checkout"
    A tela do carrinho de compras deve ser exibido, juntamente com os dados do produto adicionado e os devidos valores.

Caso de uso 05 - Remover Produtos
    Acessar página home do site
    Clicar no ícone carrinho de compras no menu superior direito
    A tela do carrinho de compras deve ser exibido
    Clicar no botão de remoção de produtos (delete) no produto do carrinho
    O sistema deve exibir a mensagem "Your shopping cart is empty."

Caso de uso 06 - Adicionar Cliente
    Acessar página home do site
    Clicar no botão superior direito “Sign in”
    A página para fazer login deve ser exibida
    Inserir um e-mail válido
    Clicar no botão "Create na account"
    A página com os campos de cadastro deve ser exibida
    Preencher os campos obrigatórios
    Clicar em "Register"para finalizar o cadastro
    A página de gerenciamento da conta deve ser exibida

***Keywords
O sistema deve exibir a tela com o resultado da pesquisa, listando o produto pesquisado
    Conferir o produto "Blouse" foi listado no site




    
