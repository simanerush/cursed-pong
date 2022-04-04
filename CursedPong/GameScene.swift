//
//  GameScene.swift
//  Pong
//
//  Created by Sima Nerush on 4/3/22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
//    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    private var player: SKShapeNode?
    private var aiPlayer: SKShapeNode?
    private var ball: SKShapeNode?
    private var gamePhysics : SKPhysicsBody?
    private var ballIsGoingUp: Bool?
    
    override func didMove(to view: SKView) {
        
        // Get label node from scene and store it for use later
//        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
//        if let label = self.label {
//            label.alpha = 0.0
//            label.run(SKAction.fadeIn(withDuration: 2.0))
//        }
        
        // Create shape node to use during mouse interaction
        let w = (self.size.width + self.size.height) * 0.05
        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
        
        if let spinnyNode = self.spinnyNode {
            spinnyNode.lineWidth = 2.5
            
            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                              SKAction.fadeOut(withDuration: 0.5),
                                              SKAction.removeFromParent()]))
        }
        
        self.player = SKShapeNode.init(rectOf: CGSize(width: 250, height: 50))
        if let rect = self.player {
            rect.fillColor = SKColor.white
            rect.position = CGPoint(x: 0, y: self.frame.minY + rect.frame.height * 1.5)
            self.addChild(rect)
        }
        
        self.aiPlayer = SKShapeNode.init(rectOf: CGSize(width: 250, height: 50))
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
            ballPhysics.velocity = CGVector(dx: Int.random(in: 100...500), dy: Int.random(in: 100...500))
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
    
    
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
        
        if let rect = self.player {
            rect.position = CGPoint(x: pos.x, y: self.frame.minY + rect.frame.height * 1.5)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
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
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        if let ball = self.ball {
        
            if ball.position.x > self.frame.maxX - ball.frame.size.width || ball.position.x < self.frame.minX + ball.frame.size.width{
                ball.physicsBody!.velocity.dx *= -1
            }
            if ball.position.y > self.frame.maxY - ball.frame.size.height{
                ball.physicsBody!.velocity.dy *= -1
            }
            if ball.position.y < self.player!.position.y + ball.frame.height && ball.position.x > self.player!.position.x - self.player!.frame.width && ball.position.x < self.player!.position.x + self.player!.frame.width && !self.ballIsGoingUp! {
                ball.physicsBody!.velocity.dy *= -1
                ball.physicsBody!.velocity.dx = abs(ball.position.x - player!.position.x)/1
                self.ballIsGoingUp = true
            }
            if ball.position.y > self.aiPlayer!.position.y - ball.frame.height && ball.position.x > self.aiPlayer!.position.x - self.aiPlayer!.frame.width && ball.position.x < self.aiPlayer!.position.x + self.aiPlayer!.frame.width  && self.ballIsGoingUp! {
                ball.physicsBody!.velocity.dy *= -1
                ball.physicsBody!.velocity.dx = abs(ball.position.x - aiPlayer!.position.x)/1
                self.ballIsGoingUp = false
            }
        }
        if let player2 = self.aiPlayer {
            player2.physicsBody!.velocity.dx = -player2.position.x + self.ball!.position.x
        }
        // Called before each frame is rendered
    }
}
