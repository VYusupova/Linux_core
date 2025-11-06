#!/bin/bash

default='\e[0m'

red_font='\e[31m'
green_font='\e[32m'
yellow_font='\e[33m'
blue_font='\e[34m'
purple_font="\e[35m"
biruz_font='\e[36m'
white_font='\e[37m'
black_font='\e[30m'

red_back='\e[41m'
green_back='\e[42m'
yellow_back='\e[43m'
blue_back='\e[44m'
purple_back="\e[45m"
biruz_back='\e[46m'
white_back='\e[47m'
black_back='\e[40m'


COLORS_FONT=(
$yellow_font #default
$white_back
$red_back
$green_back
$blue_back
$purple_back
$black_back
)
COLORS_BACK=(
$biruz_back #default
$white_font
$red_font
$green_font
$blue_font
$purple_font
$black_font
) 



