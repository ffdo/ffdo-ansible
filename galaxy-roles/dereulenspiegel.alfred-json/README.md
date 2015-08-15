alfred-json [![Build Status](https://travis-ci.org/dereulenspiegel/ansible-alfred-json.svg)](https://travis-ci.org/dereulenspiegel/ansible-alfred-json)
=========

This role simply compiles and installs [alfred-json](https://github.com/tcatm/alfred-json).

Requirements
------------

None, except ansible and a Debian based host.

Role Variables
--------------

## Default Variables

None of these need to be modified, but is is possible to modify them to suit your needs (i.e. build your custom fork)

Name | Default | Description
---- | ------- | -----------
alfred_json_repo_url | https://github.com/tcatm/alfred-json.git | The git url to clone alfred-json from
alfred_json_version | v0.3.1 | Branch or tag to checkout after cloning
alfred_json_src_dir | /usr/src/alfred-json | Where to clone the sources
alfred_json_build_dir | /usr/src/alfred-json-build | CMake build dir

Dependencies
------------

None

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: dereulenspiegel.alfred-json }

License
-------

MIT

Author Information
------------------

Till Klocke [dereulenspiegel](https://twitter.com/dereulenspiegel)
