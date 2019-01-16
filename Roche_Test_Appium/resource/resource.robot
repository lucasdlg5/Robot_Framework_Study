#robot -d Roche_Test_Appium\results Roche_Test_Appium\tests\test.robot

#Este e a IMPLEMETAÇÃO das Keywords, não terá TESTES

#Comando para rodar especificado local para os resultados: robot -d ./results tests/TestSitePractice.robot

#Padrao
#robot tests/TestSitePractice.robot

#Usando um browser especifico
#robot -v BROWSER:firefox tests/TestSitePractice.robot

#Executando um teste em especifico
#robot -t "Cenário 01: Pesquisar produto Existente" tests/TestSitePractice.robot

#Multiplos parametros
#robot -t "Cenário 02: Pesquisar produto não existente" -v BROWSER:firefox -d ./results tests/TestSitePractice.robot

*** Settings ***
Library     AppiumLibrary

*** Variables ***


${APK}      C:/Users/ldgomes/Desktop/Projetos/Robot_Framework_Study/Roche_Test_Appium/APK/roche.apk
#${DEVICE_NAME}      Pixel_2_API_24_Nougat_7.0
#${DEVICE_NAME}      e31fd004
${DEVICE_NAME}      Moto_G__5S__Plus
${SERVER}   127.0.0.1:4723/wd/hub
${APP_NAME}     Roche Casos Clinicos
#${APP_NAME}     rocheapp




*** Keywords ***

Abrir Aplicacao
    Open Application     ${SERVER}  platformName=Android    deviceName=${DEVICE_NAME}   app=${APK}

Fechar Aplicacao
    Close Application  

#Abrir pagina de login
    

Checar imagem logotipo
    # Wait Until Element Is Visible  xpath=/html/body/ion-app/ng-component/ion-nav/page-login/ion-content/div[2]/div[1]/ion-grid/ion-row[1]/ion-col/img
    # Wait Until Element Is Visible  css=ion-row:nth-child(1) > ion-col
    Wait Until Element Is Visible  id=robot2
    # Page Should Contain Element     xpath=/html/body/ion-app/ng-component/ion-nav/page-login/ion-content/div[2]/div[1]/ion-grid/ion-row[1]/ion-col/img
    # Page Should Contain Element     css=ion-row:nth-child(1) > ion-col

Digitar login
    # Input Text      xpath=/html/body/ion-app/ng-component/ion-nav/page-login/ion-content/div[2]/div[1]/ion-grid/ion-row[2]/ion-col/ion-list/ion-item[1]/div[1]/div/ion-input/input      lucasdlg
    # Input Text      css=ion-input > input      lucasdlg
    Input Text      id=robot1      lucasdlg