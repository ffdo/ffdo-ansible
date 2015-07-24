# Ansible roles for Freifunk Dortmund

This repo contains roles which should ease the creation of supernodes and other services 
for Freifunk Dortmund (and eventually for other Communities)

Since some software components like fastd and B.A.T.M.A.N. are not always easily available
via a packet manager on all platforms, the basic idea in this repo is to create roles for this 
software and eventually fall back to building from source.

## TODO

* batman role needs to enable build from source
* we need a way to get batman compatibility mode as a fact and be able to configure it
* Add role for Freifunk batman config
* Add role for Freifunk network config
* Add support for more platforms (don't force a linux distro to others)
* Everything else I forgot
* Add CI via travis:

## Setup test kitchen locally

* Install [test kitchen](http://kitchen.ci/): sudo gem install test-kitchen
* Install additionall kitchen gems: sudo gem install kitchen-ansiblepush kitchen-ansible kitchen-vagrant
* start tests via: kitchen test