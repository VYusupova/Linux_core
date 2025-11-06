#!/bin/bash
back() {
case $1 in
	'') printf  "default (biruz)\n";;
	1) printf  "1 (white)\n";;
        2) printf "2 (red)\n";;
	3) printf "3 (green)\n";;
	4) printf "4 (blue)\n";;
	5) printf "5 (purple)\n";;
	6) printf "6 (black)\n";
esac;
}

font() {
case $1 in
	'') printf  "default (yellow)\n";;
	1) printf  "1 (white)\n";;
        2) printf "2 (red)\n";;
	3) printf "3 (green)\n";;
	4) printf "4 (blue)\n";;
	5) printf "5 (purple)\n";;
	6) printf "6 (black)\n";
esac;
}
