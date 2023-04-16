//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Manarbek Bibit on 14.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var screenState: ScreenState = .choose
    @State var selfChoice: Choices = .none
    @State var oponentChoice: Choices = .none
    @State var round: Int = 1
    @State var playerScore: Int = 0
    @State var computerScore: Int = 0
    
    var body: some View {
        switch screenState {
        case .choose:
            ChooseView(selfChoice: $selfChoice, screenState: $screenState, playerScore: $playerScore, computerScore: $computerScore, round: $round)
        case .change:
            ChangeChoiseView(choice: $selfChoice, screenState: $screenState, playerScore: $playerScore, computerScore: $computerScore, round: $round)
        case .oponentChoose:
            OponentThinksView(oponentChoose: $oponentChoice, screenState: $screenState, round: $round)
        case .showOponent:
            OponentChoice(oponentChoice: $oponentChoice, screenState: $screenState, round: $round)
        case .gameView:
            GameView(selfChoice: $selfChoice, oponentChoice: $oponentChoice, screenState: $screenState, playerScore: $playerScore, computerScore: $computerScore, round: $round)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
