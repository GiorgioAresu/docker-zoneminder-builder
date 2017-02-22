echo "Building branch \"${BRANCH}\""
mkdir -p /tmp/build-zm
cd /tmp/build-zm
wget https://raw.githubusercontent.com/ZoneMinder/ZoneMinder/master/utils/do_debian_package.sh
chmod a+x do_debian_package.sh
apt-get update
yes '' | ./do_debian_package.sh `lsb_release -a 2>/dev/null | grep Codename | awk '{print $2}'` `date +%Y%m%d`01 local $BRANCH
mkdir -p /deb
mv *.deb /deb/
rm -R /tmp/build-zm
echo Build completed. To get compiled packages, use:
echo "    'docker cp <image-name>:/deb ./'"