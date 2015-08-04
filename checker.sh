#! /bin/bash
rm output.txt
ls version_checker > scripts.txt
cd version_checker
wget http://pools.corp.linuxdeepin.com/dev/dists/unstable/main/source/Sources.gz
gzip -d Sources.gz
while read script
do
    sh $script >> ../output.txt
done < ../scripts.txt
rm Sources
rm current_package_version.txt
rm packages_version.txt
rm ../scripts.txt
