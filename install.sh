#install package
yum -y --enablerepo=remi,epel  install libyaml libyaml-devel zlib zlib-devel readline readline-devel openssl openssl-devel libxml2 libxml2-devel libxslt libxslt-devel gcc gcc++ make


yum -y install git

#install rbenv
cd /usr/local
git clone git://github.com/sstephenson/rbenv.git rbenv

groupadd rbenv
chgrp -R rbenv rbenv
chmod -R g+rwxXs rbenv


#install rbenv-build
mkdir /usr/local/rbenv/plugins
cd /usr/local/rbenv/plugins
git clone git://github.com/sstephenson/ruby-build.git ruby-build
chgrp -R rbenv ruby-build
chmod -R g+rwxs ruby-build


#create pathfile
touch /etc/profile.d/rbenv.sh
echo 'export RBENV_ROOT="/usr/local/rbenv"' >> /etc/profile.d/rbenv.sh
echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >> /etc/profile.d/rbenv.sh
echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh

source /etc/profile.d/rbenv.sh


#install ruby
rbenv install 2.0.0-p451
rbenv global 2.0.0-p451
rbenv rehash


#install rbenv-rehash
gem install rbenv-rehash

gem install rails --no-ri --no-rdoc



yum install mysql-devel

yum groupinstall 'Development tools'
yum install openssl-devel
yum install sqlite-devel

yum -y install mysql mysql-server


rpm -ivh http://ftp.riken.jp/Linux/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm
yum install nodejs npm --enablerepo=epel

/etc/rc.d/init.d/iptables stop
chkconfig iptables off
chkconfig --list iptables 



