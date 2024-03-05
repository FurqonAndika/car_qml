# import serial
# import serial.tools.list_ports


# if __name__=="__main__":
#     comlist = serial.tools.list_ports.comports()
#     connected = []
#     for element in comlist:
#         connected.append(element.device)
#     print("Connected COM ports: " + str(connected))

import serial
import serial.tools.list_ports
comlist = serial.tools.list_ports.comports()
connected = []
for element in comlist:
    connected.append(element.device)
# print("Connected COM ports: " + str(connected))
print(connected)

port = None
open_port = False
lst = connected
lst.reverse()
print( lst)

while  open_port is not True:
    for com in lst:
        try:
            ser = serial.Serial(com, 9600, timeout=0.5).read()
            if ser:
                print(com)
                port = com
                open_port = True
                break
                # if (ser.readline()):
                #     port = com
                #     print("masuk")
        except Exception as e:
            print(e)
    break

ser = serial.Serial(port, 9600, timeout=0.5) 
while True:
    try:
        # Reading all bytes available bytes till EOL 
        line = ser.readline() 
        if line:
            # Converting Byte Strings into unicode strings
            string = line.decode()
            print(string.strip())    
    except Exception as e:
        print(e)
        try:
            ser = serial.Serial(port,9600, timeout=0.5)
            pass
        except Exception as e:
            print(e)

ser.close()