define pkg_deploy_new($sourcedir = false)
{
  $sourcedir_real = $sourcedir ? {
    false => "http://puppet.somewhere.com/packages",
    default => $sourcedir
  }
  package { $name:
    ensure => installed,
    provider => pkgdmg,
    source => "$sourcedir_real/$name"
  }
}

class pkg_deploy{

}