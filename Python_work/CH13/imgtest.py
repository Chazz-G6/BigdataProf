from PIL import Image, ImageFilter, ImageEnhance, ImageOps
from numpy import imag

img = Image.open('C://Bigdata//work//Python_work//CH13//flag.jpg')
img.show()

img = img. transpose(Image.FLIP_LEFT_RIGHT)
img.show()
img.sage('C://Bigdata//work//Python_work//CH13//flag_trans.jpg')