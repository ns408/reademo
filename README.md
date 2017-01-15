# REAdemo

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with REAdemo](#setup)
    * [What REAdemo affects](#what-REAdemo-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with REAdemo](#beginning-with-REAdemo)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This module is designed to install Ruby via puppetlabs-ruby, Passenger and Nginx.
It configures this environment accordingly, with managed configuration files, hardening, and by default binds to the fully qualified server hostname (can be overriden)

It's been setup in such a way that a server this module is run on requires direct internet access, however could be utilized behind a HTTP proxy with small changes documented below.

This module is for demo purposes, in reality, a systems engineer would choose Puppet supported pre-built modules that already exist, and make modifications in wrapper modules or Hiera, the reason these were not used in this module was because it would make a poor skills show-case other than demonstrating my efficiency at googling.
In normal circumstances I would also use those pre-build modules, however in the spirit of the brief, I chose to write my own simple adaptations suited to the application.


## Setup

### What REAdemo affects

Install script deploys Puppet, Git, and clones https://github.com/lnunns/reademo into the puppetlabs code path.
it then moves an already created site.pp into the default manifests directory, and executes puppet apply against it.
This script is for ease of testing by the person reviewing this module, and simplifies prerequisite management

Deploys and manages Ruby, RubyGems, Bundler

installs Nginx and manages key conf files

Deploys and manages Passenger (Ruby Container)

Deploys Ruby demo hello world app

Creates rea user, web group and sets up /var/www/rea directory with locked down privileges (Nginx cannot modify the Passenger managed path, merely read it)

### Setup Requirements

The Red Hat optionals repository must be enabled.
CentOS in testing did not require any repository adjustments.

I made the decision during writing this module not to try and manage the optional repository in Red Hat due to privilege constraints, if this was being written for a managed ecosystem, it should be enhanced by referencing a different module managing repositories.

Using Internet facing manual execution of install.sh
1. copy install.sh script in root path of this repository to server and execute it as the root user, it manages all other componentry

Using Internet facing, git pull of install.sh
1. enter preferred file path as root, install git via yum
2. git clone https://github.com/lnunns/reademo
3. enter repository path and execute install.sh as root

Behind Proxy (unsupported)
1. set http, https proxy global environment variables
2. set proxy settings in yum.conf
3. copy install.sh script in root path of this repository to server and execute it.

Existing Puppet environment
1. Do not execute shell script.
2. copy git repository into existing Puppet Git environment, or manually managed modules path
3. add to site.pp of relevant nodes (open source), or use Puppet console or preferred ENC (Puppet Enterprise)
4. run puppet agent -t on in scope node.


### Beginning with REAdemo

This is a fully contained deployment, in real production use with an existing Puppet environment you would utilize Hiera to override parameters.
However for the purposes of the demo the class call within /etc/puppetlabs/environments/production/manifests/site.pp can be adjusted to override parameters, or hard-code them in init.pp... it's a demo after all.

In the event of an existing Puppet environment, simply fulfil the action within the install.sh that clones the module down to the /modules path, and include it in your site.pp or ENC, it will work correctly regardless.


## Limitations

Red Hat/CentOS 7 compatible only, it can be easily expanded to CentOS/Red Hat 5/6/7 but time prohibited easy testing.
Support could be manually added by using the overridable parameters to reference appropriate repositories, the rest of the logic is completely correct.

This solution has been customized for the reademo application, it won't scale beyond this demo without minor adjustments, good systems engineering principles have been applied where possible to make this scalable, however time constraints mean it's not truly "finished".

Installation has been tested against 1 core, 1 GB RAM Red Hat 7 AWS EC2 instances, as well as a local CentOS Virtual Machine, further testing beyond this has not been completed, and it should not be considered production ready.

## Development

This module is completely available for any purpose REA deems useful, my only request is that I'm not provided credit for this module should I not be employed by REA.
Fork it, and maintain it as you see fit, after the evaluation period, I will make it private, so take any copies required at that time.

## Release Notes/Contributors/Etc. **Optional**

Credit to Puppetlabs-ruby for the awesome module they wrote that prevents the need for RVM style package managers
