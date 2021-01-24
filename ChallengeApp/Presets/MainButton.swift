//
//  MainButton.swift
//  ChallengeApp
//
//  Created by Simone on 23/01/21.
//

import SwiftUI

struct MainButton: View {
    
    @State var text: String
    
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Spacer()
            Text(text)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .font(.system(size: 16))
            
            Spacer()
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.white, lineWidth: 0)
                .frame(height: 50)
            
        )
        .frame(height: 50).background(Color("Primary"))
        .cornerRadius(10).padding(.bottom, 10)
    }
}

struct MainButton_Previews: PreviewProvider {
    static var previews: some View {
        MainButton(text: "button", action: {})
    }
}
