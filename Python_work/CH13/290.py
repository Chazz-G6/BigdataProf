# import io


# f = io.open('매수종목1.txt', 'wt', encoding='utf-8')
# f.write('005930\n')
# f.write('005380\n')
# f.write('035420')
# f.close()

# fr = io.open('매수종목1.txt',  encoding='utf-8')
# text = fr.readlines()

# #readline

# print(text)


import csv

f = open("매수종목.csv", mode="wt", encoding="cp949", newline='')
writer = csv.writer(f)
writer.writerow(["종목명", "종목코드", "PER"])
writer.writerow(["삼성전자", "005930", 15.59])
writer.writerow(["NAVER", "035420", 55.82])
f.close()