
# https://stackoverflow.com/questions/4888027/python-and-pip-list-all-versions-of-a-package-thats-available

import json
import urllib2
from distutils.version import StrictVersion

def versions(package_name):
    url = "https://pypi.python.org/pypi/%s/json" % (package_name,)
    data = json.load(urllib2.urlopen(urllib2.Request(url)))
    versions = data["releases"].keys()
    versions.sort(key=StrictVersion)
    return versions

print "\n".join(versions("octodns"))