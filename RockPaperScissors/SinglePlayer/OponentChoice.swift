//
//  OponentChoice.swift
//  RockPaperScissors
//
//  Created by Manarbek Bibit on 16.04.2023.
//

import SwiftUI

struct OponentChoice: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var oponentChoice: Choices
    @Binding var screenState: ScreenState
    @Binding var round: Int
    var body: some View {
        VStack {
            HeaderText(text: "Your \nopponent’s \npick")
                .multilineTextAlignment(.center)
            Spacer()
            ZStack(content: {
                Capsule()
                    .fill(Color(CGColor(red: 0.953, green: 0.949, blue: 0.973, alpha: 1)))
                    .frame(height: 128)
                Text("\(oponentChoice.image)")
                    .frame(height: 80)
            })
            .padding(.bottom, 120)
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    screenState = .gameView
                }
            }
            Spacer()
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
