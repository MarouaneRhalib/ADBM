*** Settings ***
Library    SeleniumLibrary   
*** Test Cases ***
Consultation d'une campagne
    Open Browser  ${URL}  ${BROWSER}
    Set Browser Implicit Wait    5s
    Maximize Browser Window
    RememberMe
    Login
    AfficherPageRecherche
    VerificationDesCriteres
    TesterLaRecherche
    CreeUneCampagne
    ModifierUneCampagneDejaCree
    SupprimerUneCampagne
    Sleep    5s
    Close Browser 
    Log     Test Completed 
    

*** Variables ***
${URL}   http://uts0007:33410/adbm_dev/login.jsp
${BROWSER}        Chrome
&{CREDENTIALS}      username=admin    password=admin

*** Keywords ***
Login 
    Input Text            id=login      &{CREDENTIALS}[username]    
    Input Password        id=pwd        &{CREDENTIALS}[password]
    Execute Javascript    submitForm() 
  
RememberMe
    Select Checkbox    name=edrememberme
    
AfficherPageRecherche 
    Click Element    id:softwareRootItem    
    Click Element    xpath://a[@class='softwareBarItem softwareBarItem-MARKET']
    Click Button    id=btn4    
    Click Link    link:Campagnes
    
VerificationDesCriteres
    Page Should Contain Textfield    id:CpgTitle    
    Page Should Contain Textfield    id:input_CpgLevel
    Page Should Contain Textfield    id:input_CpgDateBeg$From
    Page Should Contain Textfield    id:input_CpgDateBeg$To
    Page Should Contain Textfield    id:input_CpgYear
    Page Should Contain Textfield    id:input_CpgPublic_
    
TesterLaRecherche
    Input Text    id:CpgTitle    TestMRb
    Click Button  id:search-CAMPAIGN_   
    Page Should Contain Button    xpath://*[@id="result-container-CAMPAIGN_"]/table/thead/tr/th[1]/button
    Page Should Contain Button    xpath://*[@id="result-container-CAMPAIGN_"]/table/thead/tr/th[2]/button
    Sleep    10s    
    
CreeUneCampagne
    Click Link    xpath:/html/body/div[3]/div[3]/div[2]/div[1]/table/tbody/tr[2]/td[2]/div/a 
    Input Text          id:CpgTitle               TestMrb
    Click Link    xpath:/html/body/div[3]/div[3]/div[2]/div[1]/table/tbody/tr/td[2]/div/a    
    
ModifierUneCampagneDejaCree
    Click Button    id=btn4    
    Click Link    xpath:/html/body/div[2]/div[2]/div[2]/ul/li[5]/nav/ul/li[1]/ul/li[1]/a
    Input Text    id:CpgTitle    TestMRB
    Click Button  id:search-CAMPAIGN_ 
    Click Link    xpath:/html/body/div[3]/div[2]/div[2]/div/div[1]/div[2]/table/tbody/tr[1]/td[1]/a   
    Click Link    xpath:/html/body/div[3]/div[3]/div[2]/div[1]/table/tbody/tr[1]/td[2]/div/a   
    Input Text    id:CpgTitle    TestModifier
    Click Link    xpath:/html/body/div[3]/div[3]/div[2]/div[1]/table/tbody/tr/td[2]/div/a    
    
SupprimerUneCampagne
    Click Button    id=btn4    
    Click Link    link:Campagnes
     Input Text    id:CpgTitle    testModifier
    Click Button  id:search-CAMPAIGN_ 
    Click Link    xpath:/html/body/div[3]/div[2]/div[2]/div/div[1]/div[2]/table/tbody/tr/td[1]/a
    Click Link    xpath:/html/body/div[3]/div[3]/div[2]/div[1]/table/tbody/tr[3]/td[2]/div/a    
    # Click Button    ENTER    
    
    