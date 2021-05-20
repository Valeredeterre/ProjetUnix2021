#!/bin/bash
noir='\e[0;30m'
gris='\e[1;30m'
rougefonce='\e[0;31m'
rose='\e[1;31m'
vertfonce='\e[0;32m'
vertclair='\e[1;32m'
orange='\e[0;33m'
jaune='\e[1;33m'
bleufonce='\e[0;34m'
bleuclair='\e[1;34m'
violetfonce='\e[0;35m'
violetclair='\e[1;35m'
cyanfonce='\e[0;36m'
cyanclair='\e[1;36m'
grisclair='\e[0;37m'
blanc='\e[1;37m'

neutre='\e[0;m'
# Paramètres


taille=50
vies=3

#Début

for ((i=0; $taille-$i ; i++)) 
do # Déclaration du tableau 
    screen[$i]=0
done 
screen[3]=2
screen[4]=1

clear
function center
{
	height=$(tput lines)
	lenght=$(tput cols)
	for((j=0; j<(height/2)-1; j++))
	do
		echo ""
	done
	for((j=0; j<(lenght/2)-50; j++))
	do
		echo -ne " "
	done
}

function colorGenerator
{
if [[ $1 -eq 0 ]]
	then
		if [[ $RANDOM%3 -gt 1 ]]
			then
				echo '0'
			else
				if [[ $RANDOM%2  -gt 0 ]]
					then
						echo '1'
					else
						echo '2'
				fi
		fi
fi
if [[ $1 -eq 1 ]]
	then
		if [[ $RANDOM%2  -gt 0 ]]
			then
				echo '1'
			else
				echo '0'
		fi
fi
if [[ $1 -eq 2 ]] 
	then
		if [[ $RANDOM%2 -gt 0 ]]
			then
				echo '2'
			else
				echo '0'
		fi
fi
}

# Fonctions 
function affichage()
{
    echo -e "${screen[@]}"
}

function decalage()
{
    
    for ((i=0; i < $taille - 1  ; i++))
    do 
        screen[$i]=${screen[$(( $i + 1 ))]}
    done
    screen[49]=$(colorGenerator ${screen[48]})
}

function lecteur()
{

	echo "${screen[@]}"
}

#Boucle principale
while [[ 0 < $vies ]] 
do
	clear
	center
	decalage
	lecteur 
	sleep 0.5
done


#Fin et score 



#lecteur
#decalage
