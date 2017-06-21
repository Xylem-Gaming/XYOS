--[[
WIP screen api for XYOS
]]
 
--[[
INITIALISATION
]]
 
local component = require("component")
gpu = component.gpu
 
--[[
VARIABLES
]]
 
iconcol = {
homepage = {
0 = 0x000000
1 = 0x000000
2 = 0x000000
3 = 0x000000
4 = 0x000000
},
redstone = {
0 = nil,
1 = 0x330000,
2 = 0xFF0000,
3 = 0x990000,
4 = 0x660000}
}
icons = {
homepage = {
0,0,0,0,0,1,1,0,0,0,0,0,
0,0,0,0,1,3,3,1,0,0,0,0,
0,0,0,1,2,3,3,0,1,0,0,0,
0,0,1,3,3,3,3,0,0,1,0,0,
0,1,3,3,0,3,3,0,1,2,1,0,
1,2,3,0,0,3,3,0,0,0,0,1,
1,3,0,0,0,3,3,0,0,1,0,1,
1,0,3,2,0,3,3,0,0,0,0,1,
0,1,0,0,3,3,1,0,0,2,1,0,
0,0,1,1,0,0,0,0,1,1,0,0,
0,0,0,0,1,1,1,1,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0
},
redstone = {
0,0,0,0,0,1,1,0,0,0,0,0,
0,0,0,0,1,3,3,1,0,0,0,0,
0,0,0,1,2,3,0,0,1,0,0,0,
0,0,1,3,3,3,3,0,0,1,0,0,
0,1,3,3,3,3,3,0,1,2,1,0,
1,2,3,0,0,3,2,0,0,0,0,1,
1,3,0,0,3,3,3,0,0,1,0,1,
1,0,3,2,3,3,3,0,0,0,0,1,
0,1,0,0,3,3,1,0,0,2,1,0,
0,0,1,1,0,0,0,0,1,1,0,0,
0,0,0,0,1,1,1,1,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0}
}
mc.taw.net:25584
local x,y = gpu.getResolution()
 
function init()
 
end
 
function clear()
  gpu.setBackground(0xFFFFFF)
  gpu.fill(1,1,x,y, " ")
end
 
function drawBox(local x, local y, minx, maxx, miny, maxy, local colour, border)
  if border == true then
    gpu.setBackground(0xCCCCCC)
      for i = minx-1,maxx+1 do
        for z = miny-1, miny+1 do
          term.setCursorPos(i,z)
          term.write(" S")
      end
    end
    gpu.setBackground(colour)
    for i = minx,maxx do
      for z = miny+1,maxy+1 do
        term.setCursorPos(i,z)
        term.write(" ")
      end
    end
  else
    gpu.setBackground(colour)
    for i = minx,maxx do
      for z = miny,maxy do
        term.setCursorPos(i,z)
        term.write(" ")
      end
    end
  end
end
 
function drawLine(x, y, length, colour)
  term.setCursorPos(x,y,)
  gpu.setBackground(colour)
  for i = 1,length do
    term.write(" ")
  end
end
 
function centerText(local y,text)
  newx = (math.floor((x+#text)/2))
  term.write(text)
end
 
function drawIcon(icon,x,y)
  ncol = 12 -- theoretical columns
  nrow = 12 -- theoretical rows
  --actual columns would be 144 with 0 rows
  for row = 0,nrow-1 do -- difference of 12
    for col = 0,ncol-1 do -- zero base consistent
      cvar = ((row*12)+col) -- calculation for converting 1D array to 2D array
      if icon.icons[cvar] == 0 then
        export = page.getPage()
        term.setBackground(export[1])
      elseif icon.icons[cvar] == 1 then
        term.setBackground(iconcol[icon][1])
      elseif icon.icons[cvar] == 2 then
        term.setBackground(iconcol[icon][2])
      elseif icon.icons[cvar] == 3 then
        term.setBackground(iconcol[icon][3])
      elseif icon.icons[cvar] == 4 then
        term.setBackground(iconcol[icon][4])
      end
      term.setCursorPos(row+x,col+y)
      term.write(icons.icon[cvar])
    end
  end
end
