*** Settings ***
Library    Browser
Library    FakerLibrary
Library    DateTime


*** Variables ***
${BROWSER}                        chromium
${HEADLESS}                       ${False} 
${SITE_DASHBOARD_STAGING}         https://dashboard-s.grouplinknetwork.com/login
${Get Cookies}                    //h5[@class='MuiTypography-root MuiTypography-h5 css-i6vjuv'][contains(.,'accept all cookies')]


*** Keywords ***
Abrir o navegador
    New Browser    browser=${BROWSER}
    ...            headless=${HEADLESS}
    
    ${TRACE_NAME}    FakerLibrary.Uuid 4
    ${NOW}           Get Current Date    result_format=%d-%m-%y_%H%m%S
    New Context      viewport= {'width': 1280, 'height': 720}
    # ...              tracing=${OUTPUT_DIR}/evidencies/traces/${NOW}/${TRACE_NAME}.zip
    # ...              recordVideo={'dir':'${OUTPUT_DIR}/evidencies/videos/${NOW}'}

Ir para o site dashboard group link network
    ${old_timeout} =    Set Browser Timeout    1m 30 seconds
    New Page       url=${SITE_DASHBOARD_STAGING}
    Set Browser Timeout    ${old_timeout}  

Clicar no "accept cookies policy"  
    Click    selector=${Get Cookies} 
    
Verificar se o título da página fica "${TITULOGROUPLINK}"
    Get Title

Verificar se aparece a frase "GROUP LINK TM"
    Get Element    selector=//h4[contains(.,'Sign in to Group Link')]

Verificar se aparece a frase "Sign in to Group Link"
    Get Element    selector=//h4[contains(.,'Sign in to Group Link')]

Verificar se aparece a frase "Email"
    Get Element    selector=//label[contains(.,'Email')]

Verificar se aparece a frase "Password"
    Get Element    selector=//label[contains(.,'Password')]

Verificar se aparece a frase "By logging in, you agree to the Terms of Service and our Privacy Policy"
    Get Element    selector=//h6[contains(.,'By logging in, you agree to the Terms of Service and our Privacy Policy')]

Verificar se aparece a frase "© 2021 Group Link™. All rights reserved"
    Get Element    selector=//p[contains(.,'© 2021 Group Link™. All rights reserved')]

Verificar se aparece a frase "need help?"
    Get Element    selector=//button[contains(.,'need help?')]

Verificar se aparece a frase "Forgot Password?"
    Get Element    selector=//button[contains(.,'Forgot Password?')]

Verificar se aparece a frase "log in"
    Get Element    selector=//button[contains(.,'log in')]

Digitar o "Email" no campo Type your email
    Fill Text    css=input[type="email"]   txt=qa.water@grouplinknetwork.com

Digitar o "Password" no campo Type your passoword
    Fill Text    css=input[type="password"]    txt=fzveqtsdkukz

Clicar no botão de "log in"
    Click    selector=//button[@class='MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium css-tdk7gy'][contains(.,'log in')]



    