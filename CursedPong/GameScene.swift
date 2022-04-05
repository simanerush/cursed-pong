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
    private var player: SKShapeNode?
    private var aiPlayer: SKShapeNode?
    private var ball: SKShapeNode?
    private var gamePhysics : SKPhysicsBody?
    private var ballIsGoingUp : Bool?
    
    private var paddleWidth : Int?
    private var ballSensitivity : Double?
    private var aiSpeed : Double?
    
    private var won : Bool?
    private var lost : Bool?
    
    
//    init(player: SKShapeNode?,
//         aiPlayer: SKShapeNode?,
//         ball: SKShapeNode?,
//         gamePhysics: SKPhysicsBody?,
//         ballIsGoingUp: Bool?,
//         paddleWidth: Int?,
//         ballSensitivity: Double?,
//         aiSpeed: Double?,
//         won: Bool,
//         lost: Bool)
//    {
//        self.player = player
//        self.aiPlayer = aiPlayer
//        self.ball = ball
//        self.gamePhysics = gamePhysics
//        self.ballIsGoingUp = ballIsGoingUp
//        self.aiSpeed = aiSpeed
//        self.won = won
//        self.lost = lost
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
    override func didMove(to view: SKView) {
// Create a simple red rectangle that's 100x44
        button = SKSpriteNode(color: .red, size: CGSize(width: 100, height: 44))
        // Put it in the center of the scene
        button.position = CGPoint(x:self.frame.midX, y:self.frame.midY);
        self.addChild(button)

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
        
        self.player = SKShapeNode.init(rectOf: CGSize(width: self.paddleWidth!, height: 50))
        if let rect = self.player {
            rect.fillColor = SKColor.white
            rect.position = CGPoint(x: 0, y: self.frame.minY + rect.frame.height * 1.5)
            self.addChild(rect)
        }
        
        self.aiPlayer = SKShapeNode.init(rectOf: CGSize(width: self.paddleWidth!, height: 50))
        if let rect = self.aiPlayer {
            let aiPhysics = SKPhysicsBody()
            aiPhysics.affectedByGravity = false
            aiPhysics.linearDamping = 0
            rect.physicsBody = aiPhysics
            
            rect.fillColor = SKColor.white
            rect.position = CGPoint(x: 0, y: self.frame.maxY - rect.frame.height * 2.5)
            self.addChild(rect)
            
        }
        
        // Create a ball
        self.ball = SKShapeNode.init(circleOfRadius: 30)
        if let ball = self.ball {
            let ballPhysics = SKPhysicsBody()
            ballPhysics.velocity = CGVector(dx: Int.random(in: 100...500), dy: Int.random(in: 500...1000))
            if ballPhysics.velocity.dy > 0 {
                self.ballIsGoingUp = true
            } else {
                self.ballIsGoingUp = false
            }
            
            if ball.position.x > 30 {
                ballPhysics.velocity.dx = ballPhysics.velocity.dx * -1
            }
            
            ballPhysics.affectedByGravity = false
            ballPhysics.linearDamping = 0
            
            ball.name = "ball"
            ball.fillColor = .blue
            ball.position = CGPoint(x:0,y:0)
            ball.physicsBody = ballPhysics
            self.addChild(ball)
        }
    }
    
    func goToGameScene(){
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
        
        if let rect = self.player {
            rect.position = CGPoint(x: pos.x, y: self.frame.minY + rect.frame.height * 1.5 + 100)
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
            let location = touch.location(in: self)
            // Check if the location of the touch is within the button's bounds
            if button.contains(location) {
                self.won! = true
            }
        }
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        self.ballSensitivity = 10
        //Check if off screen:
        if self.ball!.position.y > self.frame.maxY {
            self.won = true
        }else if ball!.position.y < self.frame.minY {
            self.lost = true
        }
        
        if let ball = self.ball{
            if !self.won! && !self.lost!{
            
                if ball.position.x > self.frame.maxX - ball.frame.size.width * 1.5 || ball.position.x < self.frame.minX + ball.frame.size.width * 1.5 {
                    ball.physicsBody!.velocity.dx *= -1
                }
                
                if ball.position.y > self.frame.maxY - ball.frame.size.height{
                    ball.physicsBody!.velocity.dy *= -1
                }
                
                if ball.position.y < self.player!.position.y + ball.frame.height && ball.position.x > self.player!.position.x - self.player!.frame.width && ball.position.x < self.player!.position.x + self.player!.frame.width && !self.ballIsGoingUp! {
                    ball.physicsBody!.velocity.dy *= -1
                    ball.physicsBody!.velocity.dx = (ball.position.x - player!.position.x) * self.ballSensitivity!
                    self.ballIsGoingUp = true
                }
                
                if ball.position.y > self.aiPlayer!.position.y + ball.frame.height && ball.position.x > self.aiPlayer!.position.x - self.aiPlayer!.frame.width && ball.position.x < self.aiPlayer!.position.x + self.aiPlayer!.frame.width  && self.ballIsGoingUp! {
                    ball.physicsBody!.velocity.dy *= -1
                    ball.physicsBody!.velocity.dx = (ball.position.x - aiPlayer!.position.x) * 5
                    self.ballIsGoingUp = false
                }
            }else {
                goToGameScene()
                self.won = false
                self.lost = false
            }
        }
        if let player2 = self.aiPlayer {
            self.aiSpeed = 0.2
            let distanceToBall = self.ball!.position.x - player2.position.x
            player2.physicsBody!.velocity.dx = distanceToBall * self.aiSpeed!
        }
        // Called before each frame is rendered
    }
}

