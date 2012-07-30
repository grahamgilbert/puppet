##deinfe your default munki server and default client ID

define munki_prefs($url = "http://munki.somwhere.com", $client_id = "all_clients")
{
  
	case $operatingsystem{
    Darwin:{
	include macdefaults
	file { "/Library/LaunchDaemons/com.grahamgilbert.munki-periodic.plist":
		ensure => present,
		source => "puppet:///munki/com.grahamgilbert.munki-periodic.plist",
		owner => root,
		group => wheel,
		mode => 644,
	}
	
	##custom settings first
  mac-defaults { "munki-clientid":
    domain => '/Library/Preferences/ManagedInstalls',
    key => 'ClientIdentifier',
    value => $client_id,
    type => 'string',
    }

  mac-defaults { "munki-url":
    domain => '/Library/Preferences/ManagedInstalls',
    key => 'SoftwareRepoURL',
    value => $url,
    type => 'string',
    }

  ## Generic settings
  mac-defaults { "munki1":
      domain => '/Library/Preferences/ManagedInstalls',
      key => 'InstallAppleSoftwareUpdates',
      value => TRUE,
      type => 'bool',
    }

  
  mac-defaults { "munki2":
    domain => '/Library/Preferences/ManagedInstalls',
    key => 'PackageVerificationMode',
    value => 'hash',
    type => 'string',
    }

  mac-defaults { "munki3":
    domain => '/Library/Preferences/ManagedInstalls',
    key => 'SuppressStopButtonOnInstall',
    value => TRUE,
    type => 'bool',
    }

  mac-defaults { "munki4":
    domain => '/Library/Preferences/ManagedInstalls',
    key => 'SuppressUserNotification',
    value => FALSE,
    type => 'bool',
    }
    
  }
}
  



  
}
class munki{
  case $operatingsystem{
    Darwin:{
  include macdefaults
  pkg_deploy_new { "munki.dmg":
    alias => munki_new,
    notify => Exec['munki-check'],
    }
        
  exec {'munki-check':
    command => '/usr/bin/touch /Users/Shared/.com.googlecode.munki.checkandinstallatstartup',
    refreshonly => true,
    }
  }
  }
}