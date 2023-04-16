//
//  CustomButton.swift
//  RockPaperScissors
//
//  Created by Manarbek Bibit on 16.04.2023.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(CGColor(red: 0.404, green: 0.314, blue: 0.643, alpha: 1)))
                .frame(height: 50)
            Text(title)
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .medium))
        }
        .padding([.leading, .trailing], 16)
    }
}
