# %%
poem = '''\
    programming is fuck
    I love you
    It was lie'''
    
    
    
#Open for writing

f = open('poem.txt', 'w')


# %%
f.write(poem)

# %%
f.close()

# %%
f = open('poem.txt', 'r')

# %%
while True:
    line = f.readline()
    if len(line) == 0:
        break
    print(line)

# %%
f.close()

# %%



