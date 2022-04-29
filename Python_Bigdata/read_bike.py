from selenium import webdriver


chromedriver ='C:/Anaconda/chromedriver_win32/chromedriver.exe'
reqUrl = 'https://shopping.naver.com/home/p/index.naver'

driver = webdriver.Chrome(chromedriver)

driver.get(reqUrl)


userXpath='/html/body/div[1]/div[1]/div/div[2]/div/div[2]/div/div[1]/form/fieldset/div[1]/input[1]'
driver.find_element_by_xpath(userXpath).send_keys("캠핑")