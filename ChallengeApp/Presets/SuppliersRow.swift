//
//  SuppliersRow.swift
//  ChallengeApp
//
//  Created by Simone on 22/01/21.
//

import SwiftUI

struct SuppliersRow: View {
    
    @State var company: String
    @State var fullname: String
    @State var avatar: String
    
    var body: some View {
        HStack {
            Image(uiImage: avatar.loadImage())
                .resizable().scaledToFit()
                .cornerRadius(7)
                .frame(width: 55.0, height: 55.0)
                .padding(.trailing, 10)
            
            VStack(alignment: .leading) {
                Text(fullname)
                    .foregroundColor(Color("Title"))
                    .fontWeight(.bold)
                    .padding(.bottom, 1)
                    .font(.system(size: 16))
                
                Text(company)
                    .fontWeight(.medium)
                    .foregroundColor(Color("Description"))
                    .font(.system(size: 14))
            }
            
            Spacer()
            
            //            Image("goArrow")
            //                .resizable().scaledToFit()
            //                .frame(width: 7)
        }
    }
}

struct SuppliersRow_Previews: PreviewProvider {
    static var previews: some View {
        SuppliersRow(company: "list.company", fullname: "list.fullname", avatar: "https://gaiago-static-files-prod.s3-eu-west-1.amazonaws.com/statics/mockAvatar/avatar-15.png")
    }
}

extension String {
    func loadImage()->UIImage {
        do {
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
