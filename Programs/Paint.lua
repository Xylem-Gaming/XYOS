local component = require("component")
local gpu = component.gpu
local event = require("event")
local colors = require("colors")

local oldB = gpu.getBackground()
local oldF = gpu.getForeground()

local w,h = gpu.getResolution()

gpu.fill(1,1,w,h," ")

--For printing the color buttons on the screen
function buttons()
  --Clear
  gpu.set(1,1, "Clear")
  
  --White
  gpu.setBackground(0xFFFFFF)
  gpu.fill(25,1,5,5," ")
  
  --Purple
  gpu.setBackground(0x8E44AD)
  gpu.fill(30,1,5,5," ")
  
  --Blue
  gpu.setBackground(0x3498DB)
  gpu.fill(35,1,5,5," ")
  
  --Red
  gpu.setBackground(0xE74C3C)
  gpu.fill(40,1,5,5," ")
  
  --Green
  gpu.setBackground(0x1ABC9C)
  gpu.fill(45,1,5,5," ")
  
  --Yellow
  gpu.setBackground(0xF7DC6F)
  gpu.fill(50,1,5,5," ")

  --Orange
  gpu.setBackground(0xF39C12)
  gpu.fill(55,1,5,5," ")
  
  gpu.setBackground(0xFFFFFF)
end

--For actual coloring of the screen
function paint(x,y)
  
  if y <= 5 then
    --Clear
	if x >= 2 and y == 1 then
      gpu.setBackground(oldB)
      gpu.fill(1,1,w,h," ")
      buttons()
    end    
	
	--White
	if x >= 25 and x<= 30 and y >= 1 and y <= 5 then
      gpu.setBackground(0xFFFFFF)
      gpu.fill(x,y,1,1," ")
    end
	
	--Purple
	if x >= 30 and x<= 35 and y >= 1 and y <= 5 then
      gpu.setBackground(0x8E44AD)
	  gpu.fill(x,y,1,1," ")
    end
	
    --Blue
    if x >= 35 and x<= 40 and y >= 1 and y <= 5 then
      gpu.setBackground(0x3498DB)
      gpu.fill(x,y,1,1, " ")
    end
	
    --Red    
	if x >= 40 and x<= 45 and y >= 1 and y <= 5 then
      gpu.setBackground(0xE74C3C)
      gpu.fill(x,y,1,1, " ")
    end
	
    --Green
	if x >= 45 and x<= 50 and y >= 1 and y <= 5 then
      gpu.setBackground(0x1ABC9C)
      gpu.fill(x,y,1,1, " ")
    end
    --Yellow
	
	if x >= 50 and x<= 55 and y >= 1 and y <= 5 then
      gpu.setBackground(0xF7DC6F)
      gpu.fill(x,y,1,1, " ")
    end
	
    --Orange
	if x >= 55 and x<= 60 and y >= 1 and y <= 5 then
      gpu.setBackground(0xF39C12)
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
      paint(x,y)

    end
end
