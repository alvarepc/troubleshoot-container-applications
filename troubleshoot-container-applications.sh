#!/bin/bash

var="-------------"
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

print_SUCCESS () {
	printf "${GREEN}%s${NC}\n" "SUCESS"
}

print_FAIL () {
	printf "${RED}%s${NC}\n" "FAIL"
}

printf "%s\n" "------------------------------------------------------------------------------"
printf "%s\n" "Setting up for the exercise"
printf "%s\n" "------------------------------------------------------------------------------"
printf "WARNING: Do not press any key while the script running\n"
cp /etc/sysconfig/docker /etc/sysconfig/docker.lab.bkp
cp ./docker /etc/sysconfig/docker
dos2unix /etc/sysconfig/docker
systemctl restart docker
printf "%s${NC}\n" "------------------------------------------------------------------------------"
printf "%s%s\n" "$var: Logging in as the developer user :$var"
if oc login -u developer -p pass4alvarepc
then
	print_SUCCESS
else
	print_FAIL
fi
printf "%s%s\n" "$var: Creating the network-review project :$var"
if oc new-project execute-review
then
	print_SUCCESS
else
	print_FAIL
fi
printf "%s${NC}\n" "------------------------------------------------------------------------------"
