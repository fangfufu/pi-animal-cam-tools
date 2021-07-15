#!/usr/bin/python3

from gpiozero import LED
from time import sleep
import board
import adafruit_bh1750

THRESHOLD = 0

i2c = board.I2C()
sensor = adafruit_bh1750.BH1750(i2c)

while True:
    print("Lux: {:.2f}".format(sensor.lux))
    sleep(1)

