#!/bin/bash

source valid.sh
source info_system.sh
source set_colors.sh

validation $@

for i in ${!ARR_PARAM[@]};
do 

printf "${COLORS_FONT[$1]}${COLORS_BACK[$2]}${ARR_PARAM[i]} $default = "
printf "${COLORS_FONT[$3]}${COLORS_BACK[$4]}${VAL_PARAM[i]} $default \n"

done


