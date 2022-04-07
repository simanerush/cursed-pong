//
//  GameScene.swift
//  Pong
//
//  Created by Sima Nerush on 4/3/22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var button: SKNode! = nil
    //    private var label : SKLabelNode?
    //    private var spinnyNode : SKShapeNode?
    private var player: Player?
    private var aiPlayer: Opponent?
    private var ball: Ball?
    private var gamePhysics : SKPhysicsBody?
    
    private var paddleWidth : Int?
    private var ballSensitivity : Double?

    
    private var won : Bool?
    private var lost : Bool?

    override func didMove(to view: SKView) {
// Create a simple red rectangle that's 100x44
//        button = SKSpriteNode(color: .red, size: CGSize(width: 100, height: 44))
//        // Put it in the center of the scene
//        button.position = CGPoint(x:self.frame.midX, y:self.frame.midY);
//        self.addChild(button)

        self.paddleWidth = 150
        self.lost = false
        self.won = false
       
        // Get label node from scene and store it for use later
        //        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
        //        if let label = self.label {
        //            label.alpha = 0.0
        //            label.run(SKAction.fadeIn(withDuration: 2.0))
        //        }
        
        // Create shape node to use during mouse interaction
        //        let w = (self.size.width + self.size.height) * 0.05
        //        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
        
        //        if let spinnyNode = self.spinnyNode {
        //            spinnyNode.lineWidth = 2.5
        //
        //            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
        //            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
        //                                              SKAction.fadeOut(withDuration: 0.5),
        //                                              SKAction.removeFromParent()]))
        //        }
        
        // Create two players
        self.player = Player(yPosition: self.frame.minY + 75)
        if let player = player {
            self.addChild(player.shapeNode)
        }
        
        self.aiPlayer = Opponent(yPosition: self.frame.maxY - 125, aiSpeed: 100)
        if let player = self.aiPlayer {
            self.addChild(player.shapeNode)
        }
        
        
        // Create a ball
        self.ball = Ball()
        if let ball = self.ball {
            self.addChild(ball.shapeNode)
        }
    }
    
    func goToGameScene() {
        let gameScene: GameScene = GameScene(size: CGSize(width: 2338, height: 1080)) // create your new scene
//        let transition = SKTransition.fade(withDuration: 1.0) // create type of transition (you can check in documentation for more transtions)
//        gameScene.scaleMode = SKSceneScaleMode.fill
        self.view!.presentScene(gameScene)
    }
    
    func touchDown(atPoint pos : CGPoint) {
        //        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
        //            n.position = pos
        //            n.strokeColor = SKColor.green
        //            self.addChild(n)
        //        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        //        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
        //            n.position = pos
        //            n.strokeColor = SKColor.blue
        //            self.addChild(n)
        //        }
        
        if let paddle = self.player {
            paddle.shapeNode.position = CGPoint(x: pos.x, y: paddle.yPosition)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        //        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
        //            n.position = pos
        //            n.strokeColor = SKColor.red
        //            self.addChild(n)
        //        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //        if let label = self.label {
        //            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        //        }
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
// Loop over all the touches in this event
        for touch in touches {
            // Get the location of the touch in this scene
            _ = touch.location(in: self)
            // Check if the location of the touch is within the button's bounds
//            if button.contains(location) {
//                self.won! = true
//            }
        }
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        if let aiPlayer = self.aiPlayer {
            aiPlayer.update(xPositionDifference: ball!.shapeNode.position.x - aiPlayer.shapeNode.position.x)
//            aiPlayer.physicsBody.velocity.dx = aiPlayer.aiSpeed * 30
            aiPlayer.shapeNode.position.x += aiPlayer.physicsBody.velocity.dx
        }
        // Called before each frame is rendered
    }
}
