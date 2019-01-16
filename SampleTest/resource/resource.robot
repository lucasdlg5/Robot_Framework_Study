#robot -d Roche_Test_Appium/results Roche_Test_Appium/tests/test.robot

*** Settings ***
Library     AppiumLibrary

*** Variables ***

${APK}      C:/Users/ldgomes/Desktop/Projetos/Robot_Framework_Study/SampleTest/APK/sample_app.apk
#${DEVICE_NAME}      Pixel_2_API_24_Nougat_7.0
#${DEVICE_NAME}      e31fd004
${DEVICE_NAME}      Moto_G__5S__Plus
${SERVER}   localhost:4723/wd/hub
${APP_NAME}     com.example.helloworld
#${APP_NAME}     rocheapp

*** Keywords ***

Abrir Aplicacao
    Open Application     ${SERVER}  platformName=Android    deviceName=${DEVICE_NAME}   app=${APK}

Fechar Aplicacao
    Close Application  

#Abrir pagina de login

Checar imagem logotipo
    Wait Until Element Is Visible   id=txt_username

Digitar login
    Input Text  id=txt_username   lucasdlg