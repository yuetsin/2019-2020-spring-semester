#!/usr/bin/env python3

from math import sin, cos, pi, atan2
from time import sleep
from random import random

distance = 1

theta_rad = 20
theta = theta_rad * pi / 180
omega = 0.0

world_g = 9.80665
length = 1

time_elapse = 0.033
current_time = 0

csv_lines = []

x = distance * cos(theta)
y = distance * sin(theta)

counter = 0

last_time = 0
last_theta = theta
last_omega = 0

try:
    while True:

        current_time += time_elapse

        theta += omega * time_elapse
        omega -= world_g / distance * sin(theta) * time_elapse

        sleep(time_elapse)

        actual_theta = atan2(y, x)

        print("time: %.3f theta: %.2f actual_theta: %.2f omega: %.2f" %
              (current_time, theta * 180 / pi, actual_theta * 180 / pi, omega), end='\r')

        csv_lines.append("%f, %f, %f, %f\n" %
                         (current_time, theta * 180 / pi, actual_theta * 180 / pi, omega))

        if last_time == 0:
            last_time = time_elapse
            last_omega = omega
            last_theta = theta
        else:
            actual_time = time_elapse + last_time
            x += sin(last_theta) * last_omega * distance * actual_time
            y += cos(last_theta) * last_omega * distance * actual_time
            last_time = 0
            last_omega = 0
            last_theta = 0


except KeyboardInterrupt:
    print("\ninterrupted")

filename = input("\ncsv file name? >>> ")

with open(filename, 'w') as f:
    f.writelines(csv_lines)

print("ok")