import socket
from django.core.management.base import BaseCommand, CommandError
from trif.trif_feeds import utils

class Command(BaseCommand):
    help = 'Fetches the source feeds'
    
    def handle(self, *args, **options):
        v = int(options['verbosity'])
        socket.setdefaulttimeout(2)

        if v > 0:
            self.stdout.write('Reading 911 incidents\n')
        utils.fetch_incidents()

        if v > 0:
            self.stdout.write('Reading City of Tulsa closures\n')
        utils.fetch_local_closures()

        if v > 0: 
            self.stdout.write('Success\n')
