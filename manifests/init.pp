# Class: hprest
# ===========================
#
# hprest is a module that installs the RESTful Interface Tool and uses it to manage server settings.
#
# Examples
# --------
#
# @example
# class { "hprest":}
#
# @example 2
# node default {
#  class { 'hprest':} ->
#  hprest::service {'login':
#    command => 'login 10.0.0.0 -u admin -p password',
#  } ->
#  hprest::service {'types':
#    command => 'types',
#  } ->
#  hprest::service {'select':
#    command => 'select HpBios.',
#  }
# }
#
# Authors
# -------
#
# Jack Garcia <jack.g.garcia@hpe.com>
#
# Copyright
# ---------
#
# Copyright 2016
#

class hprest {

  class { 'hprest::install':}
}
