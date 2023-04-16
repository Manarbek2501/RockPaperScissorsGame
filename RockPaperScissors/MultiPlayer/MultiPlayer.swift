//
//  MultiPlayer.swift
//  RockPaperScissors
//
//  Created by Manarbek Bibit on 14.04.2023.
//

import SwiftUI

struct MultiPlayer: View {
    
    @State var multiplyScreenState: ScreenState = .choose
    @State var multiplySelfChoise: Choices = .none
    @State var multiplyOponentChoice: Choices = .none
    @State var multiRound: Int = 1
    @State var firstPlayerScore: Int = 0
    @State var secondPlayerScore: Int = 0
    
    var body: some View {
        switch multiplyScreenState {
        case .choose:
            FirstPlayerChooseView(multiplySelfChoice: $multiplySelfChoise, multiplyScreenState: $multiplyScreenState, firstPlayerScore: $firstPlayerScore, secondPlayerScore: $secondPlayerScore, multiRound: $multiRound)
        case .change:
            MultiplyChangeChooseView(multiplyChoice: $multiplySelfChoise, multiplyScreenState: $multiplyScreenState, firstPlayerScore: $firstPlayerScore, secondPlayerScore: $secondPlayerScore, multiRound: $multiRound)
        case .oponentChoose:
            PassToOponentView(multiplyScreenState: $multiplyScreenState, multiRound: $multiRound)
        case .showOponent:
            SecondPlayerChooseView(multiplyOponentChoice: $multiplyOponentChoice, multiplyScreenState: $multiplyScreenState, firstPlayerScore: $firstPlayerScore, secondPlayerScore: $secondPlayerScore, multiRound: $multiRound)
        case .gameView:
            MultiplayGameView(multiplySelfChoice: $multiplySelfChoise, multiplyOponentChoice: $multiplyOponentChoice, multiScreenState: $multiplyScreenState, firstPlayerScore: $firstPlayerScore, secondPlayerScore: $secondPlayerScore, multiRound: $multiRound)
        }
    }
}

struct MultiPlayer_Previews: PreviewProvider {
    static var previews: some View {
        MultiPlayer()
    }
}
