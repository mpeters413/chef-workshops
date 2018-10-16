# Using Chef to Install MongoDB

Place the `mongodb-org-4.0.repo` in `/etc/yum.repos.d/mongodb-org-4.0.repo`

- If the location does not exist, run `sudo vim /etc/yum.repos.d/mongodb-org-4.0.repo`


# Create MongoDB Recipe

- Run `chef generate cookbook mongodb`
- Create file `install.rb` by running `sudo vim install.rb`
- Copy the contents of `install.rb` into `/home/vagrant/chef-repo/cookbooks/mongodb/recipes`
- Copy the contents of `default.rb` into `/home/vagrant/chef-repo/cookbooks/mongodb/recipes`


# Install Mongodb

- run `chef-client --local-mode --runlist 'recipe[mongodb]'





