--Program to construct the OS
--Init
fs = require("filesystem")
screen = require("screen")
page = require("page")
event = require("event")

if screen == nil then
	packages = fs.open("/lib/package.lua",'w')
	print(packages)
	packages.close()
end
event = require("event")

running = true
 
screen.init()
screen.clear()
while running do
	page.homepage()
	local id, _, x, y = event.pullMultiple("touch","interrupted")
	if id == "interrupted" then
		running = false
	end
	os.sleep(0.1)
end