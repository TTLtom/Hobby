#!/bin/bash
declare a=0
declare -a arr
declare -A chars=( [A]=1 [E]=1 [I]=1 [O]=1 [U]=1 [L]=1 [N]=1 [R]=1 [S]=1 [T]=1 [D]=2 [G]=2 [B]=3 [C]=3 [M]=3 [P]=3 [F]=4 [H]=4 [V]=4 [W]=4 [Y]=4 [K]=5 [J]=8 [X]=8 [Q]=10 [Z]=10 ) #[kulcs]=érték
KEYS=(${!chars[@]}) #tömb elemeinek eltárolása változóban
echo "Please enter a word and press enter:"

read input
while [[ ! $input =~ ^[A-Za-z] ]]; do 
    echo -n "Please enter only alphabetic characters:"
    read input
done

inp=${input^^}
c1=${#inp} #karakterszám
c3=$((c1-1)) #tömb index 0-tól kezdődik, így itt eggyel kisebb szám kell

for ((c=0; c<=c3; c++)); do
arr[$c]=${inp:c:1}

	for (( I=0; $I < ${#chars[@]}; I+=1 )); do #A tömb elemein I-szer halad végig, ahol I= a tömb elemszámával
		if [ ${arr[$c]} = ${KEYS[$I]} ] #Ha az inputként megadott karakter(ek) az adott ciklusidőben előforduló karaktere megegyezik a tömb bmelyik kulcs elemével
		then let a+=${chars[${KEYS[$I]}]} #akkor az '$a' változó értékéhez hozzáadjuk az aktuális indexű (KEYS) kulcs értékpárját
		fi;
	done


done
echo "Your score is:" $a
