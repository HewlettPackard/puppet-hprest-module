HPREST Puppet Module
======

[![Build Status](https://travis-ci.org/HewlettPackard/puppet-hprest-module.svg?branch=master)](https://travis-ci.org/HewlettPackard/puppet-hprest-module)
[![Puppet Forge](https://img.shields.io/puppetforge/v/lumbajack/hprest.svg?maxAge=2592000)](https://forge.puppet.com/lumbajack/hprest)
[![GitHub license](https://img.shields.io/badge/license-Apache%202-blue.svg)](https://raw.githubusercontent.com/HewlettPackard/puppet-hprest-module/master/LICENSE)
[![Codacy grade](https://img.shields.io/codacy/grade/5b7b9a4eb9fa4ac2af343c0a2641202e.svg?maxAge=2592000)](https://www.codacy.com/app/rexysmydog/puppet-hprest-module)

#### Table of Contents

1. [Overview](#overview)
2. [Description](#description)
3. [Setup](#setup)
4. [Installation](#installation)
5. [Usage](#usage)
6. [History](#history)
7. [License](#license)
8. [Authors](#authors)

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

## History

* 08/19/2016: Initial Commit

## License

Copyright 2017 Hewlett Packard Enterprise Development LP

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

## Authors

* [Jack Garcia](http://github.com/LumbaJack)
* [Matthew Kocurek](http://github.com/Yergidy)
* [Prithvi Subrahmanya](http://github.com/PrithviBS)
