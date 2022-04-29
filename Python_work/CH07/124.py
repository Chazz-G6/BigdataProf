num1 = input("첫 번째 숫자 입력")
num2 = input("두 번째 숫자 입력")
num3 = input("세 번째 숫자 입력")
num1 = int(num1)
num2 = int(num2)
num3 = int(num3)


if num1 >= num2 and num1 >= num3:
    print(num1)
elif num2 >= num1 and num2 >= num3:
    print(num2)
else:
    print(num3)