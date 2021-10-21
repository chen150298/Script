#!/bin/bash
# Chen Larry 

ex21_func () {
 # enter the given path
 cd $1
 # for all files ends with $2
 for i in $(ls -v *.$2 2>/dev/null)
  do
   # find all lines contain $3
   str="$(cat $i | grep -wi $3)"
   # print only if exist
   if test -n "$str"
    then echo "$str"
   fi
  done
}

# main

# not enough parameters
if test $# -lt 4
 then echo "Not enough parameters"
      exit
fi

# enter the given path
cd $1

# for all directories (include this)
for d in $(find -type d | sort)
 do
  # get result from ex21.sh - lines contains the word $3
  result=$(ex21_func $d $2 $3)
  # while there is line to read in $result
  while IFS= read -r line
   do
   # print lines longer/equal to $4
   if test -n "$line" -a $(echo "$line" | wc -w) -ge $4
    then
     echo "$line"
    fi
   done <<< "$result"
 done
