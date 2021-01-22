//
//  ContentView.swift
//  ChallengeApp
//
//  Created by Simone on 22/01/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var suppliersController: APISuppliers
    
    var body: some View {
        NavigationView {
            Group {
                if suppliersController.loaded {
                    HomeView()
                }
                else {
                    Loading().onAppear{
                        suppliersController.getSuppliers()
                        
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(APISuppliers())
    }
}
