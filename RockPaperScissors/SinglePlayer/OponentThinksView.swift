//
//  OponentThinksView.swift
//  RockPaperScissors
//
//  Created by Manarbek Bibit on 16.04.2023.
//

import SwiftUI

struct OponentThinksView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var oponentChoose: Choices
    @Binding var screenState: ScreenState
    @Binding var round: Int
    @State private var isRotating = 0.0
    var body: some View {
        VStack {
            HeaderText(text: "Your \nopponent is \nthinking")
                .multilineTextAlignment(.center)
            Spacer()
            ZStack(content: {
                Capsule()
                    .fill(Color(CGColor(red: 0.953, green: 0.949, blue: 0.973, alpha: 1)))
                    .frame(height: 128)
                Image(systemName: "bonjour")
                    .foregroundColor(Color(CGColor(red: 0.404, green: 0.314, blue: 0.643, alpha: 1)))
                    .font(.system(size: 50))
                    .rotationEffect(.degrees(isRotating))
                    .onAppear {
                        withAnimation(.linear(duration: 1)
                            .speed(0.1).repeatForever(autoreverses: false)) {
                                isRotating = 360.0
                            }
                    }
            })
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                    oponentChoose = .random()
                    screenState = .showOponent
                }
            }
            .padding(.bottom, 120)
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
