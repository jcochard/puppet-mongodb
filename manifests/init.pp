class mongodb ( $version      = '1.8.5-mongodb_1',
                $quota        = 'true',
                $dbpath       = '/var/lib/mongo',
                $logpath      = '/var/log/mongo/mongod.log',
                $port         = '27017',
                $ensure       = 'running',
                $package      = $mongodb::params::package,
                $service      = $mongodb::params::service,
                $config       = $mongodb::params::config,
                $template     = $mongodb::params::template,
                
 ) inherits mongodb::params {
    
 include stdlib
 
 if $mongodb::params::supported == true {
   anchor  { 'mongodb::start':}->
   class   { 'mongodb::package':}~>
   class   { 'mongodb::config':}~>
   class   { 'mongodb::service':}~>
   anchor  { 'mongodb::end':}
 }
}