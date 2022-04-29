
import pymysql
import pandas as pd

#2. MySQL 연결:
con = pymysql.Connect(host='localhost', user='root', password='root2022',
                    db = 'sqldb', charset='utf8')

cur = con.cursor()

#3.DB 켜서 객체 생성
sql = 'select userID, name from usertbl'
cur.execute(sql)

#4. SQL문 실행
rows = cur.fetchall()

#데이터 페치
customers = pd.DataFrame(rows)

print(customers)
#DB연결 종료
con.close()
