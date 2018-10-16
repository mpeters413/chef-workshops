# chef-workshops
##### This repo describes the steps I have used to install chef on a Vagrant box and complete the following workshops



# Install Vagrant
Download and install Vagrant from `https://www.vagrantup.com/downloads.html`

- Create a file called `Vagrantfile`
- Copy the code from `Vagrantfile` in this repo into your Vagrant file
- edit `/etc/hosts/` on your local machine to include the IP address and hostname of your Vagrant box
- In my example, my IP is `192.168.50.4` and my host name is  `rhel7.localdomain`

I.E

```
##
# Host Database
#
# localhost is used to configure the loopback interface
# when the system is booting.  Do not change this entry.
##
127.0.0.1       localhost
255.255.255.255 broadcasthost
192.168.50.4    rhel7.localdomain
::1             localhost
~                           

```
- Run **Vagrant up**


# Install Chef

Run the following commands to install chef

-  `yum install -y wget curl`
-  `https://packages.chef.io/files/stable/chef/14.5.33/el/7/chef-14.5.33-1.el7.x86_64.rpm`
-  `chef-server-ctl reconfigure` 
-  `chef-server-ctl test`
-  `chef-server-ctl install chef-manage`
-  `chef-server-ctl reconfigure`
-  `chef-manage-ctl reconfigure`
-  ` knife confgiure`

Your knife config file should look something like this:

```[default]
client_name     = 'vagrant'
client_key      = '/root/.chef/vagrant.pem'
chef_server_url = 'https://rhel7.localdomain/organizations/mattorganization'
```

- Create a chef repo in `/home/vagrant/` by running `sudo mkdir /home/vagrant/chef-repo`
- Create a cookbook repo in `/home/vagrant/chef-repo` by running `sudo mkdir /home/vagrant/chef-repo/cookbooks`

# Gotchyas

- Make sure to run `knife ssl fetch` to generate SSL certs
- If you change to hostname or IP address of your machine, make sure to run `chef-server-ctl reconfigure`



