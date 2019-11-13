import numpy as np
from PIL import Image, ImageFilter
from matplotlib import pyplot as plt

#
img = Image.open('lena.jpg')

plt.imshow(np.asarray(img))
plt.pause(10)

plt.clf()
plt.pause(5)

plt.imshow(img)
plt.pause(10)
