class { '::icinga2':
  manage_repo => true,
}
yumrepo { 'icinga-stable-release':
  baseurl  => "http://packages.icinga.com/epel/${::operatingsystemmajrelease}/release/",
  descr    => 'ICINGA (stable release for epel)',
  enabled  => 1,
  gpgcheck => 1,
  gpgkey   => 'http://packages.icinga.com/icinga.key',
  before   => Package['icinga2'],
}

package { 'icinga2':
  ensure => latest,
  notify => Class['icinga2'],
}

class { '::icinga2':
  manage_package => false,
}

class { '::icinga2':
  manage_repo => true,
  features    => ['checker', 'mainlog', 'command'],
}
class { '::icinga2::feature::graphite':
  host                   => '10.10.0.15',
  port                   => 2003,
  enable_send_thresholds => true,
  enable_send_metadata   => true,
}
