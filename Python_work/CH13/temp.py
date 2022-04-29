from cgi import test
import io


f = io.open('abc.txt', 'wt', encoding='utf-8')
f.write('Imagine all the people...')
f.close()

fr = io.open('abc.txt',  encoding='utf-8')
text = fr.read()

#readline

print(text)