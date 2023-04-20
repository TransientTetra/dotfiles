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
M.IsAvailable = function(plugin)
	local lazy_config_avail, lazy_config = pcall(require, "lazy.core.config")
	return lazy_config_avail and lazy_config.plugins[plugin] ~= nil
end
return M
