*** Settings ***
Documentation    This is the payment journey
Library          SeleniumLibrary


*** Variables ***
${URL}                  https://www.happydayshopping.com/
${BUTTON_ADDTOBAG}      xpath://div[@class='form-control form-control--button form-control--large form-control--primary form-control--flexible form-control--animated details-product-purchase__add-to-bag form-control__button--icon-center form-control--done']//button[@type='button']
${BUTTON_ADDMORE}       xpath://div[@class='form-control form-control--button form-control--large form-control--secondary form-control--flexible form-control--animated details-product-purchase__add-more form-control__button--icon-center form-control--done']//button[@type='button']
${BUTTON_GOTOBAG}       xpath://div[@class='form-control form-control--button form-control--large form-control--primary form-control--flexible details-product-purchase__checkout']//button[@type='button']
${BUTTON_APPLYCOUPON}   xpath://div[@class='ec-cart__sidebar-inner']//div[@class='form-control form-control--button form-control--medium form-control--secondary form-control--flexible form-control--done ec-cart-coupon__button ec-cart-coupon__button--apply']//button[@type='button']
${BUTTON_SEARCH}        xpath://a[normalize-space()='Search Products']
${BUTTON_CHECKOUT}      xpath://div[contains(@class,'form-control form-control--button form-control--large form-control--primary form-control--flexible form-control--animated form-control--done ec-cart__button ec-cart__button--checkout')]//button[contains(@type,'button')]
${BUTTON_CONTINUE1}     xpath://div[contains(@class,'form-control form-control--button form-control--large form-control--primary form-control--flexible form-control--done')]//button[@type='button']
${BUTTON_CONTINUE2}     xpath://div[@class='form-control form-control--button form-control--large form-control--primary form-control--flexible form-control--done ']//button[@type='button']
${BUTTON_PLACEORDER}    xpath://div[@class='form-control form-control--button form-control--large form-control--primary form-control--flexible form-control--done ']//button[@type='button']
${BUTTON_BUYNOW}        xpath://div[@class='grid-product grid-product--id-254957040 ec-store-productsGrid-cell-inTheBag']//button[@type='button']
${CATEGORY1}            xpath://img[@alt='For Children']
${CATEGORY2}            class:ins-header__menu-link-icon
${CODE_PRODUCT}         xpath://div[@class='grid-product__sku-inner'][normalize-space()='SKU 04099']
${EMAIL}                xpath://input[@id='ec-cart-email-input']
${FLASHSALE1}           xpath://img[@alt='Flash Sale']
${FLASHSALE2}           xpath://a[contains(text(),'Flash Sale')]
${INPUT_NAME}           xpath://input[@id='ec-full-name']
${INPUT_PHONE}          xpath://input[@id='ec-phone']
${INPUT_ADDRESS}        xpath://input[@id='ec-address-line1']
${INPUT_CITY}           xpath://input[@id='ec-city-list']
${INPUT_NOTE}           xpath://textarea[contains(@name,'textarea')]
${NOTIF1}               xpath://span[normalize-space()='in the bag']
${NOTIF2}               xpath://a[@title='Go to your shopping cart']
${NOTIF3}               xpath://div[contains(@class,'ec-cart__sidebar-inner')]//div[contains(@class,'form__msg form__msg--error')][normalize-space()='Code is not valid']
${NOTIF4}               xpath://div[@id='ec-cart-email-input-msg']
${PRICE1}               xpath://span[@class='details-product-price__value ec-price-item notranslate']
${PRICE2}               xpath://div[@class='grid-product grid-product--id-254957040 ec-store-productsGrid-cell-inTheBag']//div[@class='grid-product__price-value ec-price-item'][normalize-space()='OMR 1.50']
${PRODUCT1}             Glow Lean 147g
${PRODUCT2}             xpath://img[@title='Leo Mens Intimate Wash 100ml']
${PRODUCT3}             xpath://img[@title='Extraderm plus Vitamins - Exfoliant 4']
${PRODUCT4}             xpath://img[@title='Bench Tickled Pink 100ml']
${PROMOCOUPON1}         xpath://label[@for='ec-cart-sidebar-discount-coupon-input']//a[@class='ec-link'][normalize-space()='Redeem your coupon']
${PROMOCOUPON2}         xpath://input[@id='ec-cart-sidebar-discount-coupon-input']
${QUANTITY1}            xpath://input[@id='qty-field']
${QUANTITY2}            xpath://div[normalize-space()='Qty: 2']
${QUANTITY3}            xpath://select[contains(@aria-label,'Quantity:')]
${SELECT_DELIVERY}      xpath://div[contains(@class,'ec-form__cell ec-form__cell--zx662tu')]//select[contains(@class,'form-control__select')]
${SELECT_PAYMENT}       xpath:(//input[contains(@type,'radio')])[2]
${SELECT_FINDUS}        xpath://select[contains(@class,'form-control__select')]
${TOTALPRICE1}          xpath://tr[contains(@class,'ec-cart-summary__row ec-cart-summary__row--total')]
${TOTALPRICE2}          xpath://span[contains(@class,'ec-cart-summary__total')]


*** Test Cases ***
TC01. Verify product categories on the home page are shown clearly
    [Documentation]         User can view the main page and see categories of products
    [Tags]                  Positive Test Case

    #Initialize Selenium
    set selenium speed      .2s
    set selenium timeout    10s

    #open the browser
    log                         Starting the test case!
    open browser                ${URL}                      chrome
    maximize browser window

    #main steps
    scroll element into view    ${CATEGORY1}

    #close browser
    sleep                       5s
    close browser

TC02. Make sure that items are categorized or not by the category name
    [Documentation]         User can view products on the category
    [Tags]                  Positive Test Case

    #Initialize Selenium
    set selenium speed      .2s
    set selenium timeout    10s

    #open the browser
    log                         Starting the test case!
    open browser                ${URL}                      chrome
    maximize browser window

    #main steps
    mouse over                  ${CATEGORY2}
    sleep                       3
    click element               ${FLASHSALE2}
    sleep                       5
    scroll element into view    ${PRODUCT2}

    #close browser
    sleep                       5s
    close browser

TC03. Confirm the user-selected product detail page opens as the user clicks on the image or name of the product
    [Documentation]         User can view details of the product when their click the name or the image of it
    [Tags]                  Positive Test Case

    #Initialize Selenium
    set selenium speed      .2sCli
    set selenium timeout    10s

    #open the browser
    log                         Starting the test case!
    open browser                ${URL}                      chrome
    maximize browser window

    #main steps
    click image                 ${FLASHSALE1}
    sleep                       3
    scroll element into view    ${PRODUCT3}
    click image                 ${PRODUCT4}
    page should contain         4800417008219

    #close browser
    sleep                       5s
    close browser

TC04. Check the correct price of the product should be displayed on the product detail page
    [Documentation]         User can view the correct price of the product if click the product detail
    [Tags]                  Positive Test Case

    #Initialize Selenium
    set selenium speed      .2s
    set selenium timeout    10s

    #open the browser
    log                         Starting the test case!
    open browser                ${URL}                      chrome
    maximize browser window

    #main steps
    click image                 ${FLASHSALE1}
    sleep                       3
    scroll element into view    ${PRODUCT3}
    click image                 ${PRODUCT4}
    page should contain         OMR 1.50

    #close browser
    sleep                       5s
    close browser

TC05. Confirm whether the "Add to Bag" button is present and can be use or not on the product detail
    [Documentation]         User can view the Add to Bag button in the product detail
    [Tags]                  Positive Test Case

    #Initialize Selenium
    set selenium speed      .2s
    set selenium timeout    10s

    #open the browser
    log                         Starting the test case!
    open browser                ${URL}                      chrome
    maximize browser window

    #main steps
    click image                 ${FLASHSALE1}
    sleep                       3
    scroll element into view    ${PRODUCT3}
    click image                 ${PRODUCT4}
    page should contain button  ${BUTTON_ADDTOBAG}
    click button                ${BUTTON_ADDTOBAG}
    element should be visible   xpath://span[normalize-space()='1 item in the bag']

    #close browser
    sleep                       5s
    close browser

TC06. Test users can add more than one item on the product detail page
    [Documentation]         User can add more items to bag
    [Tags]                  Positive Test Case

    #Initialize Selenium
    set selenium speed      .2s
    set selenium timeout    10s

    #open the browser
    log                         Starting the test case!
    open browser                ${URL}                      chrome
    maximize browser window

    #main steps
    click image                 ${FLASHSALE1}
    sleep                       3
    scroll element into view    ${PRODUCT3}
    click image                 ${PRODUCT4}
    sleep                       3
    click button                ${BUTTON_ADDTOBAG}
    sleep                       3
    click button                ${BUTTON_ADDMORE}
    element should be visible   ${NOTIF2}

    #close browser
    sleep                       5s
    close browser

TC07. Verify the qty of selected products is clearly shown or not and can changes the qty on the checkout page
    [Documentation]         User can view and edit the qty on the bag page
    [Tags]                  Positive Test Case

    #Initialize Selenium
    set selenium speed      .2s
    set selenium timeout    10s

    #open the browser
    log                         Starting the test case!
    open browser                ${URL}                      chrome
    maximize browser window

    #main steps
    click image                 ${FLASHSALE1}
    sleep                       3
    scroll element into view    ${PRODUCT3}
    click image                 ${PRODUCT4}
    sleep                       3
    click button                ${BUTTON_ADDTOBAG}
    sleep                       3
    click button                ${BUTTON_GOTOBAG}
    element should be visible   ${QUANTITY2}
    select from list by value   ${QUANTITY3}                3

    #close browser
    sleep                       5s
    close browser


TC08. Verify the total price of products is clearly shown or not on the checkout page
    [Documentation]         User can view the total price of selected products
    [Tags]                  Positive Test Case

    #Initialize Selenium
    set selenium speed      .2s
    set selenium timeout    10s

    #open the browser
    log                         Starting the test case!
    open browser                ${URL}                      chrome
    maximize browser window

    #main steps
    click image                 ${FLASHSALE1}
    sleep                       3
    scroll element into view    ${PRODUCT3}
    click image                 ${PRODUCT4}
    sleep                       3
    click button                ${BUTTON_ADDTOBAG}
    sleep                       3
    click button                ${BUTTON_GOTOBAG}
    sleep                       3
    select from list by value   ${QUANTITY3}                3
    sleep                       3
    element should be visible   ${TOTALPRICE2}

    #close browser
    sleep                       5s
    close browser

TC09. Verify if the user has input invalid promo coupon
    [Documentation]         User input invalid promo coupon, error message should be appear
    [Tags]                  Negative Test Case

    #Initialize Selenium
    set selenium speed      .2s
    set selenium timeout    10s

    #open the browser
    log                         Starting the test case!
    open browser                ${URL}                      chrome
    maximize browser window

    #main steps
    click image                 ${FLASHSALE1}
    sleep                       3
    scroll element into view    ${PRODUCT3}
    click image                 ${PRODUCT4}
    sleep                       3
    click button                ${BUTTON_ADDTOBAG}
    sleep                       3
    click button                ${BUTTON_GOTOBAG}
    sleep                       3
    scroll element into view    ${BUTTON_SEARCH}
    click link                  ${PROMOCOUPON1}
    input text                  ${PROMOCOUPON2}             HEMAT20
    click button                ${BUTTON_APPLYCOUPON}
    sleep                       3
    element should be visible   ${NOTIF3}

    #close browser
    sleep                       5s
    close browser

TC10. Verify if the user has input an email without a valid email extension behind it
    [Documentation]         User input an email without a valid email extension behind it, error message should appear
    [Tags]                  Edge Test Case

    #Initialize Selenium
    set selenium speed      .2s
    set selenium timeout    10s

    #open the browser
    log                         Starting the test case!
    open browser                ${URL}                      chrome
    maximize browser window

    #main steps
    click image                 ${FLASHSALE1}
    sleep                       3
    scroll element into view    ${PRODUCT3}
    click image                 ${PRODUCT4}
    sleep                       3
    click button                ${BUTTON_ADDTOBAG}
    sleep                       3
    click button                ${BUTTON_GOTOBAG}
    sleep                       3
    input text                  ${EMAIL}                    sarah_sasa17
    click button                ${BUTTON_CHECKOUT}
    element should be visible   ${NOTIF4}

    #close browser
    sleep                       5s
    close browser

TC11. Verify if the user has input an email without an email name and just the extension behind it
    [Documentation]         User input an email without an email name, error message should appear
    [Tags]                  Edge Test Case

    #Initialize Selenium
    set selenium speed      .2s
    set selenium timeout    10s

    #open the browser
    log                         Starting the test case!
    open browser                ${URL}                      chrome
    maximize browser window

    #main steps
    click image                 ${FLASHSALE1}
    sleep                       3
    scroll element into view    ${PRODUCT3}
    click image                 ${PRODUCT4}
    sleep                       3
    click button                ${BUTTON_ADDTOBAG}
    sleep                       3
    click button                ${BUTTON_GOTOBAG}
    element should be visible   ${QUANTITY2}
    sleep                       3
    select from list by value   ${QUANTITY3}                3
    sleep                       3
    input text                  ${EMAIL}                    @yahoo.com
    click button                ${BUTTON_CHECKOUT}
    element should be visible   ${NOTIF4}

    #close browser
    sleep                       5s
    close browser

TC12. Verify if the user can input an valid email address
    [Documentation]         User input a valid email address
    [Tags]                  Positive Test Case

    #Initialize Selenium
    set selenium speed      .2s
    set selenium timeout    10s

    #open the browser
    log                         Starting the test case!
    open browser                ${URL}                      chrome
    maximize browser window

    #main steps
    click image                 ${FLASHSALE1}
    sleep                       3
    scroll element into view    ${PRODUCT3}
    click image                 ${PRODUCT4}
    sleep                       3
    click button                ${BUTTON_ADDTOBAG}
    click button                ${BUTTON_GOTOBAG}
    input text                  ${EMAIL}                    sarah_sasa17@yahoo.com
    click button                ${BUTTON_CHECKOUT}

    #close browser
    sleep                       5s
    close browser

TC13. Verify if the user can input a valid data for shipping address and choose the shipping method
    [Documentation]         User input a valid data for shipping step and choose the shipping method
    [Tags]                  Positive Test Case

    #Initialize Selenium
    set selenium speed      .2s
    set selenium timeout    10s

    #open the browser
    log                         Starting the test case!
    open browser                ${URL}                      chrome
    maximize browser window

    #main steps
    click image                 ${FLASHSALE1}
    sleep                       3
    scroll element into view    ${PRODUCT3}
    click image                 ${PRODUCT4}
    sleep                       3
    click button                ${BUTTON_ADDTOBAG}
    sleep                       2
    click button                ${BUTTON_GOTOBAG}
    input text                  ${EMAIL}                    sarah_sasa17@yahoo.com
    click button                ${BUTTON_CHECKOUT}
    sleep                       5
    input text                  ${INPUT_NAME}               Elsa Sarah NM
    input text                  ${INPUT_PHONE}              6287864342375
    input text                  ${INPUT_ADDRESS}            Jl. Asrama Polisi EX SPN No.3
    input text                  ${INPUT_CITY}               Jakarta Timur
    select from list by label   ${SELECT_DELIVERY}          AMERAT
    click button                ${BUTTON_CONTINUE1}
    click button                ${BUTTON_CONTINUE2}

    #close browser
    sleep                       5s
    close browser

TC14. Test payment is done successfully by choosing Cash on Delivery payment method
    [Documentation]                    User choose COD payment method and get the success payment.
    [Tags]                             Positive Test Case

    #Initialize Selenium
    set selenium speed                 .2s
    set selenium timeout               10s

    #open the browser
    log                                Starting the test case!
    open browser                       ${URL}                      chrome
    maximize browser window

    #main steps
    click image                        ${FLASHSALE1}
    sleep                              5
    scroll element into view           ${CODE_PRODUCT}
    click image                        ${PRODUCT4}
    sleep                              3
    click button                       ${BUTTON_ADDTOBAG}
    sleep                              2
    click button                       ${BUTTON_GOTOBAG}
    input text                         ${EMAIL}                    sarah_sasa17@yahoo.com
    click button                       ${BUTTON_CHECKOUT}
    sleep                              5
    input text                         ${INPUT_NAME}               Harry Park
    input text                         ${INPUT_PHONE}              +442912345678
    input text                         ${INPUT_ADDRESS}            221b Baker Street
    input text                         ${INPUT_CITY}               London
    select from list by label          ${SELECT_DELIVERY}          AMERAT
    click button                       ${BUTTON_CONTINUE1}
    sleep                              5
    click button                       ${BUTTON_CONTINUE2}
    sleep                              5
    click element                      ${SELECT_PAYMENT}
    input text                         ${INPUT_NOTE}               please pack it well
    select from list by label          ${SELECT_FINDUS}            From a friend
    click button                       ${BUTTON_PLACEORDER}


    #close browser
    sleep                              5s
    close browser

*** Keywords ***
