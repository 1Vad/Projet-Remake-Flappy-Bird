local Class = require("lib/class")
local Label = require("lib/label")

local lettre =Class{}

function lettre:init(screenWidth,screenHeight,type,vrai)
    self.screenWidth = screenWidth
    self.screenHeight = screenHeight
    self.lname = Label(type, theGame:getAssetManager():getFont("Vanilla"))
    if vrai==0 then
        self.lname:setColor(0.1, 0.9, 0.1)
    else
        self.lname:setColor(0.9, 0.1, 0.1)
    end

end


function lettre:render(x,y)

    self.lname:render(x,y)
end

return lettre