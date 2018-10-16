# Using Chef to Install Apache Tomcat

Place the `tomcat.service` in `/etc/systemd/system/tomcat.service`

- If the location does not exist, run `sudo vim /etc/systemd/system/tomcat.service`


# Create Apache Recipe

- Run `chef generate cookbook tomcat`
- Create file `install.rb` by running `sudo vim install.rb`
- Copy the contents of `install.rb` into `/home/vagrant/chef-repo/cookbooks/tomcat/recipes`
- Copy the contents of `default.rb` into `/home/vagrant/chef-repo/cookbooks/tomcat/recipes`


# Install Tomcat

- run ```chef-client --local-mode --runlist 'recipe[tomcat]```
