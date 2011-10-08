from django.core.management.base import BaseCommand, CommandError
from trif.trif_feeds import utils

class Command(BaseCommand):
    args = '--quiet'
    help = 'Fetches the source feeds'
    
    def handle(self, *args, **options):
        q = '--quiet' in args
        if not q: self.stdout.write('Reading 911 incidents\n')
        utils.fetch_incidents()
        if not q: self.stdout.write('Reading City of Tulsa closures\n')
        utils.fetch_local_closures()
        if not q: self.stdout.write('Success\n')
