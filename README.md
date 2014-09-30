# ELDA-Flower

## Overview

[ELDA][] is an implementation of the [Linked Data API][lda]. It can wrap a sparql endpoint to create a REST-style api. One of the representations it is capable of generating is html.

This projects aim is to create a simple, easy to use and good looking website which is powered by the [NERC Vocab SPARQL Endpoint][nerc-sparl]. 

## Introduction

The core parts of this repository are the directories __elda-config__ and __lda-assets__. These contain the configuration which is required by the _elda-common_ web application. The __lda-assets__ should be deployed to __/var/elda-flower/assets__ and made accessible from the root of the web server (something like http://www.mywebsite.com/lda-assets) and the __elda-config__ directory should be made available at __etc/elda/conf.d/{APP}__ where {APP} is the context in which the elda-common web application is deployed. For complete instructions on how to set up ELDA, please refer to [ELDA-ref][].

## Usage

To ease development, a Vagrant development box is provided which is running the elda common web application and has the __elda-config__ and __lda-assets__ deployed. To use this, install [Vagrant][] and then:

    vagrant up

LDA-Assets contains Velocity templates, images and other web assets and a grunt project. The grunt project obtains client side dependencies and performs compilation. To use, you will have to have [grunt][] installed and therefor [node.js][]

Install grunt-cli globally, this only needs to be done once per system:

    npm install -g grunt-cli

Grab the required packaged from node:

    npm install

Obtain the client side packages during a grunt prep. This only needs to be done when something has changed which requires a re-prep (such as bower dependencies). The result of the command should be committed back to the repository.

    grunt prep

The repository is now in a state where you can begin developing. You can use grunt to listen to changes in source files and compile on-demand. To do this:

    grunt develop

After a code change the grunt project should be fully built and committed back to repository using:

    grunt build
    git add -A
    git commit -m "I've just built the code"
    git push

## Limitations

The repository has been developed with elda common version _1.2.35_

## Contributors

Christopher Johnson - cjohn@ceh.ac.uk

[ELDA]:       http://epimorphics.github.io/elda/docs/E1.2.35/index.html
[ELDA-ref]:   http://epimorphics.github.io/elda/docs/E1.2.35/reference.html
[lda]:        http://code.google.com/p/linked-data-api/wiki/Specification
[nerc-sparl]: http://vocab.nerc.ac.uk/sparql/
[Vagrant]:    https://www.vagrantup.com/
[grunt]:      http://gruntjs.com/
[node.js]:    http://nodejs.org/