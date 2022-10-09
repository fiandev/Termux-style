# cp ./login.php $PREFIX/bin/
#chmod 700 $PREFIX/bin/login.php
#cp login $PREFIX/bin/
#chmod 700 $PREFIX/bin/login
#mkdir /data/data/com.termux/files/usr/share/login/
clear

UsernameCredentials="./.username";
PasswordCredentials="./.password";

read -p "Enter Username: " username;
read -p "Enter new password: " passone;
read -p "Repeat password: " passtwo;

if [ $passone = $passtwo ];
then
	# touch /data/data/com.termux/files/usr/share/login/.pass
  usernameHashing="$(echo -n $username | md5sum )";
  passwordHashing="$(echo -n $passone | md5sum )";
  
  # create file credentials
	touch $UsernameCredentials;
	touch $PasswordCredentials;
	echo $usernameHashing >> $UsernameCredentials;
	echo $passwordHashing >> $PasswordCredentials;
	
	echo 'Login installed'
elif [ $passone != $passtwo ]
then
	echo 'Password dont match';
fi