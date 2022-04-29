from selenium import webdriver


chromedriver ='C:/Anaconda/chromedriver_win32/chromedriver.exe'
reqUrl = 'https://auto.daum.net/'

driver = webdriver.Chrome(chromedriver)

driver.get(reqUrl)

print("+" * 100)
print(driver.title)
print(driver.current_url)

print("-" * 100)