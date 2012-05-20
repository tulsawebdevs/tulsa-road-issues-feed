======================
Tulsa Road Issues Feed
======================
The Tulsa Road Issues Feed (TRIF) aggregates road information from several sources into a single feed.  This can be used by media outlets to report issues to their audience, or as the raw data for interactive web projects.

This project is part of [Hackathon 2011](http://tulsahackathon.com/2011/).  See our [github project](https://github.com/tulsawebdevs/tulsa-road-issues-feed) for up-to-date information.


Get the code
============

Grab the source from Github

    git clone git://github.com/tulsawebdevs/tulsa-road-issues-feed.git

Install the Packages
====================

Create a virtualenv and install required libraries

    cd tulsa-road-issues-feed
    python ./make_bootstrap.py
    python ./bootstrap.py .

Set up local environment
========================

Copy the distributed local settings

    cp trif/local_settings.py-dist trif/local_settings.py

Activate the virtualenv

    source bin/activate

Initialize the (sqlite) database

    python trif/manage.py syncdb
    python trif/manage.py migrate

Run it
======

Activate the virtualenv

    source bin/activate

Fetch feed data

    python trif/manage.py fetch_feeds

Run the django dev server

    python trif/manage.py runserver
