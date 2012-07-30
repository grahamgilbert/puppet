class puppet_conf {
  
case $operatingsystem{
  Darwin:{
    file { mac_puppet_conf:
          path    => "/etc/puppet/puppet.conf",
          owner   => root,
          group   => wheel,
          mode    => 644,
          ensure => present,
          content => template("puppet_conf/mac_puppet_conf.erb"),
  
        }
    
          file {'/Library/LaunchDaemons/com.reductivelabs.puppet.plist':
            owner => root,
            group => wheel,
            mode  => 644,
            ensure => present,
            source  => "puppet:///puppet_conf/com.reductivelabs.puppet.plist",
            }
        
  
}
}
}