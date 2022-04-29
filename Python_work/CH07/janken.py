import random as r

num = r.randrange(1,3)
tryCount = 0
running = True

print('1은 가위, 2는 바위 3은 보자기 입니다.')

while running:
    guess = int(input('가위~바위~보!'))
    
    if guess == num:
        print('비겼습니다.')
    elif guess =: