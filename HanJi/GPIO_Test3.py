import time
import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

GPIO.setup(21, GPIO.OUT)
GPIO.setup(12, GPIO.OUT)
GPIO.setup(25, GPIO.OUT)
GPIO.setup(23, GPIO.OUT)

GPIO.setup(26, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)

try:
    while(True):
        PIN=(GPIO.input(26))
        if PIN==1:
            #for _ in range(3):
            GPIO.output(21, False)
            GPIO.output(12, False)
            GPIO.output(25, False)
            GPIO.output(23, False)
            
            time.sleep(3)
            GPIO.output(21, True)
            time.sleep(10)
            
            GPIO.output(21, False)
            GPIO.output(12, True)
            time.sleep(10)
            
            GPIO.output(12, False)
            GPIO.output(25, True)
            time.sleep(10)
            
            GPIO.output(25, False)
            GPIO.output(23, True)
            time.sleep(10)
            
        if PIN==0:
            GPIO.output(21, False)
            GPIO.output(12, False)
            GPIO.output(25, False)
            GPIO.output(23, False)
        
except KeyboardInterrupt:
    GPIO.cleanup()
    print("Interruptedd! Exit!")
