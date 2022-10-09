#!/usr/bin/env sh

# import files
source "utilities/flags.sh";

declare -A flags=$@;
totalFlag=$#;


# clear screen
clear

if [ $totalFlag -lt 1 ]
then
  echo "need a flags for run this script";
  exit
fi

if [ -z ${SETLOGIN+x} ]
then
  sh "./lib/login/SetLogin.sh"
fi