--import lib

local Class = require("lib/class")
local Clavier = require("src/clavier")
local Label = require("lib/label")

local IntroStage = Class {}

--init
nom=""
function IntroStage:init(screenWidth,screenHeight)

    self.screenWidth = screenWidth
    self.screenHeight = screenHeight

    self.clavier=Clavier(self.screenWidht,self.screenHeight)
    self.img = theGame:getAssetManager():getImage("intro")

    self.lcommande = Label("Appuyez sur Entrée pour commencer", theGame:getAssetManager():getFont("Vanilla"))
    self.lcommande:setColor(0.9, 0.1, 0.9)
end

--entree sortie

function IntroStage:onEnter(datas)
    local song = theGame:getAssetManager():getMusic("song")

    song:setLooping(true)
    song:setVolume(0.3)
    song:play()

end

function IntroStage:onExit()
    local song = theGame:getAssetManager():getMusic("song")

    song:setLooping(false)
    song:stop()

end
--update

function IntroStage:update(dt)
    if theGame:getInputManager():isKeyPressed("left")==true then
        self.clavier:move("left")
    end

    if theGame:getInputManager():isKeyPressed("right")==true then
        self.clavier:move("right")
    end
    if theGame:getInputManager():isKeyPressed("down")==true then
        self.clavier:move("down")
    end
    if theGame:getInputManager():isKeyPressed("up")==true then
        self.clavier:move("up")
    end
    if theGame:getInputManager():isKeyPressed("space")==true then
        self.clavier:move("space")
    end

    if theGame:getInputManager():isKeyPressed("return") or theGame:getInputManager():isKeyPressed("enter") then
        nom=self.clavier.mot
        theGame:getStageManager():changeStage("play", datas)
    end

end

--pareil que draw

function IntroStage:render()
    love.graphics.draw(self.img, 0,0)
   self.clavier:render()
   self.lcommande:render(200,self.screenHeight - 100)
end

return IntroStage