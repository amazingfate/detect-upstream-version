#! /bin/bash
pkgname=meandmyshadow
grep -E "Package: |Version: " Sources > packages_version.txt
grep -A 1 "$pkgname" packages_version.txt > current_package_version.txt
current_version_line=`grep "Version: " current_package_version.txt`
current_version=`echo ${current_version_line#*Version: }`
version_line=`curl http://meandmyshadow.sourceforge.net/?download.html |grep "Source package"|sed 1q`
version_1=`echo ${version_line#*meandmyshadow-}`
version=`echo ${version_1%-src.tar*}`
echo "package name: $pkgname"
echo "current version: $current_version"
echo "upstream version: $version"
