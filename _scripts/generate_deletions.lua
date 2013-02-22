#!/usr/bin/env lua

CONFIG = arg[1] or os.getenv("CONFIG") or error("Must pass the config as the first argument or via environment variable CONFIG!")
loadfile(CONFIG)()

require "mappings"

getOldPath = function(old)
	return FILEROOT .. old
end

for old, _ in pairs(mappings) do
	print(getOldPath(old))
end
