# Ansible roles for Freifunk Dortmund

This repo contains roles which should ease the creation of supernodes and other services 
for Freifunk Dortmund (and eventually for other Communities)

Since some software components like fastd and B.A.T.M.A.N. are not always easily available
via a packet manager on all platforms, the basic idea in this repo is to create roles for this 
software and eventually fall back to building from source.

## TODO

* fastd needs to be buildable from source
* B.A.T.M.A.N. role needs to enable build from source
* Add role for Freifunk fastd config
* Add role for Freifunk batman config
* Add role for Freifunk network config
* Add support for more platforms (don't force a linux distro to others)
* Everything else I forgot
* Add tests via testkitchen and CI via travis