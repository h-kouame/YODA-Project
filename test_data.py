import string
import random
num_of_bytes = 1000000 #actual number is 1000*4
filename = "test_data_" + str(num_of_bytes*4) + "_bytes.txt"
with open(filename, "w") as f:
    for i in range(num_of_bytes):
        if(i%5 == 0):
            f.write("00FF")
        else:
            f.write(random.choice(string.ascii_letters) + 
                    str(random.randint(1,9)) +
                    random.choice(string.ascii_letters) +
                    str(random.randint(1,9)))
f.close()            
        
