#portScan.sh
#!/bin/bash

#EXIT function if CTRL+C
function ctrl_c(){
  echo -e "\nEXIT\n"
  tput cnorm; exit 1
}

#Ctrl+C
trap ctrl_c INT

#Port Scanner
for port in $(seq 1 65535); do
  (echo '' > /dev/tcp/127.0.0.1/$port) 2>/dev/null && echo "Port $port - OPEN" &
done; wait
