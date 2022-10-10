# cp ./login.php $PREFIX/bin/
#chmod 700 $PREFIX/bin/login.php
#cp login $PREFIX/bin/
#chmod 700 $PREFIX/bin/login
clear
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
	echo $usernameHashing >> $UsernameCredentials;
	echo $passwordHashing >> $PasswordCredentials;
	
	echo 'Login installed'
elif [ $passone != $passtwo ]
then
	echo 'Password dont match';
fi