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
            Image("Search")
                .resizable().scaledToFit()
                .foregroundColor(Color("Placeholder"))
                .frame(width: 22.0)
                .padding(.trailing, 1)
            
            if value.isEmpty {
                Text(placeholder)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Placeholder"))
                    .font(.system(size: 14))
                    .padding(.leading, 30)
            }
            
            HStack {
                TextField("", text: $value, onEditingChanged: editingChanged, onCommit: commit)
                    .foregroundColor(Color("ActiveField"))
                    .padding(.leading, 30)
                
                Button(action: {
                    self.value = ""
                })
                {
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(Color("Placeholder"))
                }.foregroundColor(.black)
                .opacity(self.value != "" ? 1 : 0)
                .offset(x: self.value != "" ? 0 : 5)
                .animation(Animation.linear(duration: 0.1))
            }
        }.padding(.horizontal)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(value == "" ? Color("FieldStroke") : Color("ActiveField"), lineWidth: 1.2)
                .frame(height: 50)
                .animation(Animation.easeIn(duration: 0.2))
            
        )
        .frame(height: 50).background(Color("FieldBG")).cornerRadius(10)
    }
    
//        var body: some View {
//            VStack{
//                ZStack {
//                    HStack {
//                        TextField("Search", text: $value).padding(.trailing, 75)
//                    }.padding()
//                    .background(Color.white)
//
//                    HStack {
//                        Spacer()
//                        Button(action: {
//                            self.value = ""
//                        })
//                        {
//                            Text("Cancel")
//                        }.foregroundColor(.black)
//                    }.padding()
//                }
//            }
//        }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(placeholder: "Cerca..", value: .constant(""))
    }
}
