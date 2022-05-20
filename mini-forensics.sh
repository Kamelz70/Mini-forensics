#!/bin/bash

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
    #list inode command for file
    ls -i $file
    continue
    ;;
  2)
    echo "Enter inode number"
    read inodeNum
    #find inode command on the number
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
    #command which copies the source to a hashed destination with md5 to check with
    dcfldd if=$srcpath of=$dstpath hash=md5 bs=$byteSize
    echo ""
    echo "Hashes for both source and result image: (have to be identical)"
    #md5 check on both files
    md5sum $srcpath
    md5sum $dstpath
    continue
    ;;
  4)
    echo ""
    echo "Available network devices to choose from:"
    #command which lists network devices available
    sudo tcpdump -D 
    echo ""
    echo "Enter a device to capture packets"
    echo "Once started press ctrl+c to stop capturing"
    read interface
    #command which starts capturing packets from device of choice
    sudo tcpdump --interface  $interface
    
    continue
    ;;
    
  5)
    echo ""
    echo "enter path to file"
    read file
    #command which reds .pcap file and list packet info
    tcpdump -r $file 
    continue
  ;;
  6)
  #exit program in case of input 5
  exit
  ;;
  *)
  #redo the loop if choice is incorrect
  echo ""
  echo "invalid choice"
  continue
  ;;
esac
break
done
