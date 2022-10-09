#!/usr/bin/bash
req=${HOME}/.termux;
#warna
merah="\033[1;31m";
hijau="\033[1;32m";

input(){
	read -p 'input option : ' input_nilai;
	case $input_nilai in
		1)
		sh $(pwd)/sys/__load__;
		;;
		0)
		echo "see you again bro 🙂";
		;;
		*)
		echo "${merah}select null !"
		;;
	esac
}
main(){
  pkg install toilet -y
  clear
  echo "
       ${merah} LIST MENU :
       ${hijau} 1. change font
       ${hijau} 0. exit
      ";
  input
}

main
