#!/usr/bin/env lua


CONFIG = arg[1] or os.getenv("CONFIG") or error("Must pass the config as the first argument or via environment variable CONFIG!")
loadfile(CONFIG)()

require "mappings"

getRedirectionLine = function(old, new)
	return ([[redirect 301 /%s%s http://%s/%s%s]]):format(WEBROOT, old, DOMAIN, WEBROOT, new)
end

for old, new in pairs(mappings) do
	print(getRedirectionLine(old, new))
end
