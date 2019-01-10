class { 'rsnapshot::server':  
  config_path            => '/etc/rsnapshot',
  backup_path            => '/backups/rsnapshot',
  log_path               => '/var/log/rsnapshot',
  user                   => 'root',
  no_create_root         => 0,
  verbose                => 2,
  log_level              => 3,
  link_dest              => 1,
  sync_first             => 0,
  use_lazy_deletes       => 0,
  rsync_numtries         => 1,
  stop_on_stale_lockfile => 0,
  du_args                => '-csh'
}
