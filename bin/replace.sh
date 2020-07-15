#!/bin/bash

rm -f .$1.tmp
cp $1 .$1

grep -n "<\!-- #IMPORT" $1 | while read -r line; 
do
    export f=$(echo $line | awk '{print $3}')
    export n=$(grep -n "<\!-- #IMPORT $f -->" .$1 | awk -F: '{print $1}')

    echo "$(head -n $(($n-1)) .$1)" > .$1.tmp
    cat $f >> .$1.tmp
    echo "$(tail -n +$(($n+1)) .$1)" >> .$1.tmp

    mv .$1.tmp .$1
done
cat .$1
rm .$1
