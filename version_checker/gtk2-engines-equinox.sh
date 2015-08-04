#! /bin/bash
pkgname=gtk2-engines-equinox
grep -E "Package: |Version: " Sources > packages_version.txt
grep -A 1 "$pkgname" packages_version.txt > current_package_version.txt
current_version_line=`grep "Version: " current_package_version.txt`
current_version=`echo ${current_version_line#*Version: }`
version_line=`curl http://gnome-look.org/content/show.php?content=121881 |grep "Changelog"|sed 1q`
version_1=`echo ${version_line#*contenttext\"><strong>}`
version=`echo ${version_1%<\/strong><br*}`
echo "package name: $pkgname"
echo "current version: $current_version"
echo "upstream version: $version"
