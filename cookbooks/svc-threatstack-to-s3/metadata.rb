name 'svc-threatstack-to-s3'
maintainer 'Threat Stack, Inc'
maintainer_email 'tom.mclaughlin@threatstack.com'
license 'MIT'
description 'Installs/Configures svc-threatstack-to-s3'
long_description 'Installs/Configures svc-threatstack-to-s3'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/svc-threatstack-to-s3/issues'

# The `source_url` points to the development reposiory for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/svc-threatstack-to-s3'

depends 'site-nginx'
