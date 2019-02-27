FOSS@MAGIC infrastructure
=========================

[![License: BSD 3-Clause License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)
[![Build Status](https://travis-ci.org/FOSSRIT/infrastructure.svg?branch=master)](https://travis-ci.org/FOSSRIT/infrastructure)

Set of scripts, playbooks, and other tools to automate and manage FOSS@MAGIC infrastructure


## About

This repository contains various scripts and other automation tools to manage the FOSS@MAGIC infrastructure.
Changes to the infrastructure should be made via this repository.


## How to use

As of now, there is only one playbook to use:

```sh
ansible-playbook-3 -u $USER -K playbooks/irc-lug.yml
```


## Legal

### Project license: BSD 3-Clause License

This repository is licensed under the [BSD 3-Clause License](https://choosealicense.com/licenses/bsd-3-clause/ "BSD 3-Clause “New” or “Revised” License").
Reuse anything you want in your own configurations.
If you publish any remixed work online, add a link back here to your README please. :memo:
And you can say :wave: to me in your git commit.
Tag me!
`@jwflory`

### Attributions

These projects are used, or were used at one time, by this project.
Thanks for the work of those who shared changes in the open. :tada:

* [ansible/ansible-examples](https://github.com/ansible/ansible-examples "ansible/ansible-examples: A few starter examples of ansible playbooks, to show features and how they work together.") ([wordpress-nginx_rhel7](https://github.com/ansible/ansible-examples/tree/master/wordpress-nginx_rhel7 "ansible/ansible-examples: WordPress+Nginx+PHP-FPM+MariaDB Deployment"))
* [jwflory/ansible-role-teleirc](https://github.com/jwflory/ansible-role-teleirc "jwflory/ansible-role-teleirc: Ansible role to deploy RITlug/teleirc chat bots to bridge IRC channels and Telegram groups")

