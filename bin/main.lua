--Program to construct the OS
--Init
fs = require("filesystem")
screen = require("screen")
page = require("page")

if screen == nil then
	packages = fs.open("/lib/package.lua",'w')
	print(packages)
	packages.close()
end
event = require("event")

running = true
 
screen.init()
while running do
	event, param1, param2, param3 = event.pull("touch")
	page.homepage()
	sleep(0.1)
end