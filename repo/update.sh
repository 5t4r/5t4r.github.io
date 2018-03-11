apt-ftparchive packages ./Files/ > ./Packages
sed -i -e '/^SHA/d' ./Packages
bzip2 -c9k ./Packages > ./Packages.bz2
printf "Origin: star's Repo\nLabel: star\nSuite: stable\nVersion: 1.0\nCodename: star\nArchitecture: iphoneos-arm\nComponents: main\nDescription: star's Tweaks\nMD5Sum:\n "$(cat ./Packages | md5sum | cut -d ' ' -f 1)" "$(stat ./Packages --printf="%s")" Packages\n "$(cat ./Packages.bz2 | md5sum | cut -d ' ' -f 1)" "$(stat ./Packages.bz2 --printf="%s")" Packages.bz2\n" >Release;


#To push all to host:
cd ..
git add -A
git commit -m "Repo"
git push -u origin master

exit 0
