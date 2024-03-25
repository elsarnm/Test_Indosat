*** Settings ***
Documentation    This is some basic info about the whole suite
Library          SeleniumLibrary

*** Variables ***
${URL1}                 https://www.happydayshopping.com/products/account
${URL2}                 https://mail.yahoo.com/d/folders/1/messages/49227?guce_referrer=aHR0cHM6Ly9sb2dpbi55YWhvby5jb20v&guce_referrer_sig=AQAAADuDVy05XMlqgbNHQRJAsRufL7VBUEGMw-aWXUx0jLz0Qa6xygyvGy8f6bDKyZ1rFL3d8vbabXRcv7HY-whPPi_RaYycNErqMx7gMSwZekHpKyf-LEPZtFrL7IwYMdurkf8irdo5Ib_MSZPeq_8zYE1HJbSBLDbyKdY2gNeodUvm
${URL3}                 https://www.happydayshopping.com/products/account?key=LqA6SfNfpB0u&returnUrl=account
${VALID_USERNAME}       sarah_sasa17@yahoo.com
${INVALID_USERAME}      sarah_sasa17
${INVALID_USERAME2}     @yahoo.com
${INPUT_USERNAME}       //input[@id='ec-signin-email-input']
${LOGIN_BTN}            //button[@class='form-control__button form-control__button--icon-center']
${LOGIN_LINK}           //td[@valign='top']//div//a[@rel='nofollow noopener noreferrer']
${NOTIF1}               //div[@class='ec-notice__message']
${NOTIF2}               //div[@id='ec-signin-email-input-msg']


*** Test Cases ***
TC01. Verify that the user will be able to see and type to the input field of email
    [Documentation]                 This is the login with a valid email
    [Tags]                          Positive Test Case

    #Initialize Selenium
    set selenium speed              .2s
    set selenium timeout            10s

    #open the browser
    log                             Starting the test case!
    open browser                    ${URL1}                  chrome
    maximize browser window

    #main test
    sleep                           3
    element should be visible       ${INPUT_USERNAME}
    input text                      ${INPUT_USERNAME}       ${VALID_USERNAME}

    #close browser
    sleep                           3s
    close browser

TC02. Verify that the user will be able to input their email to login page and click login button
    [Documentation]                 This is the login with a valid email
    [Tags]                          Positive Test Case

    #Initialize Selenium
    set selenium speed              .2s
    set selenium timeout            10s

    #open the browser
    log                             Starting the test case!
    open browser                    ${URL1}                  chrome
    maximize browser window

    #main test
    sleep                           3
    input text                      ${INPUT_USERNAME}       ${VALID_USERNAME}
    sleep                           3
    click button                    ${LOGIN_BTN}

    #close browser
    sleep                           3s
    close browser

TC03. Verify that the user will be able to input their email to login page and pressing Enter key
    [Documentation]                 This is the login with a valid email
    [Tags]                          Positive Test Case

    #Initialize Selenium
    set selenium speed              .2s
    set selenium timeout            10s

    #open the browser
    log                             Starting the test case!
    open browser                    ${URL1}                  chrome
    maximize browser window

    #main test
    sleep                           3
    input text                      ${INPUT_USERNAME}       ${VALID_USERNAME}
    sleep                           3
    press keys                      ${LOGIN_BTN}            [RETURN]

    #close browser
    sleep                           3s
    close browser

TC04. Verify the success of sending login link to email should be displayed
    [Documentation]                 This is the login with a valid email
    [Tags]                          Positive Test Case

    #Initialize Selenium
    set selenium speed              .2s
    set selenium timeout            10s

    #open the browser
    log                             Starting the test case!
    open browser                    ${URL1}                  chrome
    maximize browser window

    #main test
    sleep                           3
    input text                      ${INPUT_USERNAME}       ${VALID_USERNAME}
    sleep                           3
    click button                    ${LOGIN_BTN}
    sleep                           3
    element should be visible       ${NOTIF1}

    #close browser
    sleep                           3s
    close browser

TC05. Verify the error message should display after leaving the email field blank
    [Documentation]                 This is the login with a valid email
    [Tags]                          Negative Test Case

    #Initialize Selenium
    set selenium speed              .2s
    set selenium timeout            10s

    #open the browser
    log                             Starting the test case!
    open browser                    ${URL1}                  chrome
    maximize browser window

    #main test
    sleep                           3
    click button                    ${LOGIN_BTN}
    element should be visible       ${NOTIF2}

    #close browsers
    sleep                   3s
    close browser

TC06. Verify if the user can input an email without a valid email extension behind it
    [Documentation]                 This is the login with a valid email
    [Tags]                          Edge Test Case

    #Initialize Selenium
    set selenium speed              .2s
    set selenium timeout            10s

    #open the browser
    log                             Starting the test case!
    open browser                    ${URL1}                  chrome
    maximize browser window

    #main test
    sleep                           3
    input text                      ${INPUT_USERNAME}       ${INVALID_USERAME}
    sleep                           3
    click button                    ${LOGIN_BTN}

    #close browser
    sleep                   3s
    close browser

TC07. Verify if the user can input the extension of the email without an email name
    [Documentation]                 This is the login with a valid email
    [Tags]                          Edge Test Case

    #Initialize Selenium
    set selenium speed              .2s
    set selenium timeout            10s

    #open the browser
    log                             Starting the test case!
    open browser                    ${URL1}                  chrome
    maximize browser window

    #main test
    sleep                           3
    input text                      ${INPUT_USERNAME}       ${INVALID_USERAME2}
    sleep                           3
    click button                    ${LOGIN_BTN}

    #close browser
    sleep                   3s
    close browser

*** Keywords ***