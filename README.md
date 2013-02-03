Tulsa Road Issues Feed
======================
The Tulsa Road Issues Feed (TRIF) aggregates road information from several
sources into a single feed.  This can be used by media outlets to report
issues to their audience, or as the raw data for interactive web projects.

This project is part of [Hackathon 2011](http://tulsahackathon.com/2011/).
See our
[github project](https://github.com/tulsawebdevs/tulsa-road-issues-feed)
for up-to-date information.

The code is running at <http://trif.tulsawebdevs.org>.  Developers might be
interested in the
[about page](http://trif.tulsawebdevs.org/about.html), which has some
background info and describes the API for getting traffic data.
The API is used by <http://ottozen.com>.

Get the code
------------
Grab the source from Github

    git clone git://github.com/tulsawebdevs/tulsa-road-issues-feed.git

Install the Packages
--------------------
Create a virtualenv and install required libraries

    cd tulsa-road-issues-feed
    python ./make_bootstrap.py
    python ./bootstrap.py .

Set up local environment
------------------------
Copy the distributed local settings

    cp trif/local_settings.py-dist trif/local_settings.py

Activate the virtualenv

    source bin/activate

Initialize the (sqlite) database

    python trif/manage.py syncdb
    python trif/manage.py migrate

Run it
------
Activate the virtualenv

    source bin/activate

Fetch feed data

    python trif/manage.py fetch_feeds

Run the django dev server

    python trif/manage.py runserver

On trif.tulsawebdevs.org
------------------------
The code on the server runs from `/home/trif/trif`.  Developers in the `trif`
group can pull changes from the github repo.
[supervisor](http://supervisord.org/) is used to run the project, and
[nginx](http://nginx.org/) as the HTTP server.

To fetch the feeds, a crontab task runs a script to run
`manage.py fetch_feeds` (see `scripts/update_feeds.sh` for the script).
The script creates `/tmp/trif_update_feeds`, with the current date,
and deletes it on completion.  This is used to determine if the script
is already running, so that we don't run it again if something is going
wrong (usually a problem on the City of Tulsa sites).  If something does
go wrong, you may need to log in, manually delete this file, and kill the
stuck processes.  The contents of the file (and `/tmp/last_feed_run.txt`)
will tell you how long the process was stuck.
