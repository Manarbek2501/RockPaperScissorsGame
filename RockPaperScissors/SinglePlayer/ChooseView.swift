//
//  ChooseView.swift
//  RockPaperScissors
//
//  Created by Manarbek Bibit on 16.04.2023.
//

import SwiftUI

struct ChooseView: View {
    @Environment(\.presentationMode) var presentMode
    @Binding var selfChoice: Choices
    @Binding var screenState: ScreenState
    @Binding var playerScore: Int
    @Binding var computerScore: Int
    @Binding var round: Int
    var body: some View {
        VStack {
            VStack {
               HeaderText(text: "Take your pick")
                Text("Score \(playerScore):\(computerScore)")
                    .foregroundColor(Color(CGColor(red: 0.404, green: 0.314, blue: 0.643, alpha: 1)))
                    .font(.system(size: 17, weight: .medium))
            }
            Spacer()
            VStack(spacing: 24) {
                CapsuleWithImage(image: "Rock")
                .onTapGesture {
                    selfChoice = .rock
                    screenState = .change
                }
               CapsuleWithImage(image: "Paper")
                .onTapGesture {
                    selfChoice = .paper
                    screenState = .change
                }
                CapsuleWithImage(image: "Scissors")
                .onTapGesture {
                    selfChoice = .scissors
                    screenState = .change
                }
            }
            .padding([.leading, .trailing], 8)
        }
        .padding(.top, 32)
        .padding([.leading, .trailing], 16)
        .padding(.bottom, 100)
        .navigationTitle("Round#\(round)").font(.custom("SFProDisplay-BlackItalic", size: 17))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentMode.wrappedValue.dismiss()
                } ) {
                    Image(systemName: "chevron.backward")
                        .font(.custom("SFProDisplay-Medium", size: 23))
                        .foregroundColor(Color(CGColor(red: 0.404, green: 0.314, blue: 0.643, alpha: 1)))
                }.frame(width: 18, height: 24)
            }
        }
    }
}

