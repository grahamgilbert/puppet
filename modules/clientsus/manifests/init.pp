class clientsus {
  include macdefaults
  case $operatingsystem{
    Darwin:{
      case $macosx_productversion_major{
         10.8:{   
             $susurl =   'http://sus.somewhere.com/content/catalogs/others/index-mountainlion-lion-snowleopard-leopard.merged-1_clients.sucatalog'          
             }
        10.7:{   
          $susurl =   'http://sus.somewhere.com/content/catalogs/others/index-lion-snowleopard-leopard.merged-1_clients.sucatalog'          
            }
  
        10.6:{
          $susurl = 'http://sus.somewhere.com/content/catalogs/others/index-leopard-snowleopard.merged-1_clients.sucatalog' 
  }
  
        10.5:{
      $susurl = 'http://sus.somewhere.com/content/catalogs/others/index-leopard.merged-1_clients.sucatalog'
  }
}

mac-defaults { "clientsus":
    domain => '/Library/Preferences/com.apple.SoftwareUpdate',
    key => 'CatalogURL',
    value => $susurl,
   }
}
}
}