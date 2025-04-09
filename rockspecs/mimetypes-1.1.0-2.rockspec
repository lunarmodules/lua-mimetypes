local package_name = "mimetypes"
local package_version = "1.1.0"
local rockspec_revision = "2"
local github_account_name = "lunarmodules"
local github_repo_name = "lua-mimetypes"


package = package_name
version = package_version.."-"..rockspec_revision

source = {
  url = "git+https://github.com/"..github_account_name.."/"..github_repo_name..".git",
  branch = (package_version == "dev") and "main" or nil,
  tag = (package_version ~= "dev") and ("v" .. package_version) or nil,
}

description = {
  summary = "A simple library for looking up the MIME types of files.",
  detailed = [[
    This is a simple library for guessing a file's MIME type. It includes
    a (hopefully) comprehensive database of MIME types, but it allows you
    to create your own should you have specific requirements. It can
    guess types both by extension and by the complete filename.
  ]],
  homepage = "https://github.com/"..github_account_name.."/"..github_repo_name,
  license = "MIT/X11",
}

dependencies = {
  "lua >= 5.1"
}

build = {
  type = "builtin",
  modules = {
    ["mimetypes"] = "mimetypes.lua",
    ["mimetypes.filenames"] = "mimetypes/filenames.lua",
    ["mimetypes.extensions"] = "mimetypes/extensions.lua",
    ["mimetypes.generated"] = "mimetypes/generated.lua",
  }
}
