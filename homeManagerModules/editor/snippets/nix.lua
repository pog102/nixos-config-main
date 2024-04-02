-- Define the function to print the filename
local function printFilename()
        -- local filename = vim.fn.expand('%:p')
	 -- local fullpath = vim.fn.expand('%:p')
  --   local filename = vim.fn.fnamemodify(fullpath, ':t')
        local filename = vim.fn.expand('%:t:r')
    -- print("Current file name:", filename)
    return filename
end

-- Call the function to print the filename
return {
s("opt", {
t("options = { "),
t({ "", "" }),
f(printFilename),
t(".enable = lib.mkEnableOption \"enable "),
f(printFilename),
t(" file\";"),
t({ "","};" }),
t({"","config = lib.mkIf config."}),
f(printFilename),
t(".enable { "),
  })
}
