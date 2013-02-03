#!/bin/bash
RUNNING=/tmp/trif_update_feeds
if [[ "$USER" != "trif" ]]
then 
  echo "You must run this as trif"
  exit 1
fi
v=""
if [[ "$1" == "--quiet" ]]
then
  v="--verbosity=0"
fi
if [[ -e $RUNNING ]]
then
  if [[ -z $v ]]
  then
    echo "$RUNNING exists, so $0 may already be running.  Exiting."
  fi
  exit
else
date > $RUNNING
fi
cd /home/trif/trif/trif
source /home/trif/.virtualenvs/trif/bin/activate
./manage.py fetch_feeds $v
date > /tmp/last_feed_run.txt
rm -f $RUNNING

