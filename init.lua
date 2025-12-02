require("core.options")
require("core.keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

local rtp = vim.opt.rtp
rtp:prepend(lazypath)

local init_common_plugins = function()
	return {
		require("plugins.common.colortheme"),
		require("plugins.common.neotree"),
		require("plugins.common.bufferline"),
		require("plugins.common.lualine"),
		require("plugins.common.treesitter"),
		require("plugins.common.telescope"),
		require("plugins.common.lsp"),
		require("plugins.common.autocomplete"),
		require("plugins.common.comment"),
		require("plugins.common.none-ls"),
		require("plugins.common.gitsigns"),
		require("plugins.common.dap"),
		require("plugins.common.alpha"),
	}
end

local init_go_plugins = function()
	return {
		require("plugins.go.gopher"),
	}
end

require("lazy").setup({
	init_common_plugins(),
	init_go_plugins(),
})
