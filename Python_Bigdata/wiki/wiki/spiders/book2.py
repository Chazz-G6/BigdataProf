import scrapy
import json, pprint
# import json, pprint

# a = json.load(open('list3.json'))
# pprint.pprint(a)
class Book2Spider(scrapy.Spider):
    name = 'book2'
    start_urls = ['https://wikibook.co.kr/list/']
    
    def parse(self, response):
        #도서 목록 추출
        li_list = response.css('.book-url')
        for a in li_list:
            #href 속성과 텍스트 추출하기 ---( 2)
            href = a.css('::attr(href)').extract_first()
            text = a.css('::text').extract_first()
            #절대 경로로 변환하기
            href2 = response.urljoin(href)
            #print (href2," : ", text)
            
            #결과 출력
            yield {
                'text' : text,
                'url' : href2
            }
