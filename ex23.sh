#!/bin/bash
# Chen Larry 209192798

host_func () {
 # flag for check if no parameters
 flag=0
 # find uniqs
 args=$@
 uniq_args=$(echo "${args[@]}" | tr " " "\n" | awk '{print NR,$0}' | sort -uk2 | sort -n | cut -d " " -f 2 | tr "\n" " ")
 # print relevent arguments
 for arg in $uniq_args
  do
   case $arg in
    --static_hostname)
      echo $(cat hostnamectl | grep -wh 'Static hostname' | awk '{for (i=3; i<NF; i++) printf $i " "; print $NF}')
      flag=1 ;;
    --icon_name)
      echo $(cat hostnamectl | grep -wh 'Icon name' | awk '{for (i=3; i<NF; i++) printf $i " "; print $NF}')
      flag=1 ;;
    --machine_id)
      echo $(cat hostnamectl | grep -wh 'Machine ID' | awk '{for (i=3; i<NF; i++) printf $i " "; print $NF}')
      flag=1 ;;
    --boot_id)
      echo $(cat hostnamectl | grep -wh 'Boot ID' | awk '{for (i=3; i<NF; i++) printf $i " "; print $NF}')
      flag=1 ;;
    --virtualization)
      echo $(cat hostnamectl | grep -wh 'Virtualization' | awk '{for (i=2; i<NF; i++) printf $i " "; print $NF}')
      flag=1 ;;
    --kernel)
      echo $(cat hostnamectl | grep -wh 'Kernel' | awk '{for (i=2; i<NF; i++) printf $i " "; print $NF}')
      flag=1 ;;
    --architecture)
      echo $(cat hostnamectl | grep -wh 'Architecture' | awk '{for (i=2; i<NF; i++) printf $i " "; print $NF}')
      flag=1 ;;
   esac
  done
 # if no relevent parameters - print file
 if test $flag -eq 0
  then cat hostnamectl
 fi
}

system_func () {
 # flag for check if no parameters
 flag=0
 # find uniqs
 args=$@
 uniq_args=$(echo "${args[@]}" | tr " " "\n" | awk '{print NR,$0}' | sort -uk2 | sort -n | cut -d " " -f 2 | tr "\n" " ")
 # print relevent parameters
 for arg in $uniq_args
  do
   case $arg in
    --name)
      echo $(cat os-release | grep -wh 'NAME' | cut -d '"' -f 2)
      flag=1 ;;
    --version)
      echo $(cat os-release | grep -wh 'VERSION' | cut -d '"' -f 2)
      flag=1 ;;
    --pretty_name)
      echo $(cat os-release | grep -wh 'PRETTY_NAME' | cut -d '"' -f 2)
      flag=1 ;;
    --home_url)
      echo $(cat os-release | grep -wh 'HOME_URL' | cut -d '"' -f 2)
      flag=1 ;;
    --support_url)
      echo $(cat os-release | grep -wh 'SUPPORT_URL' | cut -d '"' -f 2)
      flag=1 ;;
   esac
  done
 # if no relevent parameters - print file
 if test $flag -eq 0
  then cat os-release
 fi
}

# main
case $1 in
 host) host_func $@ ;;
 system) system_func $@ ;;
 *) echo "Invalid input";;
esac
