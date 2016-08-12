hprest
======

####Table of Contents

1. [Overview](#overview)
2. [Description](#description)
3. [Setup](#setup)
4. [Installation](#installation)
5. [Usage](#usage)

Overview
===========

Puppet module for installing the hprest interface tool, and utilizing it to manage server settings.

Description
===========

hprest is a module that installs the RESTful Interface Tool, also known as hprest. Through the use of defined types, users can send any valid RESTful Interface command through the hprest module to the node server.

Installation
============

Use this command to install hprest:

``` sourceCode
puppet module install lumbajack-hprest
```

For a manual installation, download this module as a zip, and unzip it in your modules folder. The hprest module directory should be simply named “hprest”, so the node definition will recognize the module as hprest.

**Note:** If installing manually, or from this repository, ensure the folder is named “hprest” so Puppet can locate the module.

Usage
=====

**hprest** by itself will install the HPE RESTful Interface Tool from HPE's official respository. This can be triggered by including the hprest class.

``` sourceCode
node default {
  class {'hprest':}
}
```

To write your own commands to be sent, we utilize the service defined type. Ensure that each resource name is different, or puppet will throw an error. It is best to name them to reflect their usage. Additionally, the use of ordering arrows is important. hprest must first be installed, and the server must be logged into before anything can done, thus the login resource must be ordered before the types resource. Note, that the RESTful Interface Tool can be logged into remotely and locally through the hprest module. Simply exclude -u,-p and exclude the credentials.

``` sourceCode
node default {
  class { 'hprest':} ->
  hprest::service {'login':
    command => 'login 10.0.0.0 -u admin -p password',
  } ->
  hprest::service {'types':
    command => 'types',
  } ->
  hprest::service {'select':
    command => 'select HpBios.',
  }
}
```
