#Defined type to send commands with. The title is used for the name of the exec resource to prevent clashing.
#command parameters takes a valid hprest command

define hprest::service (
  $command  = undef, #: valid hprest command to be used
) {
if $osfamily == 'ubuntu' {

    #Setting default Exec parameters, path is designated in case environmental variables were not set
    Exec {
      path      => '/usr/bin',
      cwd       => '/etc/puppetlabs/code/environments/production/modules/hprest/files',
      logoutput => true,
      loglevel  => notice,
      }
  }

  if $osfamily == 'redhat' {

    #Setting default Exec parameters, path is designated in case environmental variables were not set
    Exec {
      path      => '/usr/sbin',
      logoutput => true,
      loglevel  => notice,
      }
  }

  if $osfamily == 'windows'{

    Exec {
      path      => 'C:\Program Files\Hewlett Packard Enterprise\HPE RESTful Interface Tool',
      logoutput => true,
      loglevel  => notice,
    }

  }

  #Start of common resources
  #Start of examples execution, double quote use to allow variable use. 
  if $ilo_username or $ilo_password != 'None' {
    exec { $title:
      command => "hprest ${command}",
    }
  }

}
