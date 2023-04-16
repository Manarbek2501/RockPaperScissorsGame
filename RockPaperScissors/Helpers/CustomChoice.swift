//
//  CustomChoice.swift
//  RockPaperScissors
//
//  Created by Manarbek Bibit on 15.04.2023.
//

import SwiftUI

enum GameOutput {
    case win, lose, tie, none
    
    var mark: String {
        switch self {
        case .win:
            return "Win!"
        case .lose:
            return "Lose"
        case .tie:
            return "Tie!"
        case .none:
            return " "
        }
    }
}

enum ScreenState {
    case choose
    case change
    case oponentChoose
    case showOponent
    case gameView
}

enum Choices:String, CaseIterable {
    case paper = "paper"
    case rock = "rock"
    case scissors = "scissors"
    case none = " "
    
    static func random() -> Choices {
        let random: [Choices] = [.paper, .rock, .scissors]
        let randomIndex = Int(arc4random()) % random.count
        return random[randomIndex]
        }
    
    var choiceName: String {
        switch self {
        case .paper:
            return "Paper"
        case .rock:
            return "Rock"
        case .scissors:
            return "Scissors"
        case .none:
            return ""
        }
    }
    
    var image: Image {
        switch self {
        case .paper:
            return Image("Paper")
        case .rock:
            return Image("Rock")
        case .scissors:
            return Image("Scissors")
        case .none:
            return Image(" ")
        }
    }
}
