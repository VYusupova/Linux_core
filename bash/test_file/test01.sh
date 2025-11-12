cd  src/01/
printf "test string main.sh 1 2 3 \n\t"
bash main.sh 1 2 3

printf "test string main.sh 12 \n\t"
bash main.sh 12

printf "test string main.sh -13 \n\t"
bash main.sh -13

printf "test string main.sh +14 \n\t"
bash main.sh +14

printf "test string main.sh text \n\t"
bash main.sh text

printf "test string main.sh text1 \n\t"
bash main.sh text1

printf "test string main.sh 1text \n\t"
bash main.sh 1text

printf "test string main.sh te1xt \n\t"
bash main.sh te1xt

printf "test string main.sh 1 text \n\t"
bash main.sh 1 text

printf "test string main.sh text 1 \n\t"
bash main.sh text 1
