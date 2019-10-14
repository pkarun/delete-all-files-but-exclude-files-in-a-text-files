#!/bin/bash

#https://askubuntu.com/questions/830776/remove-file-but-exclude-all-files-in-a-list

echo "deleting files in: '/var/www/html/example.com/downloads' "

cd /var/www/html/example.com/downloads

# Exit if the directory isn't found.
#if (($?>0)); then
#    echo "Can't find work dir... exiting"
#    exit
#fi

for i in *; do
    if ! grep -qxFe "$i" /var/www/backups/script/cleaning/dont-remove.txt; then
        echo "Deleting: $i"
        # the next line is commented out.  Test it.  Then uncomment to removed the files
         rm -r "$i"
    fi
done
