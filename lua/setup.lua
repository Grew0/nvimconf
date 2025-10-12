-- This file MUST provide a name of PC
-- with g._PC.name
require("uniq")

local pc = vim.g._PC;
pc.config = {}

if pc.special_setup ~= nil then pc.special_setup(pc) end

if pc.name == "home" then
	pc.config.no_clang_format = true
end

vim.g._PC = pc;
