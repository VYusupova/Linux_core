echo "column1_background=1
column1_font_color=2
column2_background=3
column2_font_color=4" > color_parametrs.config

./main.sh

echo ""
echo "---test 2 column1_background = default others 2 3 4 ------"
echo ""

echo "column1_font_color=2
column2_background=3
column2_font_color=4" > color_parametrs.config

./main.sh

echo ""
echo "---test 3 background = default others  2 3 ------"
echo ""


echo "
column1_font_color=2
column2_font_color=4" > color_parametrs.config

./main.sh
