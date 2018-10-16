 execute "install mongodb" do
   command "sudo yum install -y mongodb-org"
   action :run
 end

execute "start mongodb" do
   command "sudo service mongod start"
   action :run
 end
