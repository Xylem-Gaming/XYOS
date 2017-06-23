--[[
VARIABLES
]]
 
 local page = {}
 
local pages = {
homepage = false,
redstone = false
}
component = require("component")
screen = require("screen")
gpu = component.gpu
local x,y = gpu.getResolution()
 
background ={
0x0000FF, -- Homepage
0xFF0000, -- Redditor
0x666666 -- Sysprop
}
 
--Check to see what page is displayed
function page.getPage()
  for i = 1,#pages do
    if pages[i] then
      export = {pages[i],background[i]}
      return export
    end
  end
end
 
--Sees if page is runnable
function page.checkPage()
  return pagestat
end
 
--Startscreen for the os
function page.homepage() -- Find out how to label all current objects with their x,y and size
  pages.homepage = true
  pages.redstone = false
  screen.drawBox(2,2,1,x-1,1,y-1,0x0000FF,true)
  screen.centerText(3, "Homepage")
  --for i = 0, #screen.icons-1 do
  --  screen.drawIcon(i,(i*12)+3,5) -- Offset of the x co ordinate plus the with of the icon
  --end
end
 
--Redstone logic screen
function page.redstonePage()
  -- Future page (Redstone logic)
end
 
--Screen to display system properties
function page.systemProp()
 
end

return page