//
//  Player.swift
//  CursedPong
//
//  Created by Harrison N on 4/5/22.
//

import Foundation
import SpriteKit

class Player {
    
    var shapeNode: SKShapeNode
    var physicsBody: SKPhysicsBody
    let yPosition: Double
    
    init(yPosition: Double) {
        self.yPosition = yPosition
        var playerShapeNode = SKShapeNode(rectOf: CGSize.init(width:30,height:30))
        playerShapeNode.position = CGPoint(x : 0, y : self.yPosition)
        self.shapeNode = playerShapeNode
        
        var playerPhysicsBody = SKPhysicsBody()
        playerPhysicsBody.affectedByGravity = false
        playerPhysicsBody.linearDamping = 0
        playerPhysicsBody.restitution = 1
        self.physicsBody = playerPhysicsBody
        
    }
    
}
