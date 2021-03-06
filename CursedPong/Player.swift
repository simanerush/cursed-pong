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
    var width: Double
    var scale: Double
    var height: Double
    var delay: Double
    
    init(yPosition: Double) {
        self.yPosition = yPosition
        self.width = 500
        self.scale = 1
        self.height = 30
        self.delay = 3
        let playerShapeNode = SKShapeNode(rectOf: CGSize.init(width: self.width, height: self.height))
        playerShapeNode.position = CGPoint(x : 0, y : self.yPosition)
        playerShapeNode.fillColor = .white
        playerShapeNode.zPosition = 10
        self.shapeNode = playerShapeNode
        
        let playerPhysicsBody = SKPhysicsBody(rectangleOf: CGSize.init(width: self.width, height: self.height))
        playerPhysicsBody.affectedByGravity = false
        playerPhysicsBody.restitution = 1
        playerPhysicsBody.isDynamic = false
        playerPhysicsBody.mass = 100
        playerPhysicsBody.categoryBitMask = 0b0001
        playerPhysicsBody.friction = 0
        self.physicsBody = playerPhysicsBody
        self.shapeNode.physicsBody = self.physicsBody
        
    }
    
    func changeWidth(by value: Double) {
        shapeNode.xScale = value
        physicsBody.node!.xScale = value
    }
}
