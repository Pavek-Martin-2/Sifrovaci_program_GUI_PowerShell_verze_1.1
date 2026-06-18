#!/usr/bin/bash

pole_znaky=( [10]="a" {b..z} {A..Z} {0..9} )
d_pole_znaky=${#pole_znaky[@]}

#declare -A matrix # -A to make NAMEs associative arrays
declare -a matrix

# TAKTO
# 0,10=a az 0,71="b"
# 125,10="x" az 125,71="y"

matrix_vodorovne=61 # 61 = 10-71
matrix_svisle=125 # ma bejt 0-125 a v hodnote klice ma bej pismeno "A" apod.


out_1="declare -A matrix=( "
for (( aa = 0; aa <= matrix_svisle; aa++ )) do
echo "# "$aa"-"$((matrix_vodorovne + 10 ))
for (( bb = 10; bb <= 10 + matrix_vodorovne; bb++ )) do
# declare -A matrix2=([1,1]="11" [1,2]="12" [2,1]="21" [2,2]="22") takto ma vypadat vystup
rnd=$(( $RANDOM % $d_pole_znaky + 10 ))
vloz=${pole_znaky[$rnd]}
#echo $vloz"<"
matrix[$aa,$bb]=$vloz
prvek="["$aa","$bb']="'${matrix[$aa,$bb]}'" '
echo $prvek
out_1+=$prvek
done
done
out_1+=")"

#

echo "matrix_vodorovne="$matrix_vodorovne
echo "matrix_svisle="$matrix_svisle
echo "matrix_delka="$(($matrix_vodorovne * $matrix_svisle))
echo $out_1

echo "matrix_vodorovne="$matrix_vodorovne > key1
echo "matrix_svisle="$matrix_svisle >> key1
echo "matrix_delka="$(($matrix_vodorovne * $matrix_svisle)) >> key1
echo $out_1 >> key1

