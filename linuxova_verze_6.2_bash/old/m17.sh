#!/usr/bin/bash

pole_znaky=( [10]="a" {b..z} {A..Z} {0..9} )
d_pole_znaky=${#pole_znaky[@]}

#declare -A matrix # -A to make NAMEs associative arrays
declare -a matrix

# TAKTO
# 0,10=a az 0,71="b"
# 125,10="x" az 125,71="y"

matrix_vodorovne=3 # ma bejt 10-71
matrix_svisle=4 # ma bejt 0-125 a v hodnote klice ma bej pismeno "A" apod.


out_1="declare -A matrix=( "
for (( cc = 1; cc <= matrix_svisle; cc++ )) do
echo "# "$cc"-"$matrix_vodorovne
for (( dd = 1; dd <= matrix_vodorovne; dd++ )) do
# declare -A matrix2=([1,1]="11" [1,2]="12" [2,1]="21" [2,2]="22") takto ma vypadat vystup
rnd=$(( $RANDOM % $d_pole_znaky + 10 ))
vloz=${pole_znaky[$rnd]}
#echo $vloz"<"
matrix[$cc,$dd]=$vloz
prvek="["$cc","$dd']="'${matrix[$cc,$dd]}'" '
echo $prvek
out_1+=$prvek
done
done
out_1+=")"

#

echo "matrix_vodorovne="$matrix_vodorovne
echo "matrix_svisle="$matrix_svisle
d_matrix=${#matrix[@]}
echo "delka pole matrix je "$d_matrix

echo $out_1
echo $out_1 > key1












