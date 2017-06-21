--[[
Variables
]]--

filesystem = fs
path = nil
component = require("component")
internet = component.internet

--[[
User Interface
]]--
term.write("Please name file. \n:")
name = io.read()

--[[
Functions
]]--
function checkPage(url)
	local request, response = internet.request(url)
	return response
end

function downLoad()

end

function compile(path, name)
  local file = io.open(path.."/"..name)
	local file = fs:write(body)
	fs:close()
end
