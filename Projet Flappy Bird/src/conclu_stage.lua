local Class = require("lib/class")
local Label = require("lib/label")

local ConcluStage = Class {}

--constructeur

function ConcluStage:init(screenWidth,screenHeight)

    self.screenWidth = screenWidth
    self.screenHeight = screenHeight

    self.img = theGame:getAssetManager():getImage("fin")

    self.lgameOver = Label("GameOver", theGame:getAssetManager():getFont("Bubblegum"))
    self.lgameOver:setColor(0.9, 0.1, 0.9)

    self.lname = Label("Name", theGame:getAssetManager():getFont("Vanilla"))
    self.lname:setColor(0.9, 0.1, 0.9)

    self.lpoints = Label("Points", theGame:getAssetManager():getFont("Bubblegum"))
    self.lpoints:setColor(0.9, 0.1, 0.9)

    self.lcommande = Label("Appuyez sur R  pour recommencer", theGame:getAssetManager():getFont("Vanilla"))
    self.lcommande:setColor(0.9, 0.1, 0.9)

    self.lcommande2 = Label("Appuyez sur Echap pour quitter", theGame:getAssetManager():getFont("Vanilla"))
    self.lcommande2:setColor(0.9, 0.1, 0.9)

end

function ConcluStage:onEnter(datas)
 if datas then
        
        local name = datas.name
        local points = datas.points

        self.lname:setText(name)
        self.lpoints:setText(points)
    end
end
function ConcluStage:onExit()
   local song = theGame:getAssetManager():getMusic("song")

    song:setLooping(false)
    song:stop()
    theGame:getAssetManager():getSound("ouille"):stop()

end

function ConcluStage:update(dt)
    if theGame:getInputManager():isKeyPressed("r")==true then
        theGame:getStageManager():changeStage("play")
        lifebird=3
        score=0
        begin=0
    end
    if ha==0 and ha2==1 then
        theGame:getAssetManager():getSound("ouille"):stop()
        theGame:getAssetManager():getSound("ouille"):play()
        ha2=0
    end

end

function ConcluStage:render()

    love.graphics.draw(self.img, 0, 0)

    self.lgameOver:render(350,10)
    self.lname:render(450,200)
    self.lpoints:render(460,300)
    self.lcommande:render(250,self.screenHeight - 100)
    self.lcommande2:render(250,self.screenHeight - 140)

end



return ConcluStage