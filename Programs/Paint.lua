local component = require("component")
local gpu = component.gpu
local event = require("event")
local colors = require("colors")

local oldB = gpu.getBackground()
local oldF = gpu.getForeground()

local w,h = gpu.getResolution()

gpu.fill(1,1,w,h," ")

function buttons()
  gpu.setBackground(0x8E44AD)
  gpu.fill(30,1,5,5," ")
  
  gpu.setBackground(0x3498DB)
  gpu.fill(35,1,5,5," ")
end

--gpu.setForeground(0x000000)
--gpu.setBackground(0xFFFFFF)

function paint(x,y)
  gpu.setBackground(0xFFFFFF)
  
  if y <= 5 then
    if x >= 30 and x<= 35 and y >= 1 and y <= 5 then
	  gpu.setBackground(oldB)
	  gpu.fill(1,1,w,h," ")
	  buttons()
	end
	
    if x >= 35 and x<= 40 and y >= 1 and y <= 5 then
	  gpu.setBackground(0x3498DB)
	  gpu.fill(x,y,1,1, " ")
	end
	
  else
    gpu.fill(x,y,1,1," ")

  end
end

gpu.fill(30,1,15,15," ")

buttons()

while true do
	local id, _, x, y = event.pullMultiple("drag","interrupted")

	if id == "interrupted" then
	  gpu.setBackground(oldB)
	  gpu.fill(1,1,w,h," ")
	  print("Soft interrupt, closing")
	  break
		
	elseif id == "drag" then
	  --print("user clicked", x, y)
	  paint(x,y)
		
	end
end
