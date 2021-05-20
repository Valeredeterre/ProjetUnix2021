#!/bin/bash

function equalCheck()
{
	if [[ $1 -eq $2 ]] 
	then
		echo 0
	else
		echo -1
	fi
} 

function recordCheck()
{
	rec=$(head -n1 record.txt)
	if [[ $rec < $1 ]]
	then
		echo $1 > record.txt
		echo "Veuillez entrer votre Nom"
		read name
		echo $name >> record.txt
	fi
}

function giveRecord()
{
	echo -ne "Le record est de "
	echo -ne $(head -n1 record.txt)
	echo -ne " et est détenu par "
	echo -ne $(tail -n1 record.txt) 
}


recordCheck 51
var=$(equalCheck 1 5) 
echo $var
