#!/usr/bin/env lua

config = arg[1] or error("Must pass the config as the first argument!")
loadfile(config)()

mapfile = arg[2] or error("Must pass the mappings file as the second argument!")
loadfile(mapfile)()

getOldPath = function(old)
	return ([[%s/%s]]):format(FILEROOT, old)
end

for old, _ in pairs(mappings) do
	io.write(getOldPath(old) .. "\0")
end
