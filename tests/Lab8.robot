*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Browser To Login Page
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --headless
    
    Create Webdriver    Chrome    options=${chrome_options}
    Go To    https://computing.kku.ac.th
	
*** Test Cases ***
TC01_Open_Website_Successfully
    Open Browser To Login Page
    [Documentation]    ตรวจสอบว่าสามารถเปิดเว็บไซต์ได้สำเร็จ
	${title}=    Get Title
    Should Be Equal    ${title}    วิทยาลัยการคอมพิวเตอร์ มหาวิทยาลัยขอนแก่น - College of Computing, Khon Kaen University
    Wait Until Page Contains    วิทยาลัยการคอมพิวเตอร์ มหาวิทยาลัยขอนแก่น
	Close Browser