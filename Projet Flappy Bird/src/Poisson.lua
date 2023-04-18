local Class = require("lib/class")
local Entity = require("lib/entity")
la=2
local poisson =Class{__includes=Entity}

function poisson:init(screenWidth,screenHeight, score)

    self.screenWidth = screenWidth
    self.screenHeight = screenHeight
    self.speed = 300
    self.speedtab = {9*60,7*60,7*60,6*60,6*60,5*60,5*60,4*60,4*60,3*60,3*60,3*60,2*60,2*60,2*60,1*60,1*60,0,0,0,0,0,0,-1*60,-1*60,-1*60,-2*60,-2*60,-2*60,-3*60,-3*60,-4*60,-4*60,-5*60,-6*60,-9*60,0}
    self.compte = 37
  
    self.score = score

    Entity.init(self,screenWidth/6,screenHeight/2,theGame:getAssetManager():getImage("Poisson"))

end

function poisson:stop()
    self:setVelocityXY(0,0)
end

function poisson:move(dir)
    if dir == "space" and lifebird>0 then
        self.compte=1
    end
    
    if dir == "left" then
        self:setVelocityY(self.speed)
    end

    if dir == "right" then
        self:setVelocityY(-self.speed)
    end
end

function poisson:update(dt)
    if self.compte<35 then
        self.compte=self.compte+1
    end
    if lifebird==0 then
        self.compte=36
    end
    if  self.position.y>700-25-50 then
        self.compte=37
        lifebird=0
    end
    self:setVelocityY(-self.speedtab[self.compte])
    
    Entity.update(self,dt)
    if self.speedtab[self.compte]>122  then
        Entity.init(self,self.position.x,self.position.y,theGame:getAssetManager():getImage("Poissonm"))
    elseif self.speedtab[self.compte]<-122 then
        Entity.init(self,self.position.x,self.position.y,theGame:getAssetManager():getImage("Poissonb"))
    else
        Entity.init(self,self.position.x,self.position.y,theGame:getAssetManager():getImage("Poisson"))
    end
    la=self.position.y
end

function poisson:render()


    Entity.render(self) 
end
function poisson:life2(ytu,tuyaul)
    if ytu<=self.screenWidth/6+30 and ytu+100>=self.screenWidth/6 then
        if self.position.y<tuyaul or self.position.y+20>tuyaul+trou then 
            
            lifebird=lifebird-1
            self.score:decrementsLives()
            if lifebird>0 then
                retry=1

            end
        
        end
    end
    if (self.position.x==ytu+49 or self.position.x==ytu+50 or self.position.x==ytu+51) and lifebird>0 then
        self.score:incrementsPoints(1)
    end
end

return poisson