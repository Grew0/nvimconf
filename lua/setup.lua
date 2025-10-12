-- This file MUST provide a name of PC
-- with g._PC.name
require("uniq")

local pc = vim.g._PC;

if pc.name == "home" then
	if pc.special_setup ~= nil then
		pc.special_setup()
	end
end

vim.g._PC = pc;
