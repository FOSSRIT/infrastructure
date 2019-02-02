FOSS@MAGIC infrastructure
=========================

[![License: MPL 2.0](https://img.shields.io/badge/License-MPL%202.0-brightgreen.svg)](https://opensource.org/licenses/MPL-2.0)
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

### Project license: MPLv2

Licensed under the [Mozilla Public License 2.0](https://www.mozilla.org/en-US/MPL/) unless otherwise stated.

### Third-party software

These projects are used, or were used at one time, by this project.
Thanks for the work of those who shared changes in the open. :tada:

* [ansible/ansible-examples](https://github.com/ansible/ansible-examples "ansible/ansible-examples: A few starter examples of ansible playbooks, to show features and how they work together.") ([wordpress-nginx_rhel7](https://github.com/ansible/ansible-examples/tree/master/wordpress-nginx_rhel7 "ansible/ansible-examples: WordPress+Nginx+PHP-FPM+MariaDB Deployment"))
* [jwflory/ansible-role-teleirc](https://github.com/jwflory/ansible-role-teleirc "jwflory/ansible-role-teleirc: Ansible role to deploy RITlug/teleirc chat bots to bridge IRC channels and Telegram groups")

