#! /bin/bash
pkgname=pyquery
grep -E "Package: |Version: " Sources > packages_version.txt
grep -A 1 "$pkgname" packages_version.txt > current_package_version.txt
current_version_line=`grep "Version: " current_package_version.txt`
current_version=`echo ${current_version_line#*Version: }`
version_line=`curl https://pypi.python.org/pypi/pyquery |grep "pyquery/pyquery-"|sed 1q`
version_1=`echo ${version_line#*pyquery/pyquery-}`
version=`echo ${version_1%.zip*}`
echo "package name: $pkgname"
echo "current version: $current_version"
echo "upstream version: $version"
