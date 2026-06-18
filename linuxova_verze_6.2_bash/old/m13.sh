#!/usr/bin/bash

pole_znaky=( [10]="a" {b..z} {A..Z} {0..9} )
d_pole_znaky=${#pole_znaky[@]}

#declare -A matrix # -A to make NAMEs associative arrays
declare -a matrix
matrix_vodorovne=3 # ma bejt 10-71
matrix_svisle=4 # ma bejt 0-125 a v hodnote klice ma bej pismeno "A" apod.

# vytvori pole 5x10 a naplni ho rnd 10 az 71

for (( aa = 1; aa <= matrix_svisle; aa++ )) do
for (( bb = 1; bb <= matrix_vodorovne; bb++ )) do
rnd=$(( $RANDOM % $d_pole_znaky + 10 ))
matrix[$aa,$bb]=$rnd
# rnd 10 az 71
done
done

# vypis pole

d_matrix=${#matrix[@]}

#echo "matrix "$matrix_vodorovne" x "$matrix_svisle" poly"
#echo "matrix delka = "$d_matrix
#echo ""


#echo "declare -A matrix"
echo "matrix_vodorovne="$matrix_vodorovne
echo "matrix_svisle="$matrix_svisle

out_1="declare -A matrix=( "
# declare -A matrix2=([1,1]="11" [1,2]="12" [2,1]="21" [2,2]="22")
for (( cc = 1; cc <= matrix_svisle; cc++ )) do
echo "# "$cc"-"$matrix_vodorovne
for (( dd = 1; dd <= matrix_vodorovne; dd++ )) do
#klic=${matrix[$cc,$dd]}
#echo $klic
#prvek="["$cc","$dd"]="${matrix[$cc,$dd]}" "
prvek="["$cc","$dd']="'${matrix[$cc,$dd]}'" '
echo $prvek
out_1+=$prvek
#out_1="matrix["$cc","$dd"]="${matrix[$cc,$dd]}
#echo $out_1
done
done
out_1+=")"

echo $out_1
echo $out_1 > key1
