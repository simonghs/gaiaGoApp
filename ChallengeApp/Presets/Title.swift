//
//  Title.swift
//  ChallengeApp
//
//  Created by Simone on 25/01/21.
//

import SwiftUI

struct Title: View {
    
    @State var text: String
    
    var body: some View {
        HStack {
            Text(text).font(Font.custom("Gilroy-Bold", size: 24))
                .foregroundColor(Color("Title"))
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .padding(.bottom)
            
            Spacer()
        }
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title(text: "rubrica fornitori")
    }
}
