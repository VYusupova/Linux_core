echo "Обозначения цветов: (1 — white, 2 — red, 3 — green, 4 — blue, 5 – purple, 6 — black)"
echo "Параметр 1 — это фон названий значений (HOSTNAME, TIMEZONE, USER и т. д.).
Параметр 2 — это цвет шрифта названий значений (HOSTNAME, TIMEZONE, USER и т. д.).
Параметр 3 — это фон значений (после знака '=').
Параметр 4 — это цвет шрифта значений (после знака '=')."


cd src/03/
./main.sh 1 2 3 4

./main.sh 5 6 6 5

./main.sh 4 5 6 7

./main.sh -2 5 6 1

./main.sh 1 0 6 1

./main.sh

./main.sh 1

./main.sh 1 2 3
