
from re import T


coffeeB = 500
samgimB = 900
bayuB = 800
dosirakB = 3500
colaB = 700
saeuB = 1000

coffeeS = 1800
samgimS = 1400
bayuS = 1800
dosirakS = 4000
colaS = 1500
saeuS = 2000


total_S = 0
total_M = 0
temp_price = 0

coffee_count=(int)(input("캔커피 판매 개수: "))
temp_price = coffeeS * coffee_count
total_S = temp_price
total_M = temp_price - coffeeB*coffee_count

samgim_count=(int)(input("삼각 김밥 판매 개수: "))
temp_price = samgimS * samgim_count
total_S = temp_price
total_M = temp_price - samgimB*samgim_count

bayu_count=(int)(input("바나나맛 우유 판매 개수: "))
temp_price = bayuS * bayu_count
total_S = temp_price
total_M = temp_price - bayuB*bayu_count

dosirak_count=(int)(input("도시락 판매 개수: "))
temp_price = dosirakS * dosirak_count
total_S = temp_price
total_M = temp_price - dosirakB*dosirak_count

cola_count=(int)(input("콜라 판매 개수: "))
temp_price = colaS * cola_count
total_S = temp_price
total_M = temp_price - colaB*cola_count

saeu_count=(int)(input("새우깡 판매 개수: "))
temp_price = saeuS * saeu_count
total_S = temp_price
total_M = temp_price - saeuB*saeu_count

print('오늘 총 매출액은 {0}원 이고, 마진은 {1} 입니다.'.format(total_S,total_M))
