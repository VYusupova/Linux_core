

printf  "\n ----- Testing not valid parametr ------ \n"
./main.sh 1 2 3 4 5
./main.sh 
./main.sh 1 1 2 3
./main.sh 5 6 2 2

printf  "\n ----- Testing valid parametr ------ \n"
./main.sh 5 6 6 2
./main.sh 1 2 3 4
