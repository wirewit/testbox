# Testbox

Testbox is a python-powered test box for web applications automated testing.

## What is it

This repository is a set of great tools combined together to provide
simple yet powerfull environment for developing and running python-based
autotests. This setup is framework agnostic so it is likely to be compatible with
almost any of python-based testing frameworks (yes, including your own
best-of-the-best-homegrown-framework-which-is-the-next-big-thing-in-automated-testing).

Included tools (all packed as docker conatiner):
 - selenium hub
 - selenium chrome node with VNC server for debugging
 - selenium firefox node with VNC server
 - base for building jupyter-powered python interactive console
   web-based text editor and web-based shell to python container

As a bonus jupyter container itself contains:

  - behave (probaly the best python based bdd-tool)
  - allure tookit (java-based tool for generating test reports from Yandex team)
  - ready-to-use example of behave setup with allure for real-word apps (yes, it's
    used in production)


## What it isn't

It's is not a framework altough you can use it such way:
take a look at the provided example, it's really good one
but you not expected to rewrite all of you existing tests.
Instead, just adapt base container to fit you framework and
your needs (see #modifying-jupyter-container)

It's not a continius integration server as it is.
Yes, you can (and probably will) build one from this,
but this requires little bit more efforts.


## How to use it

First of all, run this test box (see next section).
After you testbox is up and ready, you will have:
 - powerfull python console, running at http://localhost:8888 with
   text editor and terminal (see jupyter docs for details)
 - selenium hub running with two nodes (chrome and firefox) running
   at http://localhost:4444/
 - vnc access to browser nodes (TODO: ports here), example for novnc

TODO:
Typical flow: play with selenium directly from python console, edit test in editor,
run in terminal, watch them running in nodes using vnc-client

## Okay, lets't make it run

TODO
Two ways

### Docker containers on host
$ docker-compose up

### Docker conatainers inside vagrant box

Boot vagrant virtual box
$ vagrant up

Reload to after first creation (only once)
$ vargrant reload

(TODO: write why reload required - setup installs kernel images for better docker support so needs to be rebooted)
