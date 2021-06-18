#!/bin/bash

filename=$1
incident_date=$2
Queuename=$3

cur_date=`date +'%F %T'`

if [ "$#" -ne 3 ] ; then
echo "Enter all the 3 values"
exit 1

else
awk '$0 >=logs_from && $0 <= logs_to' logs_from="$incident_date" logs_to="$cur_date" $filename |grep -v 'UniqueLogFilter repetition:'|grep -ie 'connection.*lost' -ie 'connection.*established'|grep -ie $Queuename|awk '{printf "%d: %s %s %s %s %s %s %s %s %s %s %s %s %s\n", NR , "" , $1 , $2 , "  " , $11 , $13 , $14 , $15 , $16 , $17 , $18 , $19 , $20 }'| sed '1 i SNO=====DATE=======TIME===================CONNECTION-DETAILS-QUEUE/SERVICE==========='
fi

