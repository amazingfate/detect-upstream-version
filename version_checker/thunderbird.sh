#! /bin/bash
pkgname=thunderbird
grep -E "Package: |Version: " Sources > packages_version.txt
grep -A 1 "$pkgname" packages_version.txt > current_package_version.txt
current_version_line=`grep "Version: " current_package_version.txt`
current_version=`echo ${current_version_line#*Version: }`
version_line=`curl http://bazaar.launchpad.net/~mozillateam/thunderbird/thunderbird.wily/files |grep "Tags:"|sed 1q`
version_1=`echo ${version_line#*>Tags: }`
version=`echo ${version_1%<\/div>*}`
echo "package name: $pkgname"
echo "current version: $current_version"
echo "upstream version: $version"
