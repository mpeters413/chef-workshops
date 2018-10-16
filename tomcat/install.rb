
execute 'install java' do
 command 'sudo yum install java-1.7.0-openjdk'
 action :run
end

#package `java-1.7.0-openjdk`

#sudo groupadd tomcat
group 'tomcat'

 #sudo useradd -M -s /bin/nologin -g tomcat -d /opt/tomcat tomcat
 user 'tomcat' do
 manage_home false
 shell '/bin/nologin'
 group 'tomcat'
 home 'opt/tomcat'
 end

 # wget wget http://apache.mirrors.ionfish.org/tomcat/tomcat-8/v8.5.9/bin/apache-tomcat-8.5.9.tar.gz
 execute 'get the tomcat tar file' do
  command 'sudo wget http://apache.mirrors.ionfish.org/tomcat/tomcat-8/v8.5.9/bin/apache-tomcat-8.5.9.tar.gz'
   action :run
   end

 #remote file 'apache-tomcat-8.5.9.tar.gz' do
        #source  'http://apache.mirrors.ionfish.org/tomcat/tomcat-8/v8.5.9/bin/'

 #sudo mkdir /opt/tomcat
 directory  '/opt/tomcat/' do
 group 'tomcat'
end


execute 'install tomcat' do
 command 'sudo tar xvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1'
 action :run
end


#give tomcat user ownership
 execute 'give tomcat user write access' do
 command 'sudo chgrp -R tomcat /opt/tomcat'
 action :run
end

 execute 'give tomcat group read access' do
 command 'sudo chgrp -R tomcat /opt/tomcat'
 action :run
end

execute 'give tomcat group read access' do
 command 'sudo chmod g+x conf'
 action :run
end

execute 'sudo chown -R tomcat webapps/ work/ temp/ logs/' do
 command 'sudo chmod g+x conf'
 action :run
end

#load tomcat file
execute 'sudo systemctl daemon-reload' do
 command 'sudo chmod g+x conf'
 action :run
end

service 'tomcat' do
 action [:start, :enable]
end
