#!/usr/bin/bash

PathLogin="/data/data/com.termux/files/usr/share/logged";

# permission
chmod 777 $PathLogin;

UsernameCredentials="$PathLogin/.username";
PasswordCredentials="$PathLogin/.password";

chmod 777 $UsernameCredentials;
chmod 777 $PasswordCredentials;

getCredentials() {
  clear;
  
  read -p "Enter Username: " inputUsername;
  read -p "Input Password: " inputPassword;
  
  #verifyUsername=$(echo -n $username | md5sum -c $usernameCredentials);
  #verifyPassword=$(echo -n $password | md5sum -c $passwordCredentials);
  
  verifyUsername=$(cat $UsernameCredentials);
  verifyPassword=$(cat $PasswordCredentials);
  
  if [ "$verifyUsername" = "$inputUsername" ] && [ "$verifyPassword" = "$inputPassword" ]; then
      echo "success login!";
      sleep 1;
      clear;
      
      echo "Welcome, ${inputUsername}!"
      exit;
  else
      echo "login failed!";
      sleep 1;
      getCredentials;
  fi
}

getCredentials
exit;