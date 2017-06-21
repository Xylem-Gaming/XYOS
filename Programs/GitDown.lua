--[[
Variables
]]--

filesystem = fs
path = nil
component = require("component")
internet = component.internet

--[[
Functions
]]--
function checkPage(url)
	local request, response = internet.request(url)
	return response
end

function downLoad(url)
	body = internet.open(url, 80)
end

function compile(path, raw)
  local file = io.open(path.."/"..name)
	local file = fs:write(body)
	fs:close()
end

--[[
User Interface
]]--
while true do
	term.write("Please enter the url of the repository")
	url = io.read()
	if checkPage then
		body = downLoad(url)
		compile(path, body)
	end
end