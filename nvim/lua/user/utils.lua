---------------------------------------
-- Functions
---------------------------------------
local M = {}
M.RestoreLatestSession = function()
	local path = require('auto-session').get_latest_session()
	if path ~= nil then
		require('auto-session').RestoreSession(path:gsub('\\%%', '%%'))
	end
end
return M
