class { 'rsnapshot::client':
  server             => 'puppet.billdiamond.com',
  directories        => [
    '/etc',
    '/home',
    '/root'
  ],
  user                => 'root',
  remote_user         => 'root',
  backup_hourly_cron  => '*/2',
  backup_time_minute  => fqdn_rand(59, 'rsnapshot_minute'),
  backup_time_hour    => fqdn_rand(23, 'rsnapshot_hour'),
  backup_time_weekday => 6,
  backup_time_dom     => 15,
  cmd_preexec         => undef,
  cmd_postexec        => undef,
  cmd_client_rsync    => '/usr/bin/rsync',
  cmd_client_sudo     => '/usr/bin/sudo',
  retain_hourly       => 6,
  retain_daily        => 7,
  retain_weekly       => 4,
  retain_monthly      => 3,
  one_fs              => undef,
  rsync_short_args    => '-a',
  rsync_long_args     => '--delete --numeric-ids --relative --delete-excluded'
  ssh_args            => undef,
  use_sudo            => true,
  setup_sudo          => true,
  push_ssh_key        => true,
  wrapper_path        => '/opt/rsnapshot_wrappers/',  
}