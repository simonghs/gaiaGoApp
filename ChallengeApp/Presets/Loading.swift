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
                Lottie(filename: "loading").frame(height: 140)
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
