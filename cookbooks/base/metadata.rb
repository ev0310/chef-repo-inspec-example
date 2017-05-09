name             'base'
maintainer       'Threat Stack'
maintainer_email 'tom.mclaughlin@threatstack.com'
license          'All rights reserved'
description      'Installs/Configures base'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "ntp"
depends "threatstack", "1.7.2"
depends "users"
depends "yum"
depends "yum-epel"
