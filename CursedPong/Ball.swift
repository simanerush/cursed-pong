//
//  Ball.swift
//  CursedPong
//
//  Created by Harrison N on 4/5/22.
//

import Foundation
import SpriteKit

class Ball {
    
    var shapeNode: SKShapeNode
    var physicsBody: SKPhysicsBody
    var sensitivity: Double
    
    init() {
        self.sensitivity = 3
        self.shapeNode = SKShapeNode(circleOfRadius: 30)
        self.physicsBody = SKPhysicsBody()
        self.physicsBody.velocity = CGVector(dx: Int.random(in: 100...500), dy: Int.random(in: 500...1000))
        
        if self.shapeNode.position.x > 30 {
            self.physicsBody.velocity.dx = self.physicsBody.velocity.dx * -1
        }
        
        self.physicsBody.affectedByGravity = false
        self.physicsBody.linearDamping = 0
        
        self.shapeNode.name = "ball"
        self.shapeNode.fillColor = .blue
        self.shapeNode.position = CGPoint(x:0,y:0)
        self.shapeNode.physicsBody = self.physicsBody
    }
    
    func update() {
        
    }
    
}
