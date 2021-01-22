//
//  HomeView.swift
//  ChallengeApp
//
//  Created by Simone on 22/01/21.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var suppliersController: APISuppliers
    
    @State private var searchText: String = ""
    
    var body: some View {
        
        ZStack(alignment: .top) {
            Color.init("Background")
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading){
                
                HStack {
                    Text("Rubrica fornitori").font(Font.custom("Gilroy-Bold", size: 24))
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom)
                    
                    Spacer()
                }.padding(.top)
                
                SearchBar(placeholder: "Cerca..", value: $searchText)
                    .padding(.bottom, 20)
                
                ScrollView(.vertical, showsIndicators: false){
                    VStack {
                        ForEach(suppliersController.suppliersList, id: \.id ) { list in
                            
                            HStack {
                                Image(uiImage: list.avatar.loadImage())
                                    .resizable().scaledToFit()
                                    .frame(width: 32.0, height: 32.0)
                                
                                VStack(alignment: .leading) {
                                    Text(list.company)
                                        .foregroundColor(Color("Title"))
                                    Text(list.fullname)
                                        .foregroundColor(Color("Description"))
                                }
                                
                                Spacer()
                                Text(">").foregroundColor(Color("Description"))
                                
                            }.padding(.vertical)
                        }
                    }
                }
            }.padding(.horizontal, 30)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(APISuppliers())
    }
}
