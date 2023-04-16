//
//  PassToOponentView.swift
//  RockPaperScissors
//
//  Created by Manarbek Bibit on 16.04.2023.
//

import SwiftUI

struct PassToOponentView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var multiplyScreenState: ScreenState
    @Binding var multiRound: Int
    var body: some View {
        VStack{
            HeaderText(text: "Pass the \nphone to your \nopponent")
                .multilineTextAlignment(.center)
            Spacer()
            CustomButton(title: "Ready to continue")
                .onTapGesture {
                    multiplyScreenState = .showOponent
                }
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
