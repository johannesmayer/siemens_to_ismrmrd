#!/bin/bash

fpath_output=$2
readarray -d '' datfiles < <(find . $1 -type f -name *.dat -print0)

echo "Converting all files that can be found in the tree."
for i in "${datfiles[@]}"
do
   echo "input is $i*" 
   output="${i%.*}.h5"
   output=${output##*/}
   output="${fpath_output}/${output}"
   
   echo "output is ${output}"
   siemens_to_ismrmrd -f $i -o $output 
done
