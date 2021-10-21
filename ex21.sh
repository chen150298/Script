#!/bin/bash
# Chen Larry 209192798

# not enough parameters
if test $# -lt 3
 then echo "Not enough parameters"
      exit
fi

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
