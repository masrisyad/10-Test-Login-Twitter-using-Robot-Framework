*** Settings ***
Library           Selenium2Library
Library           OperatingSystem 
*** Keywords ***
Set Environment Variable   webdriver.gecko.driver  geckodriver.exe
*** Variables ***
#Your Browser
${Browser}        Mozilla
#Testing URL
${SiteUrl}        https://twitter.com/?lang=en
#Login Data
${Email}          test_developericad1@yahoo.com
${Password}       !q@w1e1r1t 
#Time Delay
${Delay}          3s  
*** Keywords *** 
#Feel free for add any Keywords here
Open page
    open browser    ${SiteUrl}      ${browser}     
    Maximize Browser Window
Find login button 
    Click Element  xpath=//a[@href='/login']
Fill Login Form 
    Sleep   ${Delay}
    Input Text       name=session[username_or_email]       ${Email}
    Input Text       name=session[password]                ${Password}
Click login button  
    Sleep   ${Delay}
    Click Element  xpath=//input[@value='Log in']
    [Teardown]    Close Browser    
*** Test Cases ***
#Focus in Test case 
Twitter Login Flow 
    Open Page   
    Find login button
    Fill Login Form  
    Click login button  
