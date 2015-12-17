#!/usr/bin/python
from sense_hat import SenseHat

sense = SenseHat()
sense.clear()

r = 32
g = 32
b = 200

# Eyes
sense.set_pixel(2, 1, r, g, b)
sense.set_pixel(5, 1, r, g, b)

# Nose
sense.set_pixel(3, 3, r+64, g, b-100)
sense.set_pixel(4, 3, r+64, g, b-100)

# Mouth
sense.set_pixel(1, 5, r, g, b)
sense.set_pixel(2, 6, r, g, b)
sense.set_pixel(3, 6, r, g, b)
sense.set_pixel(4, 6, r, g, b)
sense.set_pixel(5, 6, r, g, b)
sense.set_pixel(6, 5, r, g, b)
sense.set_pixel(1, 4, r, g, b)
sense.set_pixel(6, 4, r, g, b)

sense.clear()
