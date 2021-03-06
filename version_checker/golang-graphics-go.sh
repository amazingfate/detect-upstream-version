pkgname=golang-graphics-go
grep -E "Package: |Version: " Sources > packages_version.txt
grep -A 1 " $pkgname" packages_version.txt > current_package_version.txt
current_version_line=`grep "Version: " current_package_version.txt|sed 1q`
current_version=`echo ${current_version_line#*Version: }`
echo "package name: $pkgname"
echo "current version: $current_version"
echo "upstream version: upstream homepage is googlecode, which is not supported."
