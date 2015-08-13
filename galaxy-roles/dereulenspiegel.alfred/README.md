alfred [![Build Status](https://travis-ci.org/dereulenspiegel/ansible-alfred.svg?branch=master)](https://travis-ci.org/dereulenspiegel/ansible-alfred)
=========

This role installs [alfred](http://www.open-mesh.org/projects/open-mesh/wiki/Alfred).

Requirements
------------

Ansible of course

Role Variables
--------------

### Default Variables

Name | Default | Description
---- | ------- | -----------
alfred_version | 2015.0 | The version of alfred to install
alfred_source_url | http://downloads.open-mesh.org/batman/stable/sources/alfred/alfred-{{alfred_version}}.tar.gz | The URL to download alfred from
alfred_gps | true | Wether to build alfred-gpsd
alfred_vis | true | Wether to build batadv-vis


Dependencies
------------

None

Example Playbook
----------------

Simply depend on this role

    - hosts: servers
      roles:
         - { role: dereulenspiegel.alfred, alfred_gps: false }

License
-------

MIT

Author Information
------------------

Till Klocke [dereulenspiegel](https://twitter.com/dereulenspiegel) on Twitter
