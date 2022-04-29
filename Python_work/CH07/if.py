import random as r

num = r.randrange(1,100)
tryCount = 0
running = True

while running:
    guess = int(input('Enter an Integer : '))
    
    if guess == num:
        print('정답입니다.')
        running = False
    elif guess < num:
        print('큽니다...')
    else:
        print('작습니다.')
    tryCount += 1



else:
    print('Loop is over')
    
print('{0}트 만에 성공'.format(tryCount))