#덧셈
def add(a,b):
    return int(a) + int(b)

#뺄셈
def sub(a,b):
    return int(a) - int(b)

#곱셈
def mul(a,b):
    return int(a) * int(b)

#나눗셈
def div(a,b):
    return int(a) / int(b)

#몫과 나머지
def share(a,b):
    return int(a) // int(b), int(a) % int(b)


num1 = int(input("계산할 첫 번째 수 입력"))
op1 = input("사용할 연산자 입력")
num2 = int(input("계산할 두 번째 수 입력"))

while True:
    if op1 == "+":
        print(num1, " + ", num2, " = ", add(num1,num2))
        break

    if op1 == "-":
        print(num1, " - ", num2, " = ", sub(num1,num2))
        break

    if op1 == "*":
        print(num1, " * ", num2, " = ", mul(num1,num2))
        break

    if op1 == "/":
        print(num1, " / ", num2, " = ", div(num1,num2))
        break

    if op1 == "//":
        print(num1, " // ", num2, " = ", share(num1,num2))
        break