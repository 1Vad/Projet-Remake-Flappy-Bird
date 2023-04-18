--import lib

local Class = require("lib/class")

local poisson = require("src/Poisson")
local Witch=require("src/witch")
local ScoreManager = require("lib/scoreManager")
local Tuyau = require("src/tuyau")
local Tuyau2 = require("src/tuyau")
local Tuyau3 = require("src/tuyau")

local Heart = require("src/heart")

local PlayStage = Class {}

 ha=1
  ha2=1
 lifebird=3
 score=0
 begin=0
 trou=100
 retry=0

--init

function PlayStage:init(screenWidth,screenHeight)

    self.screenWidth = screenWidth
    self.screenHeight = screenHeight

    -- score
    self.score = ScoreManager(screenWidth, screenHeight)

    self.img = theGame:getAssetManager():getImage("background")
    self.ground = theGame:getAssetManager():getImage("ground")

    self.Poisson=poisson(screenWidth,screenHeight,self.score)

    self.tuyau=Tuyau(screenWidht,screenHeight,0)
    self.tuyau2=Tuyau2(screenWidht,screenHeight,450)
    self.tuyau3=Tuyau3(screenWidht,screenHeight,900)

    self.heart=Heart(screenWidth,screenHeight)
    self.witch=Witch(screenWidth,screenHeight,self.Poisson)

end

--entree sortie

function PlayStage:onEnter(datas)
    local song = theGame:getAssetManager():getMusic("song")

    song:setLooping(true)
    song:setVolume(0.3)
    song:play()

end

function PlayStage:onExit()
    local song = theGame:getAssetManager():getMusic("song")

    song:setLooping(false)
    song:stop()

end

--update

function PlayStage:update(dt)

    if theGame:getInputManager():isKeyPressed("left")==true then
        self.Poisson:move("left")
        lifebird = lifebird+1
    end

    if theGame:getInputManager():isKeyPressed("right")==true then
        self.Poisson:move("right")
        lifebird = 1
    end

    if theGame:getInputManager():isKeyPressed("space")==true then
        self.Poisson:move("space")
        theGame:getAssetManager():getSound("fly"):stop()
        theGame:getAssetManager():getSound("fly"):play()
        begin=1
       
    end

    if (theGame:getInputManager():isKeyPressed("p")==true and lifebird==0) or retry==1  then
        self.tuyau.xtu=800
        self.tuyau2.xtu=800+450
        self.tuyau3.xtu=800+900
        
        self.tuyau.tuyaul=math.random(50,650-self.tuyau.trou)
        self.tuyau2.tuyaul=math.random(50,650-self.tuyau.trou)
        self.tuyau3.tuyaul=math.random(50,650-self.tuyau.trou)

        self.Poisson.position.y=self.screenHeight/2
        if lifebird<=0 then
         lifebird=3
         score=0
         begin=0
         self.Poisson.compte=37
        end
        self.witch.position.x=self.screenWidth*2

        ha=1
        ha2=1 
        theGame:getAssetManager():getSound("ouille"):stop()

        retry=0
    end

    
    self.Poisson:life2(self.tuyau.xtu,self.tuyau.tuyaul)
    self.Poisson:life2(self.tuyau2.xtu,self.tuyau2.tuyaul)
    self.Poisson:life2(self.tuyau3.xtu,self.tuyau3.tuyaul)
    

    self.Poisson:update(dt)
    if lifebird>0 and begin==1 then
        self.tuyau:update(dt)
        self.tuyau2:update(dt)
        self.tuyau3:update(dt)
    end
    
    self.heart:update(dt)
    self.witch:update(dt)
end



--pareil que draw

function PlayStage:render()
    print("render")

    love.graphics.draw(self.img, 0,0)
    

    self.tuyau:render()
    self.tuyau2:render()
    self.tuyau3:render()

    self.tuyau:render1()
    self.tuyau2:render1()
    self.tuyau3:render1()
    love.graphics.draw(self.ground, 0,650)

    self.Poisson:render()

    if lifebird<=0 and self.Poisson.position.y>700-25-50 then
        local datas = {  
            name = nom,
            points = self.score:getPoints()
        }
        theGame:getStageManager():changeStage("conclu", datas)
        ha =0
   end
    for ii=0,lifebird-1 do
        self.heart.position.x=self.screenWidth-(self.screenWidth/12)-(70*ii)
        self.heart.position.y=self.screenHeight/40
        self.heart:render()
        
    end
    self.witch:render()
    self.score:render(0.9, 0.9, 0.9)
    love.graphics.print(nom, self.screenWidth / 2, 5)
end 


return PlayStage