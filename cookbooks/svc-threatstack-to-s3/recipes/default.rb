#
# Cookbook:: svc-threatstack-to-s3
# Recipe:: default
#
# The MIT License (MIT)
#
# Copyright:: 2017, Threat Stack, Inc
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

# Let's get Habitat setup
user 'hab' do
  comment 'Habitat User'
  uid '9990'
  home '/home/hab'
  shell '/bin/false'
end


hab_install 'habitat'
hab_package 'tmclaugh/threatstack-to-s3'
hab_sup 'default'
hab_service 'tmclaugh/threatstack-to-s3'

# Get nginx up and running.
include_recipe 'site-nginx'

nginx_site 'threatstack-to-s3' do
  enable true
  template 'nginx_site.erb'
  variables (
    {
      app_name:       'threatstack-to-s3',
      root:           node['nginx']['site']['threatstack-to-s3']['root'],
      listen:         node['nginx']['site']['threatstack-to-s3']['listen'],
      logname:        node['nginx']['site']['threatstack-to-s3']['logname'],
      socket_type:    node['nginx']['site']['threatstack-to-s3']['socket']['type'],
      socket_address: node['nginx']['site']['threatstack-to-s3']['socket']['address'],
      socket_port:    node['nginx']['site']['threatstack-to-s3']['socket']['port']
    }
  )
end

