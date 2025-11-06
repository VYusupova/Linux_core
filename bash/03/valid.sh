#!/bin/bash
validation()
{
if [ $# -ne 4 ];
then 
echo "Enter 4 parametr like $0 1 2 3 4"
exit 1
fi 

for i in $@
do 

if [[ ! "$i" =~ ^[1-6] ]];
then
echo "not valid parametr $i must be 1-6"
exit 1;
fi

done

if [[ $1 == $2 ]] || [[ $3 == $4 ]];
then
echo "parametr duplicate try again your enter  string : $0 $@"
exit 1;
fi

}
