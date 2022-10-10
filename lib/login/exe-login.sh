#!/usr/bin/env sh

PathLogin="/data/data/com.termux/files/usr/share/logged";

# permission
chmod 777 $PathLogin;

UsernameCredentials="$PathLogin/.username";
PasswordCredentials="$PathLogin/.password";

chmod 777 $UsernameCredentials;
chmod 777 $PasswordCredentials;

getCredentials() {
  clear;
  
  read -p "Enter Username: " username;
  read -p "Enter Password: " password;
  
  #verifyUsername=$(echo -n $username | md5sum -c $usernameCredentials);
  #verifyPassword=$(echo -n $password | md5sum -c $passwordCredentials);
  
  verifyUsername=$(cat $UsernameCredentials);
  verifyPassword=$(cat $PasswordCredentials);
  
  if [ "$verifyUsername" = "$username" ] && [ "$verifyPassword" = "$password" ]; then
      echo "success login!";
      exit;
  else
      echo "login failed!";
      sleep 1;
      getCredentials;
  fi
}


getCredentials;
exit;