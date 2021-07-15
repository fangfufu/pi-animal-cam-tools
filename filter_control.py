#!/usr/bin/python3

from gpiozero import LED
from time import sleep
import board
import adafruit_bh1750

i2c = board.I2C()
sensor = adafruit_bh1750.BH1750(i2c)
daymode = LED(25)
lux_avg = sensor.lux
daymode.on()

while True:
    lux_avg = lux_avg * 0.9 + sensor.lux * 0.1
    if lux_avg > 25:
        daymode.on()
    elif lux_avg < 20:
        daymode.off()

    print("Lux: {:.2f}, Lux Avg: {:.2f}, Day Mode: {}".format(sensor.lux, lux_avg, daymode.is_active))
    sleep(6)
