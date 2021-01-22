//
//  SuppliersRow.swift
//  ChallengeApp
//
//  Created by Simone on 22/01/21.
//

import SwiftUI

struct SuppliersRow: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SuppliersRow_Previews: PreviewProvider {
    static var previews: some View {
        SuppliersRow()
    }
}

extension String {
    func loadImage()->UIImage {
        do{
            guard let url = URL(string: self)
            else {
                return UIImage()
            }
            
            let data: Data = try Data(contentsOf: url)
            
            return UIImage(data: data) ?? UIImage()
        } catch {
            //
        }
        
        return UIImage()
        
    }
}
