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
        self.physicsBody = SKPhysicsBody(circleOfRadius: 30)
        self.physicsBody.velocity = CGVector(dx: 0, dy: -1000)
        self.physicsBody.mass = 0.00
        self.physicsBody.collisionBitMask = 0b0001
        self.physicsBody.friction = 0
        if self.shapeNode.position.x > 30 {
            self.physicsBody.velocity.dx = self.physicsBody.velocity.dx * -1
        }
        
        self.physicsBody.affectedByGravity = false
        self.physicsBody.linearDamping = 0
        self.physicsBody.restitution = 1
        
        self.shapeNode.name = "ball"
        self.shapeNode.fillColor = .blue
        self.shapeNode.position = CGPoint(x:0,y:0)
        self.shapeNode.physicsBody = self.physicsBody
    }
    
    func update() {
        
    }
    
}
