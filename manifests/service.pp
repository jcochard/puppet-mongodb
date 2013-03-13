class mongodb::service {
  service { $mongodb::params::service: ensure => $ensure }
}