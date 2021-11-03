#!/bin/bash



apt-get update -y
apt-get upgrade -y
sudo apt install default-jre -y
sudo apt install default-jdk -y 
sudo git clone https://github.com/skylot/jadx

cd jadx

./gradlew dist

alias jadx-gui=’~/<directoryName>/jadx/build/jadx/bin/jadx-gui’

#https://www.secplicity.org/2019/10/04/android-apk-reverse-engineering-using-jadx/
