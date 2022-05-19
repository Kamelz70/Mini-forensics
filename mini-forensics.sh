#!/bin/bash

#regular expression to check with if inputs are numbers
#starts with + or - and then any number of digits
re='^[+|-]*[0-9]+$'


#loop untill a valid choice is input
while [ 1 ]; do

echo "Enter A Choice :"
echo "1. Find inode of a file"
echo "2. Find file of an inode number"
echo "3. Take a hashed bit-by-bit image of a drive"
echo "4. Divide"
echo "5. exit"
#read choice
read choice

#execute choice
case $choice in
  1)
    echo "Enter A File name or directory :"
    read file
    ls -i $file
    ;;
  2)
    echo "Enter inode number"
    read inodeNum
    find -inum $inodeNum
  ;;
  3)mini-forensics.sh
    echo "Enter Source File Path to copy"
    read srcpath
    echo ""
    echo "Enter destination path ending with desired image name"
    echo "Exaple: /home/kali/Desktop/imgName"
    read dstpath
    echo "Enter desired hashing algorithm"
    echo "sha1, ,sha2, or md5"
    read hashAlgo
    echo ""
    echo "Enter desired byte size for image"
    read byteSize
    echo ""

    dcfldd if=$srcpath of=$dstpath hash=$hashAlgo bs=$byteSize

  ;;
  4)result=$(($n1 / $n2))
  ;;
  5)exit
  ;;
  *)
  #redo the loop if choice incorrect
  echo "invalid choice"
  continue
  ;;
esac
#break on correct choice
break
done
