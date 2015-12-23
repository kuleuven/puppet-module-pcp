# Private class: See README.md.
class pcp::config {

  file { '/etc/pcp/pmlogger/control.d':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    recurse => true,
    purge   => true,
  }

  if $pcp::include_default_pmlogger {
    pcp::pmlogger { 'local':
      primary => true,
      args    => '-r -T24h10m -c config.default'
    }
  }

  file { '/etc/pcp/pmie/control.d':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    recurse => true,
    purge   => true,
  }

  if $pcp::include_default_pmie {
    pcp::pmie { 'local':
      args => '-c config.default',
    }
  }

}
