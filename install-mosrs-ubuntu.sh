#### Install and configure gpg-agent
apt-get install -q -y libgpg-error-dev libgcrypt20-dev libassuan-dev libksba-dev libpth-dev zlib1g-dev
apt-get remove -q -y --auto-remove --purge gpg-agent

curl -L -s -S https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.0.30.tar.bz2 | tar -xj
cd gnupg-2.0.30
./configure
make
make install
cd ..
rm -r gnupg-2.0.30

#### Configure FCM
mkdir -p /etc/subversion
cp /tmp/subversion/servers /etc/subversion
cp /tmp/subversion/config /etc/subversion
# Set up FCM keywords
mkdir -p /opt/metomi-site/etc/fcm
ln -sf /opt/metomi-site/etc/fcm/keyword.cfg /opt/fcm/etc/fcm/keyword.cfg
