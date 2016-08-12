# Class: hprest
# ===========================
#
# hprest is a module that installs the RESTful Interface Tool and uses it to manage server settings.
#
# Parameters
# ----------
# * `ilo_ip`
# This parameter is the IP address of the target server. It defaults to "10.0.0.100"
# It is required for the examples to execute properly.
#
# * `ilo_username`
# This parameter is the iLO username for the target server. It defaults to "username"
# It is required for the examples to execute properly.
#
# * `ilo_password`
# This parameter is the iLO password for the target server. It defaults to "password"
# It is required for the examples to execute properly.
#
# * `type`
# The `type` parameter lets hprest know what type is being managed. It is needed to help select the
# correct path to manage settings. It defaults to "None", which along with the "types" command will list
# available types
#
# * `getproperty`
# This parameter is used for choosing a property to fetch when the get command is applied. 
# Multiple properties can also be passed to get multiple properties. It defaults to "None"
#
# * `setproperty`
# This property is used for changing and setting server settings. It can accept multiple properties to be set.
# It takes both property and value, for example: 
# AdminName="John Doe" AdminEmail="test@test.com"
# is an acceptable value. The layout for setting a setting must be in hprest format. setproperty defaults to "None"
#
# Examples
# --------
#
# @example
# class { "hprest":
#   ilo_ip         => '10.0.0.100',
#   ilo_username   => 'admin',
#   ilo_password   => 'password',
#   type           => 'HpBios',
#   setproperty    => 'AdminName="John Doe" AdminEmail="test@test.com"',
#   getproperty    => 'AdminName AdminEmail',
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
