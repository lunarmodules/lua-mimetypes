-- Load the generated mime types list from Apache httpd
local extensions = require("mimetypes.generated")

-- Add an additional set of entries
-- (originally in lua-mimetypes, but not in Apache httpd list)
extensions["diff"]         = "text/x-diff"
extensions["pyo"]          = "application/x-python-code"
extensions["pyc"]          = "application/x-python-code"
extensions["pwz"]          = "application/vnd.ms-powerpoint"
extensions["pl"]           = "text/x-perl"
extensions["manifest"]     = "text/cache-manifest"
extensions["md"]           = "text/x-markdown"
extensions["mht"]          = "message/rfc822"
extensions["py"]           = "text/x-python"
extensions["ppa"]          = "application/vnd.ms-powerpoint"
extensions["ru"]           = "text/x-ruby"
extensions["rb"]           = "text/x-ruby"
extensions["o"]            = "application/octet-stream"
extensions["gemspec"]      = "text/x-ruby"
extensions["xpdl"]         = "application/xml"
extensions["a"]            = "application/octet-stream"
extensions["rpm"]          = "application/x-redhat-package-manager"
extensions["xlb"]          = "application/vnd.ms-excel"
extensions["yaml"]         = "text/yaml"
extensions["wiz"]          = "application/msword"
extensions["lua"]          = "text/x-lua"
extensions["nws"]          = "message/rfc822"
extensions["pm"]           = "text/x-perl"
extensions["mhtml"]        = "message/rfc822"
extensions["gz"]           = "application/x-gzip"
extensions["ksh"]          = "text/plain"
extensions["rockspec"]     = "text/x-lua"
extensions["yml"]          = "text/yml"
extensions["mpa"]          = "video/mpeg"


return extensions