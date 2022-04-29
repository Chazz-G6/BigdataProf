from selenium import webdriver

url="https://google.com/"
options = webdriver.ChromeOptions()
options.add_argument("window-size=1024,768")
options.add_argument("-headless")


driver = webdriver.Chrome("C:/Anaconda/chromedriver_win32/chromedriver.exe", options=options)

driver.get(url)

r = driver.execute_script("return 100+50")

print(r)
driver.quit()
