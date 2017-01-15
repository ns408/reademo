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

This module is designed to install Ruby via puppetlabs-ruby, Passenger, and Nginx.
It configures this environment accordingly for the rea demo application, pulls the git repo and deploys it

It's been setup in such a way that a server requires direct internet access, however could be utilized behind a HTTP proxy with small changes
namely configuring proxy in yum.conf, and exporting http and https proxy environment variables.

Puppet has provided published modules to manage all components that this module manages with the exception of the custom application, the reason these were not used were simply that it would make this demo unfortunately short, and not provide much insight into my skills.
In reality, I would use these pre-built, supported modules and make modifications in wrapper modules, there's no point reinventing the wheel under normal circumstances.

## Setup

### What REAdemo affects

Install script deploys Puppet, Git, clones down Puppet code

Deploys and manages Nginx

Deploys and managed Passenger (Ruby Container)

Deploys Ruby demo hello world app

Deploys and manages Ruby, RubyGems, Bundler

This module installs Git, and requires a valid hostname for server identification in nginx (can be overriden with small modification in init.pp)
Creates rea user, web group and sets up /var/www/rea directory with locked down privileges

### Setup Requirements

The Red Hat/CentOS optionals repository must be enabled.
This repository chooses not to manage it due to subscription-manager restrictions

Using Internet facing install.sh
1. enable optionals repository
2. copy install.sh script in root path of this repository to server and execute it
2. (b) alternatively, install git on your server, clone this repository down, and execute the shell script that way

Behind Proxy (unsupported)
1. set http, https proxy global environment variables
2. set proxy settings in yum.conf
3. copy install.sh script in root path of this repository to server and execute it.

Closed environment (internally managed repositories)
1. override parameters in init.pp to suit internal repository URLS
2. puppet apply site.pp


### Beginning with REAdemo

This is a fully contained deployment, in real production use with an existing Puppet environment you would utilize Hiera to override parameters.
However for the purposes of the demo the class call within /etc/puppetlabs/environments/production/manifests/site.pp can be adjusted to override parameters, or hard-code them in init.pp... it's a demo after all.


In the event of an existing Puppet environment, simply fulfil the action within the install.sh that clones the module down to the /modules path, and include it in your site.pp or ENC, it will work correctly regardless.


## Limitations

Red Hat 7/CentOS 7 compatible only, it can be easily expanded to CentOS/Red Hat 5/6/7 but time prohibited easy testing.
Support could be manually added by using the overridable parameters to reference appropriate repositories, the rest of the logic is completely correct.

This solution has been customized for the reademo application, it won't scale beyond this demo without minor adjustments, good systems engineering principles have been applied where possible to make this scalable, however time constraints mean it's not truly "finished".

## Development

This module is completely available for any purpose REA deems useful, my only request is that I'm not provided credit for this module should I not be employed by REA.
Fork it, and maintain it as you see fit.

## Release Notes/Contributors/Etc. **Optional**

Credit to Puppetlabs-ruby for the awesome module they wrote that prevents the need for RVM style package managers
