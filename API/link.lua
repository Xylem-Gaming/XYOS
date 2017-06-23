local component = require("component")
local event = require("event")
local modem = component.modem

link ={}

m.open(123)

modem.broadcast(321, "This is a test")

local _, _, from, port, _, message = event.pull("modem_message")
print("Got a message from ".. from .. " on port " .. port .. ": " .. tostring(message))

return link