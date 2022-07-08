//
//  BallColorPickerView.swift
//  CursedPong
//
//  Created by Sima Nerush on 7/7/22.
//

import SwiftUI

struct BallColorPickerView: View {
    @Binding var ballColor: Color
    
    var body: some View {
        ZStack {
            Color.gray.edgesIgnoringSafeArea(.all)
            VStack {
                Text("Pick a color for the ball")
                    .modifier(CursedTextModifier())
                ColorPicker("Pick a color for the ball", selection: $ballColor)
                    .labelsHidden()
                    .scaleEffect(CGSize(width: 2, height: 2))
            }
        }
    }
}

struct BallColorPickerView_Previews: PreviewProvider {
    static var previews: some View {
        BallColorPickerView(ballColor: .constant(.red))
    }
}
