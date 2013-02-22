#!/usr/bin/env lua

config = arg[1] or error("Must pass the config as the first argument!")
loadfile(config)()

mapfile = arg[2] or error("Must pass the mappings file as the second argument!")
loadfile(mapfile)()

getRedirectionLine = function(old, new)
	return ([[redirect 301 /%s%s http://%s/%s%s]]):format(WEBROOT, old, DOMAIN, WEBROOT, new)
end

for old, new in pairs(mappings) do
	print(getRedirectionLine(old, new))
end
