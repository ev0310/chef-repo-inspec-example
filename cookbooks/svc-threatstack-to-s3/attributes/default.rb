default['nginx']['site']['threatstack-to-s3']['root'] = '/hab/svc/threatstack-to-s3'
default['nginx']['site']['threatstack-to-s3']['logname'] = 'threatstack-to-s3'
default['nginx']['site']['threatstack-to-s3']['socket']['type'] = 'tcp'
default['nginx']['site']['threatstack-to-s3']['socket']['port'] = 8080
default['nginx']['site']['threatstack-to-s3']['listen'] = 443

default['threatstack-to-s3']['common_name'] = 'threatstack-to-s3.threatstack.net'
default['threatstack-to-s3']['ssl_cert']['source'] = 'self-signed'
default['threatstack-to-s3']['ssl_key']['source'] = 'self-signed'

