//
//  Opponent.swift
//  CursedPong
//
//  Created by Harrison N on 4/5/22.
//

import Foundation
class Opponent : Player {
    var aiSpeed: Double
    init(yPosition: Double, aiSpeed: Double) {
        self.aiSpeed = aiSpeed
        super.init(yPosition: yPosition)
        
    }
}
