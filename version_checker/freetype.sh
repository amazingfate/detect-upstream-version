#! /bin/bash
pkgname=freetype
grep -E "Package: |Version: " Sources > packages_version.txt
grep -A 1 "$pkgname" packages_version.txt > current_package_version.txt
current_version_line=`grep "Version: " current_package_version.txt`
current_version=`echo ${current_version_line#*Version: }`
version_line=`curl http://www.freetype.org/ |grep "<h4>FreeType "|sed 1q`
version_1=`echo ${version_line#*<h4>FreeType }`
version=`echo ${version_1%<*}`
echo "package name: $pkgname"
echo "current version: $current_version"
echo "upstream version: $version"
