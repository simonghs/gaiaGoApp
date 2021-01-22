//
//  GaiagoAppApp.swift
//  GaiagoApp
//
//  Created by Simone on 21/01/21.
//

import SwiftUI

@main
struct GaiagoAppApp: App {
    
    @StateObject var suppliersController = APISuppliers()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(suppliersController)
        }
    }
}
