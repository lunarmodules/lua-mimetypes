-- Tests for mimetypes.

local mimetypes = require 'mimetypes'


-- basic testing
assert(mimetypes.guess("memo.doc") == "application/msword")
assert(mimetypes.guess("rickroll.mp3") == "audio/mpeg")
assert(mimetypes.guess("cat.png") == "image/png")
assert(mimetypes.guess("forwarded.eml") == "message/rfc822")
assert(mimetypes.guess("docs.txt") == "text/plain")
assert(mimetypes.guess("init.lua") == "text/x-lua")
assert(mimetypes.guess("fish.mpg") == "video/mpeg")
assert(mimetypes.guess("notareal.mimetype") == nil)

-- special filenames
assert(mimetypes.guess("README") == "text/plain")
assert(mimetypes.guess("Makefile") == "text/x-makefile")
assert(mimetypes.guess("NINJAS") == nil)

-- detecting extensions
assert(mimetypes.guess("txt") == nil)
assert(mimetypes.guess("mimetypes-1.0.tar.gz") == "application/x-gzip")

-- copying MIME types
local db = mimetypes.copy()
db.extensions.xmp = "application/x-example"
assert(mimetypes.guess("file.xmp", db) == "application/x-example")
assert(mimetypes.guess("file.xmp") == nil)
db.extensions.rar = "application/x-evil"    -- seriously, it is
assert(mimetypes.guess("archive.rar", db) == "application/x-evil")
assert(mimetypes.guess("archive.rar") == "application/x-rar-compressed")
db.filenames[".hgignore"] = "text/plain"
assert(mimetypes.guess(".hgignore", db) == "text/plain")
assert(mimetypes.guess(".hgignore") == nil)

