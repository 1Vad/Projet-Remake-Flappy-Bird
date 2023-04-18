local Class = require("lib/class")
local Entity = require("lib/entity")
local Entity2 = require("lib/entity")

local Tuyau =Class{__includes=Entity}



function Tuyau:init(screenWidth,screenHeight,retard)

    self.trou = 125 --de 100 à 600 max
    trou=self.trou
    self.tuyaul=math.random(50,600-self.trou)
    self.screenWidth = screenWidth
    self.screenHeight = screenHeight
    self.speed = 100
    self.xtu = 800+retard

    Entity2.init(self,self.xtu,self.tuyaul+self.trou,theGame:getAssetManager():getImage("btuyau"))
    Entity.init(self,self.xtu,-700+self.tuyaul,theGame:getAssetManager():getImage("htuyau"))

end

function Tuyau:stop()
    
end

function Tuyau:move(dir)
    
end

function Tuyau:update(dt)
    self.xtu = self.xtu-3
    if self.xtu<-150 then 
        self.tuyaul=math.random(50,650-self.trou)
    end
    if self.xtu<-200 then 
        self.xtu=1100
    end
    --self.position.x=self.xtu
    

    --self.position.y=self.tuyaul+self.trou

    
    

   
end

function Tuyau:render()

    Entity.init(self,self.xtu,-700+self.tuyaul,theGame:getAssetManager():getImage("htuyau"))
    self.position.x=self.xtu
    self.position.y=-700+self.tuyaul
    Entity.render(self) 
   
    --love.graphics.setColor(0,0.5,0)
    --love.graphics.rectangle("fill",self.xtu,self.tuyaul+self.trou,100,self.screenHeight-self.tuyaul-self.trou)
    --love.graphics.reset()
    
   

end

function Tuyau:render1()

    Entity2.init(self,self.xtu,self.tuyaul+self.trou,theGame:getAssetManager():getImage("btuyau"))
    self.position.x=self.xtu
    self.position.y=self.tuyaul+self.trou
    Entity2.render(self)
   

end

return Tuyau