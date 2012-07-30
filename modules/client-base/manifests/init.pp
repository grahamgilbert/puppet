##defaults for all OSX machines
class client-base{
  include macdefaults
  

    
    case $operatingsystem{
      Darwin:{
        mac-defaults { "auto-timezone":
          domain => '/Library/Preferences/com.apple.timezone.auto',
          key => 'Active',
          type => 'bool',
          value => TRUE,
          }
        case $macosx_productversion_major{
          "10.7", "10.8":{
        mac-defaults { "loginwindow":
          domain => '/Library/Preferences/com.apple.loginwindow',
          key => 'AdminHostInfo',
          value => 'HostName',
          type => 'string',
          }
        }
        }
      }
    }
}