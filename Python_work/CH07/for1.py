while True:
    s = int(input("몇 단을 출력할까요?"))
    if s <= 2 and s >=9:
        break
    for i in range(1,10):
        print(s," * ",i," = ",s * i)
        
        
