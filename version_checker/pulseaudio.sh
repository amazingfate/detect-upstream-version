#! /bin/bash
pkgname=pulseaudio
grep -E "Package: |Version: " Sources > packages_version.txt
grep -A 1 "$pkgname" packages_version.txt > current_package_version.txt
current_version_line=`grep "Version: " current_package_version.txt`
current_version=`echo ${current_version_line#*Version: }`
version_line=`curl http://www.freedesktop.org/wiki/Software/PulseAudio/ |grep "releases/pulseaudio-"|sed 1q`
version_1=`echo ${version_line#*releases/pulseaudio-}`
version=`echo ${version_1%.tar.xz*}`
echo "package name: $pkgname"
echo "current version: $current_version"
echo "upstream version: $version"
