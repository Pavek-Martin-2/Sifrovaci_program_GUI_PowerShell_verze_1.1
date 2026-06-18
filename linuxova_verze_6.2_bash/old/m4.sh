#!/usr/bin/bash

pole_znaky=( [10]="a" {b..z} {A..Z} {0..9} )
d_pole_znaky=${#pole_znaky[@]}

declare -A matrix # -A to make NAMEs associative arrays
vodorovne=5
svisle=10

# vytvori pole 5x10 a naplni ho rnd 10 az 71

for (( aa = 1; aa <= vodorovne; aa++ )) do
for (( bb = 1; bb <= svisle; bb++ )) do
matrix[$aa,$bb]=$(( $RANDOM % $d_pole_znaky + 10 ))
done
done

# vypis pole

aa=${matrix[2,2]}
echo $aa

d_matrix=${#matrix[@]}
echo "matrix "$vodorovne" x "$svisle" poli"
echo "matrix delka = "$d_matrix
echo ${matrix[1,1]}







