local Class = require("lib/class")
local Label = require("lib/label")
local lettre = require("src/lettre")

local clavier =Class{}

function clavier:init(screenWidth,screenHeight)

    self.screenWidth = screenWidth
    self.screenHeight = screenHeight
    self.cible=1
    self.nbrlet=1
    self.mot=""
    self.nbrlig=9
    self.nbrcol=3
    self.Lettre=lettre(self.screenWidth,self.screenHeight,"a")
    self.tab={"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","<-"}
    self.lettres={}
    self.nom={" "," "," "," "," "," "," "," "," "}
    self.nome = Label(self.nom[1], theGame:getAssetManager():getFont("Vanilla"))
    self.nome:setColor(0.1, 0.9, 0.9)
    self:createrow()

end
function clavier:createrow()
    for col=1,self.nbrlig do
        self.lettres[col]=lettre(self.screenWidht,self.screenHeight,self.tab[col],0)
    end
    for col2=1,self.nbrlig do
        self.lettres[self.nbrlig+col2]=lettre(self.screenWidht,self.screenHeight,self.tab[self.nbrlig+col2],0)
    end
    for col3=1,self.nbrlig do
        self.lettres[(self.nbrlig*2)+col3]=lettre(self.screenWidht,self.screenHeight,self.tab[(self.nbrlig*2)+col3],0)
    end
end

function clavier:move(dir)

    if dir=="left" then
        self.cible=self.cible-1
        if self.cible<1 then
            self.cible=self.cible+self.nbrlig
        end
    end

    if dir=="right" then
        self.cible=self.cible+1
        if self.cible>self.nbrlig*self.nbrcol then
            self.cible=self.cible-self.nbrlig
        end
    end
    if dir=="down" then
        self.cible=self.cible+9
        if self.cible>self.nbrlig*self.nbrcol then
            self.cible=self.cible-(self.nbrlig*self.nbrcol)
        end
    end
    if dir=="up" then
        self.cible=self.cible-9
        if self.cible<0 then
            self.cible=self.cible+(self.nbrlig*self.nbrcol)
        end
    end
    if dir=="space" and self.cible == self.nbrlig*self.nbrcol and self.nbrlet>1 then
        self.nbrlet=self.nbrlet-1
        self.nom[self.nbrlet]=""
        
        self.mot=self.nom[1]..self.nom[2]..self.nom[3]..self.nom[4]..self.nom[5]
        self.nome = Label(self.mot, theGame:getAssetManager():getFont("Vanilla"))
        self.nome:setColor(0.9, 0.1, 0.9)
    end
    if dir=="space" and self.cible ~=self.nbrlig*self.nbrcol then
        self.nom[self.nbrlet]=self.tab[self.cible]
        self.mot=self.nom[1]..self.nom[2]..self.nom[3]..self.nom[4]..self.nom[5]
        if self.nbrlet<6 then
            self.nbrlet=self.nbrlet+1
        end
        self.nome = Label(self.mot, theGame:getAssetManager():getFont("Vanilla"))
        self.nome:setColor(0.9, 0.1, 0.9)
    end
    self:createrow()
    self.lettres[self.cible]=lettre(self.screenWidht,self.screenHeight,self.tab[self.cible],1)
end

function clavier:render()

    for coll=1,self.nbrlig do
        self.lettres[coll]:render(80+80*coll,240)
    end
    for coll2=1,self.nbrlig do
        self.lettres[self.nbrlig+coll2]:render(80+80*coll2,240+100)
    end
    for coll3=1,self.nbrlig do
        self.lettres[(self.nbrlig*2)+coll3]:render(80+80*coll3,240+(100*2))
    end
    self.nome:render(400,100)
end

return clavier