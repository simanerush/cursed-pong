//
//  CursedMenuView.swift
//  CursedPong
//
//  Created by Harrison N on 4/7/22.
//

import SwiftUI
import SpriteKit

struct CursedMenuView: View {
    @State var ballColor = Color.blue
    @State var colorPickerTapped = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray.edgesIgnoringSafeArea(.all)
                VStack {
                    NavigationLink(destination:  BallColorPickerView(ballColor: $ballColor), isActive: $colorPickerTapped, label: {})
                    Spacer()
                    NavigationLink(destination: CursedPong(ballColor: UIColor(ballColor))
                        .navigationBarTitleDisplayMode(.inline).edgesIgnoringSafeArea(.all)) {
                            Text("Play Cursed Pong").modifier(CursedTextModifier())
                        }
                        .foregroundStyle(.green)
                    Spacer()
                    Button {
                       colorPickerTapped = true
                    } label: {
                        Text("Change ball color")
                            .modifier(CursedTextModifier())
                    }
                    
                    Spacer()
                    VStack {
                        Text("Made by Sima and Harrison").font(.caption)
                        Text("➰ Music by Aadit ➰").font(.caption)
                    }
                }
                
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
        .navigationViewStyle(.stack)
        
    }
}

struct CursedPong: UIViewRepresentable {
    var ballColor: UIColor
    
    func makeUIView(context: Context) -> SKView {
        let sceneView = SKView()
            if let scene = GameScene(fileNamed: "GameScene") {
              sceneView.showsNodeCount = false
              sceneView.showsFPS = false
                scene.scaleMode = .aspectFill
              sceneView.presentScene(scene)
            }
        return sceneView
    }
    func updateUIView(_ uiView: SKView, context: Context) {
        
    }
}

struct CursedTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(Color.green)
        
    }
}

struct CursedMenuView_Previews: PreviewProvider {
    static var previews: some View {
        CursedMenuView()
    }
}
