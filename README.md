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


## License

Licensed under the [Mozilla Public License 2.0](https://www.mozilla.org/en-US/MPL/) unless otherwise stated.

