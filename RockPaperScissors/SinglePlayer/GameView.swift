//
//  GameView.swift
//  RockPaperScissors
//
//  Created by Manarbek Bibit on 16.04.2023.
//

import SwiftUI

struct GameView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var selfChoice: Choices
    @Binding var oponentChoice: Choices
    @Binding var screenState: ScreenState
    @Binding var playerScore: Int
    @Binding var computerScore: Int
    @Binding var round: Int
    @State var winner = " "
    
    func determineWinner() -> GameOutput {
//        guard let selfChoise = selfChoice, let oponentChoice = oponentChoice else { return .none }
            if selfChoice == oponentChoice {
                return .tie
            } else if selfChoice == .rock && oponentChoice == .scissors ||
                      selfChoice == .scissors && oponentChoice == .paper ||
                      selfChoice == .paper && oponentChoice == .rock {
                playerScore += 1
                return .win
            } else {
                computerScore += 1
                return .lose
            }
        }
    
    var body: some View {
        VStack {
            VStack {
                HeaderText(text: "\(winner)")
                    .foregroundStyle(
                        LinearGradient(colors: [.yellow, .red], startPoint: .leading, endPoint: .trailing)
                    )
                Text("Score \(playerScore):\(computerScore)")
                    .foregroundColor(Color(CGColor(red: 0.404, green: 0.314, blue: 0.643, alpha: 1)))
                    .font(.system(size: 17, weight: .medium))
                Spacer()
                VStack{
                    ZStack(content: {
                        Capsule()
                            .fill(Color(CGColor(red: 0.953, green: 0.949, blue: 0.973, alpha: 1)))
                            .frame(width: 198 ,height: 128)
                        Text("\(selfChoice.image)")
                            .frame(height: 80)
                    })
                    ZStack(content: {
                        Capsule()
                            .fill(Color(CGColor(red: 0.953, green: 0.949, blue: 0.973, alpha: 1)))
                            .frame( width: 198 ,height: 128)
                        Text("\(oponentChoice.image)")
                            .frame(height: 80)
                    })
                }
                .padding([.leading, .trailing], 8)
                Spacer()
                CustomButton(title: "Another round")
                    .onTapGesture {
                        screenState = .choose
                        round += 1
                    }
            }
            .onAppear{
                winner = determineWinner().mark
            }
            .padding(.top, 32)
            .padding([.leading, .trailing], 16)
            .navigationTitle("Round#\(round)").font(.custom("SFProDisplay-BlackItalic", size: 17))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    } ) {
                        Image(systemName: "chevron.backward")
                            .font(.custom("SFProDisplay-Medium", size: 23))
                            .foregroundColor(Color(CGColor(red: 0.404, green: 0.314, blue: 0.643, alpha: 1)))
                    }.frame(width: 18, height: 24)
                }
            }
        }
    }
}
