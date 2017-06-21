--[[
Variables
]]--

filesystem = fs
path = nil
component = require("component")
internet = component.internet
response = nil

--[[
Functions
]]--

function checkPage(url)
	local request, state = internet.request(url)
	if state == "invalid adress" then
		response = false
		return response
	else
		repsonse = true
		return response
	end
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
User Interface / constructor
]]--
while true do
	term.write("Please enter the url of the repository")
	--url = io.read()
	url = "https://api.github.com/repos/Xylem-Gaming/XYOS/contents"
	if checkPage then
		body = downLoad(url)
		compile(path, body)
	end
end