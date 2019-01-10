
class { '::rsnapshot':
    snapshot_root => '/var/backups/rsnapshot',
    retains       => [  { 'daily'   => 7 }, { 'weekly'  => 4 }, { 'monthly' => 7 }, ],
    crons         => {  'daily'   => { 'minute' => 30, 'hour' => 6, },
                        'weekly'  => { 'minute' => 30, 'hour' => 5, 'weekday'  => 6 },
                        'monthly' => { 'minute' => 30, 'hour' => 4, 'monthday' => 1 }, },
    backups       => hiera('rsnapshot_backups'),
}
