#! /bin/bash
pkgname=xcur2png
grep -E "Package: |Version: " Sources > packages_version.txt
grep -A 1 "$pkgname" packages_version.txt > current_package_version.txt
current_version_line=`grep "Version: " current_package_version.txt`
current_version=`echo ${current_version_line#*Version: }`
version_line=`curl http://cli-apps.org/content/show.php/xcur2png?content=86010 |grep "Changelog"|sed 1q`
version_1=`echo ${version_line#*version }`
version=`echo ${version_1%<br \/>*}`
echo "package name: $pkgname"
echo "current version: $current_version"
echo "upstream version: $version"
