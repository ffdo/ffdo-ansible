fastd
=========

This role installs fastd and its dependency (from source if necessary) and is able to configure one or more instances.

Requirements
------------

Ansible 1.2 and a Debian based OS (this may change in the future)

Role Variables
--------------

### Default variables

Variable | Description | Default
-------- | ----------- | --------
fastd_repo | If building from source the git repo to checkout from | http://git.universe-factory.net/fastd/
fastd_repo_tag | If building from source, the git tag or branch to checkout | v17
fastd_build_dir | If building from source, the directory where the sources are build | /usr/src/fastd-build
fastd_install_from_source | Wether to build from source, this is set automatically if necessary | false
fastd_user_name | The user which should be created for fastd | fastd
fastd_user_shell | Shell for the fastd user | /bin/false
libsodum_src_url | If building from source, where to find the source tar ball | https://download.libsodium.org/libsodium/releases/libsodium-{{libsodum_version}}.tar.gz
libsodum_version | If building from source, which version of libsodium to download | 1.0.3
libsodium_build_dir | If building from source, where should the build happen | /usr/src/
libuecc_version | If building from source, which git tag or branch to checkout from source repo | v5
libuecc_repo | If building from source, from which repo to checkout the source | git://git.universe-factory.net/libuecc
libuecc_repo_dir | If building from source, under which directory should the local clone be created | /usr/src/
libuecc_build_dir | Where to create the cmake build dir, if building from source | /usr/src/libuecc-build

### Instance variables

This playbook can create configurations for multiple instances running on the same host.
All instances are defined in an array under `fastd_instances`.

```
fastd_instances:
  - name: fast-vpn    # Name of the instance and the config folder under /etc/fastd
    bind: any:10000 interface "eth0" default ipv4
    interface: tap00
    loglevel: info
    mode: tap
    method: salsa2012+umac
    peer_limit: 125
    mtu: 1280
    status_socket: /tmp/fastd00.sock
    on_up_script: |
      ip link set up $INTERFACE
      batctl if add $INTERFACE
    on_verify_script: |
      /etc/fastd/fastd-blacklist.sh $PEER_KEY
```
The secret keys are defined in a seperate variable so you can encrypt them `fastd_instances_secret`.

```
fastd_instances_secret:
  - name: fast-vpn
    secret: 280088c4463559417e9f2daf17babc1db820ab79eb4f79e3718719b2a976e8a8b5e
```

Dependencies
------------

no dependencies

Example Playbook
----------------

TODO

License
-------

MIT

Author Information
------------------

Till Klocke
- [Twitter](https://twitter.com/dereulenspiegel)
- [Github](https://github.com/dereulenspiegel)
