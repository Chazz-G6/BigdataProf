productIn ={
            '커피':500, '삼각김밥':900, '바나나우유':800, '도시락':3500
            ,'콜라':700, '새우깡':1000
}

productOut ={
            '커피':1800, '삼각김밥':1400, '바나나우유':1800, '도시락':3500
            ,'콜라':1500, '새우깡':2000
}

total_panmae = 0
total_margin = 0
temp_price = 0


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


income = coffeeS+samgimS+bayuS+dosirakS+colaS+saeuS
margin = income-(coffeeB+samgimB+bayuB+dosirakB+colaB+saeuB)






print('오늘 총 매출액은', income ,'원 입니다.')
print('마진은 ', margin ,'원 입니다.')