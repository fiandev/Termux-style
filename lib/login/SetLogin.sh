#!/usr/bin/env sh

chmod 777 $PREFIX/bin/exe-login.sh
chmod 777 $PREFIX/bin/login

BASHRC_PATH="/data/data/com.termux/files/usr/etc/bash.bashrc";

# copy file
cp "./lib/login/bash.bashrc" $BASHRC_PATH;
cp ./lib/login/exe-login.sh $PREFIX/bin/

clear;

PathLogin="/data/data/com.termux/files/usr/share/logged";

if [ ! -d "$PathLogin" ]; then
  mkdir $PathLogin
fi

chmod 777 $PathLogin;

UsernameCredentials="$PathLogin/.username";
PasswordCredentials="$PathLogin/.password";

read -p "Enter Username: " username;
read -p "Enter new password: " passone;
read -p "Repeat password: " passtwo;

if [ $passone = $passtwo ];
then
  
	# touch /data/data/com.termux/files/usr/share/login/.pass
  # usernameHashing="$(echo -n $username | md5sum )";
  # passwordHashing="$(echo -n $passone | md5sum )";
  
  usernameHashing=$username;
  passwordHashing=$passone;
  
  # create file credentials
	touch $UsernameCredentials;
	touch $PasswordCredentials;
	echo $usernameHashing > $UsernameCredentials;
	echo $passwordHashing > $PasswordCredentials;
	
	echo 'Login installed'
elif [ $passone != $passtwo ]
then
	echo 'Password dont match';
fi