import RPi.GPIO as GPIO
import time

GPIO.setmode(GPIO.BCM)
time.time()
GPIO.setwarnings(False)

GPIO.setup(23, GPIO.OUT)
GPIO.setup(24, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)

print("type Ctrl+c to quit\n")

try:
    while True:
        GPIO.output(23, False)
        time.sleep(0.1)
        
        GPIO.output(23, True)
        time.sleep(0.00001)
        GPIO.output(23, False)
        
        while GPIO.input(24)==0:
            start = time.time()
            
        while GPIO.input(24)==1:
            stop = time.time()
            
        time_interval = stop - start
        distance = time_interval * 14680
        distance = round(distance, 2)
        
        print("Distance ==> {0} cm\n".format(distance))

except KeyboardInterrupt:
    GPIO.cleanup()
    print("Program End")