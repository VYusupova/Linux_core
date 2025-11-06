#!/bin/bash
name_config="color_parametrs.config"

source valid.sh
source info_system.sh
source set_colors.sh
source $name_config

validation $@

for i in ${!ARR_PARAM[@]};
do 

printf "${COLORS_FONT[$column1_background]}${COLORS_BACK[$column1_font_color]}${ARR_PARAM[i]} $default = "
printf "${COLORS_FONT[$column2_background]}${COLORS_BACK[$column2_font_color]}${VAL_PARAM[i]} $default \n"

done


source out_colors.sh
printf "\ncolumn 1 background = "
back $column1_background
printf "column 1 font_color = "
font $column1_font_color
printf "column 2 background = "
back $column2_background
printf "column 2 font_color = "
font $column2_font_color
