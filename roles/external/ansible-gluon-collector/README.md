gluon-collector [![Build Status](https://travis-ci.org/ffdo/ansible-gluon-collector.svg?branch=master)](https://travis-ci.org/ffdo/ansible-gluon-collector)
=========

This role configures and install the gluon-collector service.

Requirements
------------

Ansible 1.9 and a Debian Linux based OS

Role Variables
--------------

* **gluon_collector_receivers** A hash describing one or multiple receiver blocks in the configuration

### Default Variables 

Variable | Default | Description
---------|---------|------------
gluon_collector_http_port | 8079 | The port on which the REST server should listen on
gluon_collector_http_address | "[::]" | The address string the REST server should listen on
gluon_collector_store_type | bolt | The type of datastore to use
gluon_collector_base_path | /opt/gluon-collector | Where should gluon-collector be installed
gluon_collector_db_path | "{{gluon_collector_base_path}}/collector.db" | Where is the datastore created
gluon_collector_config_path | "{{gluon_collector_base_path}}/gluon-collector.yml" | Where configuration is created
gluon_collector_expire_nodes | 365 | After how many should dead nodes be removed from the datastore
gluon_collector_log_level | warn | The log level to use
gluon_collector_log_path | "{{gluon_collector_base_path}}/collector.log" | The location of the log file
gluon_collector_interval_statistics | 300 | Interval in seconds to request node statistics
gluon_collector_interval_nodeinfo | 1800 | Interval in seconds to request node infos
gluon_collector_interval_expire | 3 | After how many intervals is a non responding considered offline
gluon_collector_user | gluon-collector  | The user under which gluon-collector should run
gluon_collector_group | gluon-collector | The group under whcih gluon-collector should run
gluon_collector_version | "v1.1" | The version fetch from github releases
gluon_collector_download_url | "https://github.com/ffdo/node-informant/releases/download/{{gluon_collector_version}}/gluon-collector" | The release download URL
gluon_collector_use_supervisor | true | If this is false systemd instead of supervisor is used
gluon_collector_supervisor_config_path | /etc/supervisor/conf.d | The path where the supervisor configuration is written

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: ansible-gluon-collector
      roles:
         - role: dereulenspiegel.gluon-collector
           gluon_collector_receivers:
           - type: announced
             port: 21214
             interface: bat0
           - type: announced
             port: 21214
             interface: bat1 

License
-------

MIT

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
