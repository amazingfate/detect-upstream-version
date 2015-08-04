#! /bin/bash
pkgname=pygtk
grep -E "Package: |Version: " Sources > packages_version.txt
grep -A 1 "$pkgname" packages_version.txt > current_package_version.txt
current_version_line=`grep "Version: " current_package_version.txt`
current_version=`echo ${current_version_line#*Version: }`
version_line=`curl http://www.pygtk.org/downloads.html |grep "PyGTK for GTK+"|sed 1q`
version_1=`echo ${version_line#*PyGTK for GTK+ }`
version=`echo ${version_1%is available*}`
echo "package name: $pkgname"
echo "current version: $current_version"
echo "upstream version: $version"
