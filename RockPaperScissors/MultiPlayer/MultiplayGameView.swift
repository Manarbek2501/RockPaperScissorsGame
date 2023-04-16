//
//  MultiplayGameView.swift
//  RockPaperScissors
//
//  Created by Manarbek Bibit on 16.04.2023.
//

import SwiftUI

struct MultiplayGameView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var multiplySelfChoice: Choices
    @Binding var multiplyOponentChoice: Choices
    @Binding var multiScreenState: ScreenState
    @Binding var firstPlayerScore: Int
    @Binding var secondPlayerScore: Int
    @Binding var multiRound: Int
    @State var multiplyWinner = " "
    
    func multiplyDetermineWinner() -> GameOutput {
        if multiplySelfChoice == multiplyOponentChoice {
            return .tie
        } else if multiplySelfChoice == .rock && multiplyOponentChoice == .scissors ||
                    multiplySelfChoice == .scissors && multiplyOponentChoice == .paper ||
                    multiplySelfChoice == .paper && multiplyOponentChoice == .rock {
            firstPlayerScore += 1
            return .win
        } else {
            secondPlayerScore += 1
            return .lose
        }
    }
    
    var body: some View {
        VStack {
            VStack {
                HeaderText(text: "\(multiplyWinner)")
                    .foregroundStyle(
                        LinearGradient(colors: [.yellow, .red], startPoint: .leading, endPoint: .trailing)
                    )
                Text("Score \(firstPlayerScore):\(secondPlayerScore)")
                    .foregroundColor(Color(CGColor(red: 0.404, green: 0.314, blue: 0.643, alpha: 1)))
                    .font(.system(size: 17, weight: .medium))
                Spacer()
                VStack{
                    ZStack(content: {
                        Capsule()
                            .fill(Color(CGColor(red: 0.953, green: 0.949, blue: 0.973, alpha: 1)))
                            .frame(width: 198 ,height: 128)
                        Text("\(multiplySelfChoice.image)")
                            .frame(height: 80)
                    })
                    ZStack(content: {
                        Capsule()
                            .fill(Color(CGColor(red: 0.953, green: 0.949, blue: 0.973, alpha: 1)))
                            .frame( width: 198 ,height: 128)
                        Text("\(multiplyOponentChoice.image)")
                            .frame(height: 80)
                    })
                }
                .padding([.leading, .trailing], 8)
                Spacer()
                CustomButton(title: "Another round")
                    .onTapGesture {
                        multiScreenState = .choose
                        multiRound += 1
                    }
            }
            .onAppear{
                multiplyWinner = multiplyDetermineWinner().mark
            }
            .padding(.top, 32)
            .padding([.leading, .trailing], 16)
            .navigationTitle("Round#\(multiRound)").font(.custom("SFProDisplay-BlackItalic", size: 17))
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
