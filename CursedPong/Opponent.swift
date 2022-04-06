//
//  Opponent.swift
//  CursedPong
//
//  Created by Harrison N on 4/5/22.
//

import Foundation
class Opponent : Player {
    var aiSpeed: Double
    init(yPosition: Double, aiSpeed: Double){
        super.init(yPosition: yPosition)
        self.aiSpeed = aiSpeed
    }
}
