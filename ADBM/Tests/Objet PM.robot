*** Settings ***
Library    SeleniumLibrary   
*** Test Cases ***
Personne Morale
    Open Browser  ${URL}  ${BROWSER}
    Set Browser Implicit Wait    5s
    #Maximize Browser Window
    RememberMe
    Login
    CreerPM
    #ConsulterPM
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
    
CreerPM
    Click Button        id:softwareRootItem    
    Click Element       xpath://*[@id="main-menu"]/li[1]/a  
    Click Button        id:btn0  
    Click Link          xpath://*[@id="subMenuContainer-btn0"]/li/ul/li[2]/a  
    Click Link          xpath://*[@id="sidebarActions_div"]/table/tbody/tr[2]/td[2]/div/a 
    Element Should Be Focused    id:EntCorpName
    Click Element       id:EntCorpName    
   # Input Text          id:EntCorpName    ADBM Test MRL     
   # Input Text          id:EntRaisSoc_    ADBM   
   # Input Text          id:EntAd2         DDBM
   # Input Text          id:EntRaisSoc_            20200 SAN
   # Input Text          id:wrapper_EntAd2         2560                                            
   # Input Text          id:EntAd1                 PIETRANERA  
   # Input Text          id:wrapper_EntAd3         Paris  
  #  Input Text          id:EntPhone               06989218776  
  #   Input Text          id:EntFax                 05885694521  
#     Input Text          id:EntWeb                 google. com  
  #   Input Text          id:input_EntParentID      Parent id 
  #   Input Text          id:EntAcronym             DGM
  #   Input Text          id:EntWeb                 google. com
  #   Input Text          id:EntWeb                 google. com
  #  Input Text          id:EntNotes               texts and messages  
  #   Select From List By Label    input_EntCtrID      France
   #  Select From List By Label    input_EntOrgType    Association  
      
    
ConsulterPM
    Click Button        id:softwareRootItem    
    Click Element       xpath://*[@id="main-menu"]/li[1]/a
    Click Button        id:btn0  
    Click Link          link:Rechercher
    Click Button        xpath:/html/body/div[3]/div[2]/div[2]/div/div[1]/div[1]/form/div[2]/div/button
    Sleep    5s    
    Input Text          id:EntCorpName    TEST
    Click Button        xpath:/html/body/div[3]/div[2]/div[2]/div/div[1]/div[1]/form/div[2]/div/button
    Click Link          xpath:/html/body/div[3]/div[2]/div[2]/div/div[1]/div[2]/table/tbody/tr[1]/td[2]/a
    Sleep    10s    