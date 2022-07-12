import os
import sched, time
from time import time, sleep

def bucket_size():
    os.system("gsutil du -s gs://acme-storage-prod/ |grep -E -o '[[:digit:]]+'")
A = bucket_size()
print (A)

Size = int(0 if A is None else A)
print(type(Size))
Max_size = int(20971520)

def bucket_size_check():
    print("Hello")
    if Size > Max_size:
        os.system("gsutil rm -r gs://acme-storage-prod")
    else:
        print('it is less than 20mb')  

bucket_size_check()


while True:
    sleep(600 - time() % 600)
    bucket_size_check()
