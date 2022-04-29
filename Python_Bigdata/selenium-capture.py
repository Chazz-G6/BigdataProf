from selenium.webdriver import Firefox, FirefoxOptions

url = "http://www.naver.com/"

#Firefox를 헤드리스 모드로 설정
options = FirefoxOptions()
options.add_argument('-headless')

#PhantomJS 드라이버 추출
browser = Firefox(options=options)

#URL 읽어 들이기
browser.get(url)
#화면을 캡쳐하기
browser.save_screenshot("Website.png")
#브라우저 종료
browser.quit()