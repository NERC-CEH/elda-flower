# Simple bash script to install tomcat + elda common
# and link vagrant files into place

apt-get update
apt-get install tomcat7
rm -rf /var/lib/tomcat7/webapps/ROOT

# Link Elda Config into place
mkdir -p /etc/elda/conf.d
ln -s /etc/elda/conf.d/ROOT /vagrant/elda-config
ln -s /var/lib/tomcat7/webapps/lda-assets /vagrant/lda-assets

wget http://repository.epimorphics.com/com/epimorphics/lda/elda-common/1.2.35/elda-common-1.2.35.war -O /var/lib/tomcat7/webapps/ROOT.war
service tomcat7 restart