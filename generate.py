# This Python script was used to generate most of the MIME types.
# The original run was on Python 2.7.1.

import mimetypes
from operator import itemgetter

list = mimetypes.types_map.items()

def sortkey(pair):
    return pair[1].split("/")[0], pair[0]

list.sort(key=sortkey)

for (ext, mt) in list:
    print ('extensions[%r] = %r' % (ext.lstrip("."), mt))
