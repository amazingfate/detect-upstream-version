#! /bin/bash
pkgname=nautilus
grep -E "Package: |Version: " Sources > packages_version.txt
grep -A 1 " $pkgname" packages_version.txt > current_package_version.txt
current_version_line=`grep "Version: " current_package_version.txt|sed 1q`
current_version=`echo ${current_version_line#*Version: }`
version_line=`curl https://git.gnome.org/browse/nautilus/ |grep "/browse/nautilus/tag/"|sed 1q`
version_1=`echo ${version_line#*'>nautilus-'}`
version=`echo ${version_1%.zip</a>&nbsp*}`
echo "package name: $pkgname"
echo "current version: $current_version"
echo "upstream version: $version"
