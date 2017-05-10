#
# Cookbook Name:: base
# Recipe:: default
#

# Sudo
include_recipe 'sudo'

# We've taken care of this by adding the user to the attribute.
file '/etc/sudoers.d/vagrant' do
  action :delete
end

include_recipe 'ntp'

# Get our repos.
include_recipe 'yum-epel'

# Install our base packages.
node['base']['packages'].each do |pkg|
  package pkg do
    action :install
  end
end


# Install threat stack
include_recipe "threatstack"


# Users / Groups
# These groups already exist but by defining these resources we also force
# the creation of our users in our databags
users_manage 'users'
users_manage 'wheel'
