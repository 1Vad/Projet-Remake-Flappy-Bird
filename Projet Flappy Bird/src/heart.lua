local Class = require("lib/class")
local Entity = require("lib/entity")

local heart =Class{__includes=Entity}

function heart:init(screenWidth,screenHeight)
    self.screenWidth = screenWidth
    self.screenHeight = screenHeight
    Entity.init(self,-screenWidth,screenHeight/20,theGame:getAssetManager():getImage("Coeur"))

end

function heart:update(dt)
    Entity.update(self,dt) 

end

function heart:render()
    Entity.render(self) 
end

return heart