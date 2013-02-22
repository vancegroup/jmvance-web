mappings = {
	-- These pages are still pointed to by some old reachable pages, so the
	-- redirect is mandatory to not break things.
	["/htmls/research.htm"] = "/RESEARCH/";

	-- There should be no more internal links to these pages, so the mapping
	-- is perhaps overkill but playing it safe (and keeping Google Juice)
	["/RESEARCH/COMPLIANT/compliant_mechanism_design.html"] = "/RESEARCH/COMPLIANT/";
}
