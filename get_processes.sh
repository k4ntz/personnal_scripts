#! /bin/bash
PROCESS_PREFIX="QD" # PUT YOUR INITIALS HERE !
# get_procs=``
# ssh dl1 '$get_procs'

for host in $(cat .server_list.txt)
  do
      echo $host
      ssh "$host" nvidia-smi | grep -i $PROCESS_PREFIX | cut -d "@" -f 2 | cut -d " " -f 1
      echo "--------------------------------------------------------------------------------"
  done
