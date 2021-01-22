//
//  HomeView.swift
//  GaiagoApp
//
//  Created by Simone on 21/01/21.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var suppliersController: APISuppliers
    
    var body: some View {
        VStack{
            Text("ciao")
            ScrollView(.vertical, showsIndicators: false){
                VStack {
                    ForEach(suppliersController.suppliersList, id: \.id ) { list in
                        
                        HStack {
                            
                            VStack(alignment: .leading) {
                                Text(list.company)
                                Text(list.fullname)
                            }
                            
                            Spacer()
                            Text(">")
                            
                        }.padding(.vertical)
                    }
                }
            }
        }.padding(.horizontal, 30)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(APISuppliers())
    }
}
