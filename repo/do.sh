#!/bin/sh

find . -name .DS_Store | xargs rm -f

#To make Packages on iPhone do:
# rm -f Packages
# ./dpkg-scanpackages Files /dev/null > Packages

# read -p "pause"
#To make .gz and .bz2:
# rm Packages
rm -f Packages.gz
rm -f Packages.bz2
gzip -c9 Packages > Packages.gz
bzip2 -c9 Packages > Packages.bz2

#To push all to host:
cd ..
git add -A
git commit -m "Repo"
git push -u origin master