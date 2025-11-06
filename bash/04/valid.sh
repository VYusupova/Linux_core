#!/bin/bash

def=0

valid_color(){

if [[ ! -v "$1"  ]];
then
	echo "$1=$def" >> /dev/null
else 
	if [[ ! $(($1)) =~ ^[1-6] ]];
	then
	echo "look in file $name_config not valid parametr : $1 be 1-6"
	exit 1;
	fi
fi
}

valid_eq_param(){
if [[ $(($1)) -eq $(($2)) ]]
then
	if [[ $(($1)) -ne 0 ]];
	then
		echo "look in file $name_config parametrs $1 == $2"
		exit 1;
	fi
fi
}

validation()
{
if [ $# -ne 0 ];
then 
echo "dont enter parametr. run script like $0"
exit 1
fi 

valid_color "column1_font_color" 
valid_color "column1_background" 
valid_color "column2_background" 
valid_color "column2_font_color"

valid_eq_param $column1_background $column1_font_color
valid_eq_param $column2_background $column2_font_color


}


