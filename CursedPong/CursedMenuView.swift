//
//  CursedMenuView.swift
//  CursedPong
//
//  Created by Harrison N on 4/7/22.
//

import SwiftUI
import SpriteKit

struct CursedMenuView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray.edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    NavigationLink(destination: CursedPong()
                        .navigationBarTitleDisplayMode(.inline).edgesIgnoringSafeArea(.all)) {
                            Text("Play Cursed Pong").modifier(CursedTextModifier())
                        }
                        .foregroundStyle(.green)
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Leaderboard").modifier(CursedTextModifier())
                    }
                    Spacer()
                }
                
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
        .navigationViewStyle(.stack)
        
    }
}

struct CursedPong: UIViewRepresentable {
    func makeUIView(context: Context) -> SKView {
        let sceneView = SKView()
            if let scene = GameScene(fileNamed: "GameScene") {
              sceneView.showsNodeCount = true
              sceneView.showsFPS = true
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
