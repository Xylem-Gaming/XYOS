--[[
Variables
]]--

filesystem = fs
path = nil

--[[
User Interface
]]--
term.write("Please name file. \n:")
name = io.read()

--[[
Functions
]]--
function checkPage()
	--Hello im Ace and you are 
end

function downLoad()

end

function compile(path, name)
  local file = io.open(path.."/"..name)
	local file = fs:write(body)
	fs:close()
end
