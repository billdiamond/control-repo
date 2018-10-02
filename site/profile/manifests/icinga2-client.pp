class { '::icinga2':
  confd     => false,
  features  => ['checker','mainlog'],
}

class { '::icinga2::feature::api':
  pki             => 'none',
  accept_config   => true,
  accept_commands => true,
  endpoints       => {
    'NodeName'              => {},
    'icinga2.billdiamond.com' => {
      'host' => 192.168.1.190',
    }
  },
  zones           => {
    'ZoneName' => {
      'endpoints' => ['NodeName'],
      'parent'    => 'dmz',
    },
    'dmz'      => {
      'endpoints' => ['icinga2.billdiamond.com'],
    }
  }
}

icinga2::object::zone { 'global-templates':
  global => true,
}
