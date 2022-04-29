import pickle

#The name of the file where we will store the object
shoplistfile = 'shoplist.data'
#the list of things to buy
shoplist = ['apple', 'mango', 'carrot']

#write to the file
f = open(shoplistfile, 'wb')
#Dump he object
pickle.dump(shoplist, f)
f.close()

#destroy the shoplist variable
del shoplist

#Read back from the storage

f = open(shoplistfile, 'rb')
#Load the object from the file
storedlist = pickle.load(f)
print(storedlist)
f.close