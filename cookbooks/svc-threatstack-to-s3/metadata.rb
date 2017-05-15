name 'svc-threatstack-to-s3'
maintainer 'Threat Stack, Inc'
maintainer_email 'tom.mclaughlin@threatstack.com'
license 'MIT'
description 'Installs/Configures svc-threatstack-to-s3'
long_description 'Installs/Configures svc-threatstack-to-s3'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)


depends 'habitat'
depends 'site-nginx'
