//
//  HeaderText.swift
//  RockPaperScissors
//
//  Created by Manarbek Bibit on 16.04.2023.
//

import SwiftUI

struct HeaderText: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.system(size: 54, weight: .bold))
    }
}


