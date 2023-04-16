//
//  Capsule.swift
//  RockPaperScissors
//
//  Created by Manarbek Bibit on 16.04.2023.
//

import SwiftUI

struct CapsuleWithImage: View {
    var image: String
    var body: some View {
        ZStack(content: {
            Capsule()
                .fill(Color(CGColor(red: 0.953, green: 0.949, blue: 0.973, alpha: 1)))
                .frame(height: 128)
            Image(image)
                .frame(height: 80)
        })
    }
}
