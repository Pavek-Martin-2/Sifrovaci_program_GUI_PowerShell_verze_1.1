#!/usr/bin/bash

cesta_soubory_hesel="/home/pi/bash/verze_6_bash/keys/"


pole_znaky=( [10]="a" {b..z} {A..Z} {0..9} )
d_pole_znaky=${#pole_znaky[@]}

#declare -A matrix # -A to make NAMEs associative arrays
declare -a matrix

max_mix=300 # nechat jak je
max_pole=126 # 126 je maximalni delka hesla aby byl string v zip file comment jenom na jeden radek !!! (nedavat vic jak 125)
#max_pole=10 # testovaci

: '
for (( mix = 1; mix <= $max_mix; mix++)); do
rnd_1=$(( $RANDOM % $d_pole_znaky + 10 ))
rnd_2=$(( $RANDOM % $d_pole_znaky + 10 ))
#echo $rnd_1
#echo $rnd_2
pom=${pole_znaky[$rnd_1]}
#echo $pom
pole_znaky[$rnd_1]=${pole_znaky[$rnd_2]}
pole_znaky[$rnd_2]=$pom
done

declare -p pole_znaky

exit 1
'


: '
for (( aa = 0; aa <= $max_pole - 1; aa++)); do
for (( bb = 1; bb <= $max_mix; bb++)); do
rnd_1=$(( $RANDOM % $d_pole_znaky + 10 ))
rnd_2=$(( $RANDOM % $d_pole_znaky + 10 ))
#echo $rnd_1
#echo $rnd_2
pom=${pole_znaky[$rnd_1]}
#echo $pom
pole_znaky[$rnd_1]=${pole_znaky[$rnd_2]}
pole_znaky[$rnd_2]=$pom
done # bb
done # aa
'


# TAKTO
# 0,10=a az 0,71="b"
# 125,10="x" az 125,71="y"

matrix_vodorovne=61 # 61 = 10-71
matrix_svisle=125 # ma bejt 0-125 a v hodnote klice ma bej pismeno "A" apod.

#matrix_vodorovne=2 # 61 = 10-71
matrix_svisle=3 # ma bejt 0-125 a v hodnote klice ma bej pismeno "A" apod.



echo "matrix_vodorovne="$matrix_vodorovne > key1 # $1 pozdej
echo "matrix_svisle="$matrix_svisle >> key1
echo "matrix_delka="$(($matrix_vodorovne * $matrix_svisle)) >> key1

echo "declare -A matrix=( " >> key1

for (( aa = 0; aa <= matrix_svisle; aa++ )) do
echo "# "$aa"-"$((matrix_vodorovne + 10 ))

for (( mix = 1; mix <= $max_mix; mix++)); do
rnd_1=$(( $RANDOM % $d_pole_znaky + 10 ))
rnd_2=$(( $RANDOM % $d_pole_znaky + 10 ))
#echo $rnd_1
#echo $rnd_2
pom=${pole_znaky[$rnd_1]}
#echo $pom
pole_znaky[$rnd_1]=${pole_znaky[$rnd_2]}
pole_znaky[$rnd_2]=$pom
done


for (( bb = 10; bb <= 10 + matrix_vodorovne; bb++ )) do

# declare -A matrix2=([1,1]="11" [1,2]="12" [2,1]="21" [2,2]="22") takto ma vypadat vystup

#rnd=$(( $RANDOM % $d_pole_znaky + 10 ))
#vloz=${pole_znaky[$rnd]}
#echo $vloz"<"
#matrix[$aa,$bb]=$vloz

# nove
vloz=${pole_znaky[$bb]}
#echo $vloz"<"
matrix[$aa,$bb]=$vloz


#prvek="["$aa","$bb']="'${[$aa,$bb]}'" '
prvek="["$aa","$bb']="'${pole_znaky[$bb]}'" '
echo $prvek
echo $prvek >> key1 # $1
#out_1+=$prvek
done
done

echo ")" >> key1 # $1

#

echo "matrix_vodorovne="$matrix_vodorovne
echo "matrix_svisle="$matrix_svisle
echo "matrix_delka="$(($matrix_vodorovne * $matrix_svisle))


