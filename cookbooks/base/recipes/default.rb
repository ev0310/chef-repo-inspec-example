#
# Cookbook Name:: base
# Recipe:: default
#

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

