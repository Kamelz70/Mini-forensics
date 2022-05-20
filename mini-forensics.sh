#!/bin/bash

#regular expression to check with if inputs are numbers
#starts with + or - and then any number of digits
re='^[+|-]*[0-9]+$'


#loop untill a valid choice is input
while [ 1 ]; do
echo ""
echo "Enter A Choice :"
echo "1. Find inode of a file"
echo "2. Find file of an inode number"
echo "3. Take a hashed bit-by-bit image of a drive"
echo "4. Capture packets from a network device"
echo "5. Read a network trace file (.pcap)"
echo "6. exit"
#read choice
read choice

#execute choice
case $choice in
  1)
    echo "Enter A File name or directory :"
    read file
    ls -i $file
    continue
    ;;
  2)
    echo "Enter inode number"
    read inodeNum
    find -inum $inodeNum
    continue
  ;;
  3)
    echo "Enter Source File Path to copy"
    read srcpath
    echo ""
    echo "Enter destination path ending with desired image name"
    echo "Exaple: /home/kali/Desktop/imgName"
    read dstpath
    echo "Enter desired byte size for image"
    read byteSize
    echo ""
    dcfldd if=$srcpath of=$dstpath hash=md5 bs=$byteSize
    echo ""
    echo "Hashes for both source and result image:"
    md5sum $srcpath
    md5sum $dstpath
    continue
    ;;
  4)
    echo ""
    echo "Available network devices to choose from:"
    sudo tcpdump -D 
    echo ""
    echo "Enter a device to capture packets"
    echo "Once started press ctrl+c to stop capturing"
    read interface
    sudo tcpdump --interface  $interface
    
    continue
    ;;
    
  5)
    echo ""
    echo "enter path to file"
    read file
    tcpdump -r $file 
    continue
  ;;
  6)exit
  ;;
  *)
  #redo the loop if choice incorrect
  echo ""
  echo "invalid choice"
  continue
  ;;
esac
#break on correct choice
break
done
