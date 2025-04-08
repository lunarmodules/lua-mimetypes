-- mimetypes.lua
-- Version 1.0.0

--[[
Copyright (c) 2011 Matthew "LeafStorm" Frazier

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

======

In addition, the MIME types contained in the Software were
originally obtained from the Python 2.7.1 ``mimetypes.py`` module,
though they have been considerably modified and augmented.
Said file was made available under the Python Software Foundation
license (http://python.org/psf/license/).
]]

-- This table is the one that actually contains the exported functions.

local mimetypes = {}

mimetypes.version = '1.0.0'


-- Extracts the extension from a filename and returns it.
-- The extension must be at the end of the string, and preceded by a dot and
-- at least one other character. Only the last part will be returned (so
-- "package-1.2.tar.gz" will return "gz").
-- If there is no extension, this function will return nil.

local function extension (filename)
    return filename:match(".+%.([%a%d]+)$")
end


-- Creates a deep copy of the given table.

local function copy (tbl)
    local ntbl = {}
    for key, value in pairs(tbl) do
        if type(value) == 'table' then
            ntbl[key] = copy(value)
        else
            ntbl[key] = value
        end
    end
    return ntbl
end


-- This is the default MIME type database.
-- It is a table with two members - "extensions" and "filenames".
-- The filenames table maps complete file names (like README) to MIME types.
-- The extensions just maps the files' extensions (like jpg) to types.

local defaultdb = {
    extensions = require("mimetypes.extensions"),
    filenames = require("mimetypes.filenames"),
}



-- Creates a copy of the MIME types database for customization.

function mimetypes.copy (db)
    db = db or defaultdb
    return copy(db)
end


-- Guesses the MIME type of the file with the given name.
-- It is returned as a string. If the type cannot be guessed, then nil is
-- returned.

function mimetypes.guess (filename, db)
    db = db or defaultdb
    if db.filenames[filename] then
        return db.filenames[filename]
    end
    local ext = extension(filename)
    if ext then
        return db.extensions[ext]
    end
    return nil
end

return mimetypes
