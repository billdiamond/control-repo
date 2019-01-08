class { '::rsnapshot':
  hosts => {
    'localhost' => {},
    'razor.billdiamond.com'    => {
      backup_defaults => false,
      backup          => {
        '/var/'       => './'
      }
    }
  }
}
