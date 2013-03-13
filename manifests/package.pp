class mongodb::package {
  package { $mongodb::package: ensure => $mongodb::version }
}