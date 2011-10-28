from manifesto import Manifest

class TrifManifest(Manifest):
    def cache(self):
        return [
            '/static/style.css',
            '/static/script.js',
        ]

    def network(self):
        return ['*']

    def fallback(self):
        return [
            ('/', '/offline.html'),
        ]
