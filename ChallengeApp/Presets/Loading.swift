//
//  Loading.swift
//  ChallengeApp
//
//  Created by Simone on 22/01/21.
//

import SwiftUI

struct Loading: View {
    var body: some View {
        
        ZStack(alignment: .top) {
            Color.init("Background")
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center) {
                Spacer()
                Lottie(filename: "balance").frame(height: 150)
                
                Text("GaiaGo Challenge")
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Title"))
                    .font(.system(size: 14))
                
                Spacer()
            }
        }
    }
}

struct Loading_Previews: PreviewProvider {
    static var previews: some View {
        Loading()
    }
}
