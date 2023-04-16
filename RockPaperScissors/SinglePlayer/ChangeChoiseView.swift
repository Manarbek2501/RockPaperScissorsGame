//
//  ChangeChoiseView.swift
//  RockPaperScissors
//
//  Created by Manarbek Bibit on 16.04.2023.
//

import SwiftUI

struct ChangeChoiseView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var choice: Choices
    @Binding var screenState: ScreenState
    @Binding var playerScore: Int
    @Binding var computerScore: Int
    @Binding var round: Int
    var body: some View {
        VStack {
            VStack {
                HeaderText(text: "Your pick")
                Text("Score \(playerScore):\(computerScore)")
                    .foregroundColor(Color(CGColor(red: 0.404, green: 0.314, blue: 0.643, alpha: 1)))
                    .font(.system(size: 17, weight: .medium))
            }
            Spacer()
            ZStack(content: {
                Capsule()
                    .fill(Color(CGColor(red: 0.953, green: 0.949, blue: 0.973, alpha: 1)))
                    .frame(height: 128)
                Text("\(choice.image)")
                    .frame(height: 80)
            })
            Spacer()
            CustomButton(title: "I changed my mind")
                .onTapGesture {
                    screenState = .choose
                }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                screenState = .oponentChoose
            }
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
