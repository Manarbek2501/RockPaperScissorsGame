//
//  FirstPlayerChooseView.swift
//  RockPaperScissors
//
//  Created by Manarbek Bibit on 16.04.2023.
//

import SwiftUI

struct FirstPlayerChooseView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var multiplySelfChoice: Choices
    @Binding var multiplyScreenState: ScreenState
    @Binding var firstPlayerScore: Int
    @Binding var secondPlayerScore: Int
    @Binding var multiRound: Int
    var body: some View {
        VStack {
            VStack {
                HeaderText(text: "Take your pick")
                Text("Player 1 • Score \(firstPlayerScore):\(secondPlayerScore)")
                    .foregroundColor(Color(CGColor(red: 0.404, green: 0.314, blue: 0.643, alpha: 1)))
                    .font(.system(size: 17, weight: .medium))
            }
            Spacer()
            VStack(spacing: 24) {
               CapsuleWithImage(image: "Rock")
                .onTapGesture {
                    multiplySelfChoice = .rock
                    multiplyScreenState = .change
                }
                CapsuleWithImage(image: "Paper")
                .onTapGesture {
                    multiplySelfChoice = .paper
                    multiplyScreenState = .change
                }
                CapsuleWithImage(image: "Scissors")
                .onTapGesture {
                    multiplySelfChoice = .scissors
                    multiplyScreenState = .change
                }
            }
            .padding([.leading, .trailing], 8)
        }
        .padding(.top, 32)
        .padding([.leading, .trailing], 16)
        .padding(.bottom, 100)
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
