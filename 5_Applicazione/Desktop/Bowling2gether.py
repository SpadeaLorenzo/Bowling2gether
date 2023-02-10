from direct.showbase.ShowBase import ShowBase
from direct.gui.OnscreenText import OnscreenText
from direct.gui.OnscreenImage import OnscreenImage
from direct.gui.DirectGui import *
from panda3d.core import *
from panda3d.physics import *
import sys
import simplepbr

loadPrcFileData('', 'win-size 1920 1080')
loadPrcFileData('', 'window-title Bowling2gether')
loadPrcFileData('', 'fullscreen 0')
loadPrcFileData('', 'icon-filename images/icon.ico')

class Bowling2gether(ShowBase):
    arial = None
    BNMachine = None
    shaders = None

    def __init__(self):
        ShowBase.__init__(self)
        #__builtin__.base = self

        self.arial = self.loader.loadFont('font/arial.ttf')
        self.arial.setPixelsPerUnit(100)

        self.BNMachine = self.loader.loadFont('font/BNMachine.ttf')
        self.BNMachine.setPixelsPerUnit(100)


        self.shaders = simplepbr.init()

        self.lobbyScene()


    def lobbyScene(self):

        titleCard = CardMaker('card')
        titleCard.set_frame_fullscreen_quad()
        titleCard = self.render2d.attachNewNode(titleCard.generate())

        titleTexture = self.loader.loadTexture('images/titoloBowling2gether.tiff')
        titleCard.setTexture(titleTexture)


        exitButton = DirectButton(text="Exit",frameColor=(0,0,0,0),scale=0.06, pos=(0,0,-0.8), command=self.exitGame,
        text_font=self.arial)
        exitButton["text_fg"] = (255,255,255,1)

        newGameButton = DirectButton(text="Create Game",frameColor=(0, 0, 0,0),scale=0.1, pos=(0,0,-0.6),
        command=self.createGame,text_font=self.BNMachine,text_fg=(0,0,1,1),relief=6)
        newGameButton["extraArgs"] = [titleCard,exitButton,newGameButton]


    def exitGame(self):
        sys.exit()


    def createGame(self, title, createButton, exitButton):
        title.removeNode()
        createButton.destroy()
        exitButton.destroy()

        background = OnscreenImage(image="images/bg.png", scale=(2,1,1))

        code="1234 5678"

        roomCodeLabel = OnscreenText(text=f"Room Code:\n{code}", scale=0.15, pos=(0,0.6),font=self.arial)

        startGameButton = DirectButton(text="Start Game",frameColor=(0,0,0,0),scale=0.09, pos=(0,0,-0.75),
        command=self.startGame,text_font=self.arial)
        startGameButton["extraArgs"] = [roomCodeLabel, startGameButton, background]


    def startGame(self, roomCodeLabel, startGameButton, background):
        roomCodeLabel.destroy()
        startGameButton.destroy()
        background.destroy()

        scene = self.loader.loadModel("Models/scene/scene.glb")
        scene.setPos(0.75,9,-1)
        scene.reparentTo(self.render)


        ambientLight = AmbientLight('ambientLight')
        ambientLight.setColor((0.5, 0.5, 0.5, 1))
        ambientLightNP = self.render.attachNewNode(ambientLight)
        self.render.setLight(ambientLightNP)

        directionalLight = DirectionalLight('directionalLight')
        directionalLight.setColor((0.8, 0.2, 0.2, 1))
        directionalLightNP = self.render.attachNewNode(directionalLight)
        # This light is facing backwards, towards the camera.
        directionalLightNP.setHpr(180, -20, 0)
        self.render.setLight(directionalLightNP)

        directionalLight = DirectionalLight('directionalLight')
        directionalLight.setColor((0.2, 0.2, 0.8, 1))
        directionalLightNP = self.render.attachNewNode(directionalLight)
        # This light is facing forwards, away from the camera.
        directionalLightNP.setHpr(0, -20, 0)
        self.render.setLight(directionalLightNP)

        
        node = NodePath("PhysicsNode")
        node.reparentTo(self.render)

        an = ActorNode("bowlingBall-physics")
        anp = node.attachNewNode(an)
        self.__builtin__.base.physicsMgr.attachPhysicalNode(an)

        
        bowlingBall = self.loader.loadModel("Models/bowlingBall/bowling_ball.glb")
        bowlingBall.setScale(0.025)

        bowlingBall.reparentTo(anp)




app = Bowling2gether()
app.run()