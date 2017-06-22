--[[
VARIABLES
]]
 
 local page = {}
 
local pages = {
homepage = false,
redstone = false
}
 
gpu = screen.gpu
local x,y = gpu.getResolution()
 
background ={
homepage = 0x0000FF,
redstone = 0xFF0000,
sysprop = 0x666666
}
 
--Check to see what page is displayed
function getPage()
  for i = 1,#pages do
    if pages[i] then
      export = {pages[i],background[i]}
      return export
    end
  end
end
 
--Sees if page is runnable
function checkPage()
  return pagestat
end
 
--Startscreen for the os
function homepage() -- Find out how to label all current objects with their x,y and size
  if true then
    pages.homepage = true
    pages.redstone = false
  end
  screen.clear()
  screen.drawBox(2,2,x-1,y-1,background.homepage,true)
  screen.centerText(3, "Homepage")
  for i = 0, #screen.icons-1 do
    screen.drawIcon(i,(i*12)+3,5) -- Offset of the x co ordinate plus the with of the icon
  end
end
 
--Redstone logic screen
function redstonePage()
  -- Future page (Redstone logic)
end
 
--Screen to display system properties
function page.systemProp()
 
end
