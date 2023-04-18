
--bibliotheques de données
local game = require("lib/game")
local stageManager = require("lib/stageManager")
local playStage = require("src/play_stage")
local introStage = require("src/intro_stage")
local concluStage = require("src/conclu_stage")

--local variables
local WINDOW_WIDTH = 1000
local WINDOW_HEIGHT = 700

--global variables
theGame = game(WINDOW_WIDTH, WINDOW_HEIGHT, "mushroom_fly")

function love.load()
    theGame:begin()

    theGame:getAssetManager():loadImage("background", "/assets/background4.png")
    theGame:getAssetManager():loadImage("intro", "/assets/fond_intro.png")
    theGame:getAssetManager():loadImage("sorciere", "/assets/sorcier.png")
    theGame:getAssetManager():loadImage("Poisson", "/assets/fish.png")
    theGame:getAssetManager():loadImage("Poissonm", "/assets/fishm.png")
    theGame:getAssetManager():loadImage("Poissonb", "/assets/fishb.png")
    theGame:getAssetManager():loadImage("btuyau", "/assets/panard.png")
    theGame:getAssetManager():loadImage("htuyau", "/assets/panard3.png")
    theGame:getAssetManager():loadImage("Coeur", "/assets/coeurrr.png")
    theGame:getAssetManager():loadImage("ground", "/assets/ground.png")
    theGame:getAssetManager():loadImage("fin", "/assets/fin.png")



    theGame:getAssetManager():loadMusic("song", "/assets/musique_fond.mp3")
    theGame:getAssetManager():loadSound("ouille", "/assets/mort.mp3")
    theGame:getAssetManager():loadSound("fly", "/assets/flop.mp3")

    theGame:getAssetManager():loadFont("Vanilla","/assets/Vanilla.otf",40)
    theGame:getAssetManager():loadFont("Bubblegum","/assets/Bubblegum.ttf",60)
   
    --
    theGame:loadStages(stageManager({
          
          ["play"] = function()
            return playStage(WINDOW_WIDTH, WINDOW_HEIGHT)
          end,

          ["intro"] = function()
            return introStage(WINDOW_WIDTH, WINDOW_HEIGHT)
        end,
        ["conclu"] = function()
            return concluStage(WINDOW_WIDTH, WINDOW_HEIGHT)
        end

            }))
    --
    theGame:getStageManager():changeStage("intro")

    print("end loading")

end
--
--
function love.update(dt)
    theGame:update(dt)
end
--
--
function love.draw()
    theGame:render()
end

function love.keypressed(key)
    theGame:getInputManager():setKeyPressed(key)
  print(key)
    if key=="escape" then
        print("quit prog")
        theGame:exit()
    end
end

--
--
function love.keyreleased(key)
    theGame:getInputManager():setKeyReleased(key)
end
--

--ajouts apres

function love.mousepressed(x, y, button)
    theGame:getInputManager():setMousePressed(x, y, button)
end
--
function love.mousereleased(x, y, button)
    theGame:getInputManager():setMouseReleased(x, y, button)
end
--
--

