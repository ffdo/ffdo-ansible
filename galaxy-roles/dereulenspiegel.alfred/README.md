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
alfred_batman_interface | bat0 | The Batman interface alfred will use. Use 'none' to disable the batman-adv based best server selection.
alfred_interface | bat0 | The interface alfred will use
alfred_batadv_vis_interface | bat0 | Interface for batadv-vis if alfred_vis is true
alfred_master_mode | false | Wether alfred should run master mode or not


Dependencies
------------

None

Example Playbook
----------------

Simply depend on this role

    - hosts: servers
      roles:
         - { role: dereulenspiegel.alfred, alfred_gps: false, alfred_interface: alfred0 }

License
-------

MIT

Author Information
------------------

Till Klocke [dereulenspiegel](https://twitter.com/dereulenspiegel) on Twitter
