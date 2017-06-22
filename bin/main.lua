--Program to construct the OS
event = require("event")

running = true
 
screen.init()
while running do
	event, param1, param2, param3 = event.pull("touch")
	page.homepage()
	sleep(0.1)
end