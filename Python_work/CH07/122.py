score = int(input("점수를 입력하세요."))

if score >= 81 and 100:
    print("A 학점 입니다.")
elif score >= 61 and 80:
    print("B 학점 입니다.")
elif score >= 41 and 60:
    print("C 학점 입니다.")
elif score >= 21 and 40:
    print("D 학점 입니다.")
elif score >= 0 and 20:
    print("E 학점 입니다.")
else:
    print("1에서 100 사이의 수 만 입력하세요.")