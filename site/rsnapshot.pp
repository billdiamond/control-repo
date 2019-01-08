class { '::rsnapshot':
  hosts => {
    'localhost' => {},
    'billdiamond.com'    => {
      backup_defaults => false,
      backup          => {
        '/var/'       => './'
      }
    }
  }
}
