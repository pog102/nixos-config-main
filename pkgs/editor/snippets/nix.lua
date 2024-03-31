local ls = require('luasnip')

-- Define the snippet function
local function print_filename()
    local filename = vim.fn.expand('%:t')
    return ls.insert_text(1, filename)
end

-- Create the LuaSnip snippet
local print_filename_snippet = ls.snippet({
    trig = "opt",
    name = "Print Filename",
    dscr = "Prints the current file's name",
    wordTrig = true,
}, print_filename)
return {
	print_filename_snippet
}
