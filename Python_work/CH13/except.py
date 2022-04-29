print('ver.01')

try:
    text = input("입력 대기: ")

except EOFError:
    print("eof...")
except KeyboardInterrupt:
    print("You have Cancelled the operation")
    
else:
    print("You entered {}".format(text))