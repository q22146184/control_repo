node default {
}
node 'master.puppet.vm' {
  include role::master_server
  # Configure puppetdb and its underlying database
  class { 'puppetdb': }
  # Configure the Puppet master to use puppetdb
  class { 'puppetdb::master::config': }
}
node /^web/ { 
  include role::app_server
}
node /^db/ {
  include role::db_server
}
