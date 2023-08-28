mimetypes.lua
Version 1.0.0

This is just a quick Lua library designed to provide a nice, non-server-bound
database of MIME types. Usage is simple:

    local mimetypes = require 'mimetypes'
    mimetypes.guess "docs.txt"              -- text/plain
    mimetypes.guess "word.doc"              -- application/msword
    mimetypes.guess "init.lua"              -- text/x-lua

Should you need your own MIME types, you can do this:

    local mimedb = mimetypes.copy()
    mimedb.extensions["ext"] = "application/x-cool-type"
    mimetypes.guess("myfile.ext", mimedb)   -- application/x-cool-type

If you want to make sure it works, run `lua test.lua` (or use Shake).


## API

`mimetypes.copy([db])` - Copies the default MIME types database and returns
the copy. If you provide `db`, it is copied instead of the default.

`mimetypes.guess(filename[, db])` - Guesses the MIME type of the file named
`filename`. If a MIME type could not be ascertained, nil is returned. If you
provide `db`, it is used to look up the MIME type instead of the default
database.


## Databases

Each database is a table that contains two fields - `extensions` and
`filenames`. `filenames` is checked first, as it maps literal filenames
(like `README`) to MIME types.

If that doesn't work, the file's extension is taken and looked up in
`extensions`. (For example, `report.pdf` would look up `pdf` and return the
MIME type there, which is `application/pdf`.)

The default database is immutable (and hidden), because it's shared between
everyone who calls `guess` without arguments, and messing with it would be a
bad thing.


## Bugs

If you encounter any missing, inaccurate, or questionably assigned MIME types,
file a bug (preferably including a diff) on the issue tracker at
<http://www.bitbucket.org/leafstorm/lua-mimetypes/>, or e-mail me at
<leafstormrush@gmail.com>.
