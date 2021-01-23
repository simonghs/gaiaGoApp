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
    @State var showDetail: Bool = false
    
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
                    
                    ForEach(suppliersController.suppliersList, id: \.id) { list in
                        
                        //                                NavigationLink(destination: DetailView(inDetail: self.$inDetail, detailSuppliers: list)
                        //                                    .navigationBarTitle(Text("x"))
                        //                                    .navigationBarHidden(true),
                        //                                           isActive: self.$inDetail) {
                        SuppliersRow(company: list.company, fullname: list.fullname, avatar: list.avatar).padding(.bottom, 20)
                            .onTapGesture {
                                self.suppliersController.suppliersDetail = list
                                self.showDetail.toggle()
                                
                            }.sheet(isPresented: $showDetail) {
                                DetailView(inDetail: $showDetail)
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
