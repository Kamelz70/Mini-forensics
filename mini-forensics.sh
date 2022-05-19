#!/bin/bash

#regular expression to check with if inputs are numbers
#starts with + or - and then any number of digits
numRe='^[+|-]*[0-9]+$'

#regular expression to check with if inputs are valid operations
operatorRe='^[+|-]{1}$'
#Save last operation to do on result
lastOperation=+

#Result which changes over each argument
result=0

#Argument number to check if operation or number
argnum=1

#loop on all arguments
for arg in $@
do
#even argument for operations only
if [ $(($argnum % 2)) == 0 ] ; then
    #check argument if alid operation
    if ! [[ $arg =~ $operatorRe ]] ; then
        echo "error: input $arg Not a valid operation" >&2;
        exit
    else
        lastOperation=$arg
    fi
#odd argument for numbers only
else 
    #check argument if alid number    
    if ! [[ $arg =~ $numRe ]] ; then
        echo "error: input $arg Not a number" >&2;
        exit
    else
        #do operation based on argument add or sub
        if [ $lastOperation == '-' ] ; then
            result=$(($result - $arg)) 
        else
            result=$(($result + $arg)) 
        fi
    fi
fi
#increment argument number
argnum=$(($argnum + 1))
done

#print result
echo "Result is : $result"

