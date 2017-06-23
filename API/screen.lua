--[[
WIP screen api for XYOS
]]
 
--[[
INITIALISATION
]]
 
 local screen = {}
 
local component = require("component")
gpu = component.gpu
term = require("term")
 
--[[
VARIABLES
]]
 
iconcol = {}
for i = 0, 1 do
  iconcol[i] = {}
end
--Homepage

for j = 0, 4 do
  iconcol[0][j] = 0x000000
end
--Redstone
iconcol[1][0] = 0
iconcol[1][1] = 0x330000
iconcol[1][2] = 0xFF0000
iconcol[1][3] = 0x990000
iconcol[1][4] = 0x660000

	--iconcol[redstone] = {
	--0 = nil,
	--1 = 0x330000,
	--2 = 0xFF0000,
	--3 = 0x990000,
	--4 = 0x660000}

icons = {}

for i = 0, 1 do
  iconcol[i] = {}
end
--Homepage
icons[0] = {
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
}

--Redstone
icons[1] = {
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


local x,y = gpu.getResolution()
 
function screen.init()
 
end
 
function screen.clear()
  gpu.setBackground(0xFFFFFF)
  gpu.fill(1,1,x,y, " ")
end
 
function screen.drawBox(bx, by, maxx, maxy, colour, border)
  if border == true then
    gpu.setBackground(0xCCCCCC)
    gpu.fill(bx,by,maxx,maxy, " ")
	gpu.setBackground(colour)
	gpu.fill(bx+1,by+1,maxx-2,maxy-2, " ")
  else
	gpu.setBackground(colour)
	gpu.fill(bx,by,maxx,maxy," ")
  end
end
 
function screen.drawLine(x, y, length, colour)
  term.setCursor(x,y)
  gpu.setBackground(colour)
  for i = 1,length do
    term.write(" ")
  end
end
 

function screen.centerText(y,text)
  newx = (math.floor((x+#text)/2))
  term.write(text)
end
 
function screen.drawIcon(icon,x,y)
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
      term.setCursor(row+x,col+y)
      term.write(icons.icon[cvar])
    end
  end
end

return screen