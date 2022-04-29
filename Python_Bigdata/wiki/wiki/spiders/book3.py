import scrapy
#import json, pprint

class Book3Spider(scrapy.Spider):
    name = 'book3'
    allowed_domains = ['wikibook.co.kr']
    #도서 목록 페이지 ---1
    start_urls = [
        'http://wikibook.co.kr/list'
        ]

    #도서 목록 페이지 스크레이핑
    def parse(self, response):
        li_list = response.css('.book-url')
        for a in li_list[:5]:
            href = a.css('::attr(href)').extract_first()
            print(href)
            #개별 도서 페이지에 대한 크롤링 요청 ---3
            yield response.follow(
                response.urljoin(href), self.parse_book
            )
            
    def parse_book(self, response):
        title = response.css('.main-title::text').extract_first()
        img_url = response.css('.book-image-2d::attr(src)').extract_first()
        #결과 출력
        yield {
            'title': title,
            'img_url': response.urljoin(img_url)
        }
        
# a = json.load(open('list3.json'))
# pprint.pprint(a)
