apt-get install autoconf automake
apt-get install libtool
apt-get install libssh2-1.dev
apt-get install libssl-dev
git clone https://github.com/curl/curl.git
./buildconf 
./configure --with-ssl
make
make install