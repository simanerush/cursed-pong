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
    
    private var score: (UInt, UInt)?
    
    private var scoreLabel: SKLabelNode?

    override func didMove(to view: SKView) {
// Create a simple red rectangle that's 100x44
//        button = SKSpriteNode(color: .red, size: CGSize(width: 100, height: 44))
//        // Put it in the center of the scene
//        button.position = CGPoint(x:self.frame.midX, y:self.frame.midY);
//        self.addChild(button)
        
        let border = SKNode()
        
        let borderPhysicsbody = SKPhysicsBody(edgeLoopFrom: self.frame)
        borderPhysicsbody.friction = 0
        borderPhysicsbody.restitution = 1
        borderPhysicsbody.categoryBitMask = 0b0001
        borderPhysicsbody.collisionBitMask = 0b0001
        
        border.physicsBody = borderPhysicsbody
        self.addChild(border)
        
        self.paddleWidth = 150
        self.lost = false
        self.won = false
        self.score = (0, 0)
        
        self.scoreLabel = SKLabelNode(fontNamed: "ArialMT")
        if let scoreLabel = scoreLabel {
            scoreLabel.fontSize = 35
            scoreLabel.numberOfLines = 2
            scoreLabel.fontColor = .white
            scoreLabel.position = CGPoint(x: 0, y: 0)
            scoreLabel.alpha = 0.0
            scoreLabel.zPosition = 5
            scoreLabel.run(SKAction.fadeIn(withDuration: 2.0))
            self.addChild(scoreLabel)
        }
        
        let logoLabel = SKLabelNode()
        logoLabel.fontSize = 35
        logoLabel.fontColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.5)
        logoLabel.text = "C̵̗̘͒͊̆̆͒̽̆̄̀̿̓̍̎͜͝͝ũ̴̯̗͙͕̰͙̫̌̒̓̈́̀̏́̌r̷̛̭̲̳͚̈̀̓̆̆́͂̔͑͑s̵̩͔̦̔͋̏͌͊͊̐̓̈́̈̌͌͘̚ȇ̸̟̺̒̈ḓ̸̨̧̳̣̺̯͋͛͊͐̏͊̚͜ ̵͖̗̭͒̓͂̍̈́̀̍̕͠P̸̡̥͎̳̖̈́͌̾̈̒͆͋̏̚̚ơ̵̧̦̮͍̘̹̪͇͑̌̂̉̓̈n̵̢̜̦͎̟̬̖̭͂̍́̄̐̌͛̀͌g̷̢̮͚̝̞̀̋̈́̏̂̎͂͝"
        logoLabel.numberOfLines = 1
        logoLabel.position = CGPoint(x: 0, y: 200)
        logoLabel.zPosition = 5
        logoLabel.run(SKAction.fadeIn(withDuration: 2.0))
        self.addChild(logoLabel)
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
            paddle.shapeNode.run(SKAction.moveTo(x: pos.x, duration: 0))
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
    
    
    func resetGame() {
        self.ball!.shapeNode.run(SKAction.removeFromParent())
        self.ball = Ball()
        self.addChild(ball!.shapeNode)
    }
    
    override func update(_ currentTime: TimeInterval) {
        print(score)
        if let aiPlayer = self.aiPlayer {
            aiPlayer.update(xPositionDifference: ball!.shapeNode.position.x - aiPlayer.shapeNode.position.x)
//            aiPlayer.physicsBody.velocity.dx = aiPlayer.aiSpeed * 30
            aiPlayer.shapeNode.position.x += aiPlayer.physicsBody.velocity.dx
            aiPlayer.shapeNode.run(SKAction.moveTo(x: self.ball!.shapeNode.position.x,duration: 0.2))
        }
        
        if let ball = self.ball {
            if ball.shapeNode.position.y < player!.shapeNode.position.y {
                // Call reset & lose
                score!.1 += 1
                resetGame()
                self.scoreLabel!.text = "You: \(score!.0) \nOpponent: \(score!.1)"
            }
            
            if ball.shapeNode.position.y > aiPlayer!.shapeNode.position.y {
                // Call reset & win
                score!.0 += 1
                resetGame()
                self.scoreLabel!.text = "You: \(score!.0) \nOpponent: \(score!.1)"
            }
        }
        
        // Called before each frame is rendered
    }
}
