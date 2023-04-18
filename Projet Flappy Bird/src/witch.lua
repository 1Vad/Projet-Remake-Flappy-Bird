local Class = require("lib/class")
local Entity = require("lib/entity")

local witch =Class{__includes=Entity}

function witch:init(screenWidth,screenHeight,oiseau)
    self.screenWidth = screenWidth
    self.screenHeight = screenHeight
    self.oiseau=oiseau
    Entity.init(self,screenWidth*2,math.random(-50,screenHeight),theGame:getAssetManager():getImage("sorciere"))
end

function witch:colibird()
    if self:collide(self.oiseau)==true then
        lifebird=lifebird-1
        if lifebird>0 then
            retry=1

        end
    end
end

function witch:update(dt)

    if begin==1 then
    self:setVelocityX(-12*60)
    else
        self:setVelocityX(0)
    end

    if self.position.x<-150 then 
        self.position.x=self.screenWidth*2
        self.position.y=la
    end
    self:colibird()
    Entity.update(self,dt) 

end

function witch:render()

    Entity.render(self) 

end

return witch