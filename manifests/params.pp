class mongodb::params {
  case $::operatingsystem {
        /(Redhat|CentOS|Fedora)/: {
          $supported  = true
          $package    = 'mongo18-10gen-server'
          $service    = 'mongod'
          $config     = '/etc/mongod.conf'
          $template   = 'mongod.conf.redhat.erb'
        }
        default: {
          $supported = false
          notify { "${module_name}_unsupported":
            message => "The ${module_name} module is not support on ${::operatingsystem}",
          }
        }
      }
}