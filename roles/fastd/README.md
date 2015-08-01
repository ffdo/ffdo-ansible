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

Dependencies
------------

no dependencies

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

MIT

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
