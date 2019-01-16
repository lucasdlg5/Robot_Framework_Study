***Settings
Library           AppiumLibrary
Resource  ../resource/resource.robot
Test Setup          Abrir Aplicacao
Test Teardown       Fechar Aplicacao

***Variables

***Test Cases
Test Case 01
    Checar imagem logotipo
    Digitar login e senha
    Clicar no botão para logar
    #Verificar se há conteudo na proxima tela

***Keywords

Verificar se há conteudo na proxima tela
    Verificar pos-login