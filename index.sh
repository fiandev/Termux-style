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

if [ -z ${LOGIN+x} ]
then
  sh "./lib/login/SetLogin.sh"
elif [ -z ${THEME+x} ]
then
  sh "./lib/login/SetLogin.sh"
fi