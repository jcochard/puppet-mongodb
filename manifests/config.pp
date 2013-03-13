class mongodb::config {
  file { $mongodb::params::config:
     ensure  => file,
     owner   => 0,
     group   => 0,
     mode    => '0644',
     content => template("${module_name}/${mongodb::params::template}"),
  }
  
  file { '/etc/logrotate.d/mongo':
    ensure  => present,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    source  => 'puppet:///modules/mongodb/logrotate'
    }
}