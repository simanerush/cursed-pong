//
//  Opponent.swift
//  CursedPong
//
//  Created by Harrison N on 4/5/22.
//

import Foundation
import SpriteKit

class Opponent : Player {
    var aiSpeed: Double
    init(yPosition: Double, aiSpeed: Double) {
        self.aiSpeed = aiSpeed
        super.init(yPosition: yPosition)
        
    }
    func update(xPositionDifference: Double) {
        self.physicsBody.velocity.dx = self.aiSpeed * xPositionDifference
    }
}
