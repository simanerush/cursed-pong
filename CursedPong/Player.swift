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
        let playerShapeNode = SKShapeNode(rectOf: CGSize.init(width: 170, height: 40))
        playerShapeNode.position = CGPoint(x : 0, y : self.yPosition)
        playerShapeNode.fillColor = .white
        self.shapeNode = playerShapeNode
        
        let playerPhysicsBody = SKPhysicsBody(rectangleOf: CGSize.init(width: 170, height: 40))
        playerPhysicsBody.affectedByGravity = false
        playerPhysicsBody.restitution = 1
        playerPhysicsBody.isDynamic = false
        playerPhysicsBody.mass = 100
        playerPhysicsBody.categoryBitMask = 0b0001
        playerPhysicsBody.friction = 0
        self.physicsBody = playerPhysicsBody
        self.shapeNode.physicsBody = self.physicsBody
        
    }
    
}
