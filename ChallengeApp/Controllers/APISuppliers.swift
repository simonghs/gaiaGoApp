//
//  APISuppliers.swift
//  ChallengeApp
//
//  Created by Simone on 22/01/21.
//

import Foundation
import SwiftUI
import Combine

class APISuppliers: ObservableObject {
    
    var didChange = PassthroughSubject<APISuppliers, Never>()
    
    @Published var suppliersList = [allSuppliers]()
    @Published var suppliersDetail = allSuppliers (id: "", createdAt: "", fullname: "", avatar: "", phone: "", company: "", email: "")
    @Published var loaded = false
    
    func getSuppliers() {
        guard let url = URL(string: "https://5f69b5fcd808b90016bc0551.mockapi.io/api/v1/addressBook/list") else {return}
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            
            if let data = data {
                if let success = try? JSONDecoder().decode([allSuppliers].self, from: data) {
                    DispatchQueue.main.async {
                        
                        self.suppliersList = success
                        
                        self.loaded = true
                        self.didChange.send(self)
                        print("fornitori scaricati")
                        print(success)
                    }
                    return
                }
            }
            print("ERRORE GET: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}
