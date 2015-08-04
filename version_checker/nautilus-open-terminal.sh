#! /bin/bash
pkgname=nautilus-open-terminal
grep -E "Package: |Version: " Sources > packages_version.txt
grep -A 1 "$pkgname" packages_version.txt > current_package_version.txt
current_version_line=`grep "Version: " current_package_version.txt`
current_version=`echo ${current_version_line#*Version: }`
version_line=`curl https://github.com/GNOME/nautilus-open-terminal/releases |grep "releases/tag/"|sed 1q`
version_1=`echo ${version_line#*releases/tag/NAUTILUS_OPEN_TERMINAL_}`
version=`echo ${version_1%\">*}`
echo "package name: $pkgname"
echo "current version: $current_version"
echo "upstream version: $version"
