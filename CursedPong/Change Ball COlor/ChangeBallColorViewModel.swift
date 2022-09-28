//
//  ChangeBallColorViewModel.swift
//  CursedPong
//
//  Created by Tyler Berrett on 9/27/22.
//

import Foundation
import SwiftUI

class ChangeBallColorViewModel: ObservableObject {
    
    private let defaults = UserDefaults.standard
    
    @Published var ballColor: UIColor
    
    init() {
        self.ballColor = defaults.getBallColor()
    }
    
    @Published var ballX: CGFloat = 0
    @Published var ballY: CGFloat = 0
    
    @Published var colors = [
        UIColor.red,
        UIColor.blue,
        UIColor.green,
        UIColor.yellow,
        UIColor.magenta,
        UIColor.brown,
        UIColor.cyan,
        UIColor.orange,
        UIColor.purple
    ].shuffled()
    
    
    func cursedAnimation() {
        withAnimation(.easeInOut(duration: 0.5).delay(0)) {
            ballX = CGFloat.random(in: -500...500)
            ballY = CGFloat.random(in: -500...500)
        }
        
        withAnimation(.easeInOut(duration: 0.6).delay(0.5)) {
            ballX = CGFloat.random(in: -500...500)
            ballY = CGFloat.random(in: -500...500)
        }
        
        withAnimation(.easeInOut(duration: 0.7).delay(1.0)) {
            ballX = CGFloat.random(in: -500...500)
            ballY = CGFloat.random(in: -500...500)
        }
        
        withAnimation(.easeInOut(duration: 0.8).delay(1.5)) {
            ballX = CGFloat.random(in: -500...500)
            ballY = CGFloat.random(in: -500...500)
        }
        
        withAnimation(.easeInOut(duration: 0.9).delay(2.0)) {
            ballX = 0
            ballY = 0
        }
        
    }
    
    
    func updateBallColor() {
        ballColor = colors.randomElement()!
        colors = colors.shuffled()
        defaults.setBallColor(color: colors.randomElement()!)
    }
    
    
    
    
}


extension UserDefaults {
    
    func getBallColor() -> UIColor {
        var color: UIColor = .blue
        guard let colorData = data(forKey: "BallColor") else {
            return color
        }
        
        do {
            color = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(colorData) as? UIColor ?? .blue
        } catch {
            print("Error UserDefaults")
        }
        
        return color
    }
    
    func setBallColor(color: UIColor) {
        var colorData: NSData?
        
        do {
            colorData = try NSKeyedArchiver.archivedData(
                withRootObject: color,
                requiringSecureCoding: false
            ) as NSData?
        } catch {
            print("Error UserDefaults")
        }
        
        set(colorData, forKey: "BallColor")
    }
    
}


