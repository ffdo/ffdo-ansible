# Ansible roles for Freifunk Dortmund

This repo contains roles which should ease the creation of supernodes and other services 
for Freifunk Dortmund (and eventually for other Communities)

Since some software components like fastd and B.A.T.M.A.N. are not always easily available
via a packet manager on all platforms, the basic idea in this repo is to create roles for this 
software and eventually fall back to building from source.

## Getting started
This project is based on ansible, vagrant, VirtualBox and test kitchen. Although it is possible to get all this
working on windows, it is easier to do on Linux or Mac OS

### Prerequesites

* [Install ansible](http://docs.ansible.com/ansible/intro_installation.html) for your operating system 
* [Install VirtualBox](https://www.virtualbox.org/wiki/Downloads) for your operating system (Version 5 seems to work)
* Also install the extension pack for USB support etc. in VirtualBox. Some machines depend on this.
* [Install vagrant](http://docs.vagrantup.com/v2/installation/) for your operating system
* [Install test kitchen](http://kitchen.ci/docs/getting-started/installing) for your operating system
* Install ansible for test kitchen: `sudo gem install kitchen-ansiblepush kitchen-ansible`
* Install vagrant driver for test kitchen: `sudo gem install kitchen-vagrant`

Alternative to the last three steps you can also just use [bundler](http://bundler.io) to `bundle install` all necessary ruby gems.

### First steps

**Important**
On Debian wheezy we need to install a new kernel from wheezy-backports. For this a reboot is necessary and executed via
an ansible handler. Unfortunately this breaks the `kitchen test` run. You can do do `kitchen setup && kitchen verify && kitchen destroy`
instead. It does the same as `kitchen test` but doesn't break because of the reboot.

After you installed all necessary tools and gems you change in the checked out directory of this project
and simply type `kitchen test`. This will create multiple virtual machines execute the ansible roles and
test everything via serverspec. After all tests are successfull the machines are destroyed again.

### Simple development workflow

Since creating the machines can take some time (several minutes) is doesn't make sense to destroy them after each run.
You can call `kitchen setup` to create all defined machines and keep them running. Then you can start editing roles or 
creating roles and if you want to check your changes you can execute `kitchen converge && kitchen verify` to execute the
roles on all machines and run the serverspec tests on all machines. All commands can be combined with the machine name
(available via `kitchen list`) if you want to manipulate only one machine. 
If you need to analyse problems on one machine you can login with `kitchen login [machine name]`

## The Vagrantfile

The Vagrantfile and the host and group vars in this repo should be used to quickly create a "test community" in the future.
Ideally if you type `vagrant up` you should get a working test community, but currently without uplinks.

## TODO

* batman role needs to enable build from source
* we need a way to get batman compatibility mode as a fact and be able to configure it
* Add support for more platforms (don't force a linux distro to others)
* Everything else I forgot
* Add CI via travis: