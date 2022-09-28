//
//  ChangeBallColorView.swift
//  CursedPong
//
//  Created by Tyler Berrett on 9/27/22.
//

import SwiftUI



struct ChangeBallColorView : View {
    
    @StateObject var viewModel = ChangeBallColorViewModel()
    
    var body: some View {
        ZStack {
            Color.gray.edgesIgnoringSafeArea(.all)
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.colors, id: \.self) { color in
                            Circle()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color(color))
                                .shadow(color: .gray, radius: 1, x: 0, y: 1)
                                .onTapGesture { viewModel.updateBallColor() }
                                
                        }
                    }
                    .padding()
                }
                
                Spacer()
                Text("P̷̧̢̛̮̯̳̝̪͍͇͒̄̄̓̉̀̾̀̎̇͌͠͝r̶̲͖̀̓̎̊̑̈́͂́͘ḙ̸̯̩̓̏̒͘v̶̻̝̖̻̤̻̗̄̾͛̓̑̅͛̀̕͠ȉ̸͖̱̟̰̠͍̺̣͎̩͙͊̊̊é̵̞͑̚ẁ̵̙̯͇̘̫̿͒́̾̉̔͛̅͑̋͝͝")
                    .font(.largeTitle)
                Circle()
                    .fill(Color(viewModel.ballColor))
                    .padding()
                    .offset(x: viewModel.ballX, y: viewModel.ballY)
                    .onTapGesture { viewModel.cursedAnimation() }
                Spacer()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        
        
        
    }
    
}
