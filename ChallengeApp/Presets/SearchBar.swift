//
//  SearchBar.swift
//  ChallengeApp
//
//  Created by Simone on 22/01/21.
//

import SwiftUI

struct SearchBar: View {
    
    @State var placeholder: String
    @Binding var value: String
    
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            if value.isEmpty {
                Text(placeholder)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Placeholder"))
                    .font(.system(size: 14))
            }
            
            TextField("", text: $value, onEditingChanged: editingChanged, onCommit: commit)
                .foregroundColor(.white)
            
        }.padding(.horizontal)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(value == "" ? Color("FieldStroke") : Color.white, lineWidth: 1.2)
                .frame(height: 50)
            
        )
        .frame(height: 50).background(Color("FieldBG")).cornerRadius(10)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(placeholder: "Cerca..", value: .constant(""))
    }
}
