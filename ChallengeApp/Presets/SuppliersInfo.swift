//
//  SuppliersInfo.swift
//  ChallengeApp
//
//  Created by Simone on 24/01/21.
//

import SwiftUI

struct SuppliersInfo: View {
    
    @State var icon: String
    @State var type: String
    
    @Binding var info: String
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 15) {
            Image(icon)
                .renderingMode(.template)
                .resizable().scaledToFit()
                .foregroundColor(Color("Title"))
                .frame(height: 18)
            
            VStack(alignment: .leading, spacing: 3) {
                Text(type)
                    .foregroundColor(Color("Title"))
                    .fontWeight(.bold)
                    .font(.system(size: 14))
                
                Text(info)
                    .fontWeight(.medium)
                    .foregroundColor(Color("Description"))
                    .font(.system(size: 14))
            }
            
            Spacer()
        }
    }
}

struct SuppliersInfo_Previews: PreviewProvider {
    static var previews: some View {
        SuppliersInfo(icon: "Email", type: "Email", info: .constant("simone.ghisu@ied.edu"))
    }
}
