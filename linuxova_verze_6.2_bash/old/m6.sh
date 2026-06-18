#!/usr/bin/bash

pole_znaky=( [10]="a" {b..z} {A..Z} {0..9} )
d_pole_znaky=${#pole_znaky[@]}

declare -A matrix # -A to make NAMEs associative arrays
vodorovne=3
svisle=4

# vytvori pole 5x10 a naplni ho rnd 10 az 71

for (( aa = 1; aa <= vodorovne; aa++ )) do
for (( bb = 1; bb <= svisle; bb++ )) do
matrix[$aa,$bb]=$(( $RANDOM % $d_pole_znaky + 10 ))
done
done

# vypis pole

d_matrix=${#matrix[@]}
echo "matrix "$vodorovne" x "$svisle" poly"
echo "matrix delka = "$d_matrix
echo ""

for (( cc = 1; cc <= vodorovne; cc++ )) do
echo "# "$cc
for (( dd = 1; dd <= svisle; dd++ )) do
#klic=${matrix[$cc,$dd]}
#echo $klic
out_1="matrix["$cc","$dd"]="${matrix[$cc,$dd]}
echo $out_1
done
#
done










