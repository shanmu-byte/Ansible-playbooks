#!/bin/bash
queue=$1


if [ "$#" -ne 1 ] ; then
echo "Enter the queue name"
exit 1

else

echo -e "\033[1;36m" Kindly find the application status: "\033[0m"

cat /tmp/logfolder/log |awk '{ gsub("re-established", "\033[1;32m&\033[0m");
                         gsub("lost", "\033[1;31m&\033[0m"); gsub("'$queue'", "\033[1;33m&\033[0m"); print }' |awk '
        BEGIN {
            FPAT = "([[:space:]]*[^[:space:]]+)";
            OFS = "";
        }
        {
            $1 = "\033[1;36m" $1 "\033[0m";
            $2 = "\033[1;33m" $2 "\033[0m";
            $3 = "\033[1;36m" $3 "\033[0m";
print
        }'
fi