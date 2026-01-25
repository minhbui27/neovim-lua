-- Config must be set before plugin loads
vim.g.rainbow_delimiters = {
	strategy = {
		[""] = "rainbow-delimiters.strategy.global",
		systemverilog = "rainbow-delimiters.strategy.global",
		verilog = "rainbow-delimiters.strategy.global",
	},
	query = {
		[""] = "rainbow-delimiters",
		systemverilog = "rainbow-delimiters", -- custom query with only begin/end blocks
		verilog = "rainbow-delimiters",
	},
	highlight = {
		"GruvboxRed",     -- level 1
		"GruvboxAqua",    -- level 2
		"GruvboxYellow",  -- level 3
		"GruvboxBlue",    -- level 4
		"GruvboxPurple",  -- level 5
		"GruvboxOrange",  -- level 6
	},
}
