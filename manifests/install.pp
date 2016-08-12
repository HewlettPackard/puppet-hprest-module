# hprest install class
# ensures the repos are set and hprest is installed
#
class hprest::install {

  if $osfamily == 'debian' {
      #all of the repos are the same, so trusty works for all
      file {'apt repo':
        ensure  => 'file',
        path    => '/etc/apt/sources.list.d/hprest.list',
        content => 'deb http://downloads.linux.hpe.com/SDR/repo/hprest trusty/current non-free',
        }

      exec { 'apt-get update':
        command => 'apt-get update',
        path    => '/usr/bin',
        }
      #force-yes is used in case of issue with authentication with the official HPE repository
      package {'hprest':
        ensure          => latest,
        require         => Exec['apt-get update'],
        install_options => ['--force-yes'],
        }
    }

  if $osfamily == 'redhat' {

    #manual install using yum from HPE's official repository
    yumrepo { 'hprestrepo':
      ensure   => present,
      enabled  => 1,
      baseurl  => 'http://downloads.linux.hpe.com/SDR/repo/hprest/RedHatEnterpriseServer/7/x86_64/current/',
      gpgcakey => 'http://downloads.linux.hpe.com/SDR/repo/hprest/GPG-KEY-hprest',
    } ->

    package {'hprest':
      ensure   => installed,
      provider => yum,
      name     => 'hprest',
    }

  }

  if $osfamily == 'windows' {

    #msiexec is called when provider is set to windows
    #/i & /qn flags are automatically included.
    package {'hprest':
      ensure   => installed,
      source   => 'http://ftp.hp.com/pub/softlib2/software1/pubsw-windows/p1440367746/v109762/hprest-1.5.0.0-94.x86_64.msi',
      provider => windows,
      }

  }

}
