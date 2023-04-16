//
//  MainPage.swift
//  RockPaperScissors
//
//  Created by Manarbek Bibit on 14.04.2023.
//

import SwiftUI

struct MainPage: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("rpsBG")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Welcome to the game!")
                        .foregroundColor(Color.white)
                        .font(.system(size: 54, weight: .bold))
                        .multilineTextAlignment(.center)
                    Spacer()
                    NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)) {
                        CustomButton(title: "Single Player")
                    }
                    NavigationLink(destination: MultiPlayer().navigationBarBackButtonHidden(true)) {
                        CustomButton(title: "Multi Player")
                    }
                }
                .padding(.top, 122)
                .padding(.bottom, 40)
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
