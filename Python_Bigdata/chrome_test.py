
from selenium import webdriver

url="https://www.naver.com/"

options = webdriver.ChromeOptions()
options.add_argument("--headless")  # Background(CLI) 동작 사용
options.add_argument("--no-sandbox")
options.add_argument('--disable-dev-shm-usage')
options.add_argument("--remote-debugging-port=9222")  # 이 부분이 핵심
options.add_argument('window-size=1024.768')


driver = webdriver.Chrome('C:/Anaconda/chromedriver_win32/chromedriver.exe', options=options)

driver.get(url)

driver.save_screenshot('C:/Bigdata/work/Python_Bigdata/website.png')

driver.quit()
