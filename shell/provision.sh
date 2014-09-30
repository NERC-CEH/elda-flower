# Simple bash script to install tomcat + elda common
# and link vagrant files into place

apt-get update
apt-get install -y tomcat7
rm -rf /var/lib/tomcat7/webapps/ROOT

# Link Elda Config into place
mkdir -p /etc/elda/conf.d
mkdir -p /var/elda-flower
ln -s /vagrant/lda-assets /var/elda-flower/lda-assets
ln -s /vagrant/elda-config /etc/elda/conf.d/ROOT

# Host the elda assets
ln -s /var/elda-flower/lda-assets /var/lib/tomcat7/webapps/lda-assets

wget http://repository.epimorphics.com/com/epimorphics/lda/elda-common/1.2.35/elda-common-1.2.35.war -q -O /var/lib/tomcat7/webapps/ROOT.war
service tomcat7 restart