#! /bin/bash
pkgname=synapse-project
grep -E "Package: |Version: " Sources > packages_version.txt
grep -A 1 "synapse" packages_version.txt > current_package_version.txt
current_version_line=`grep "Version: " current_package_version.txt`
current_version=`echo ${current_version_line#*Version: }`
version_line=`curl https://launchpad.net/$pkgname | grep -E  "Latest version"`
version=`echo ${version_line#*is }`
echo "package name: synapse"
echo "current version: $current_version"
echo "upstream version: $version"
