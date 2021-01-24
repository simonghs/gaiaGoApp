//
//  HomeView.swift
//  ChallengeApp
//
//  Created by Simone on 22/01/21.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var suppliersController: APISuppliers
    
    @State var searchText: String = ""
    @State var showDetail: Bool = false
    @State var refresh: Bool = false
    
    var body: some View {
        
        ZStack(alignment: .top) {
            Color.init("Background")
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading){
                
                HStack {
                    Text("Rubrica fornitori").font(Font.custom("Gilroy-Bold", size: 24))
                        .foregroundColor(Color("Title"))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom)
                    
                    Spacer()
                }.padding(.top)
                
                SearchBar(placeholder: "Cerca..", value: $searchText)
                
                ZStack(alignment: .top) {
                    
                    HStack {
                        Spacer()
                        ActivityIndicator(isAnimating: .constant(true), style: .medium)
                        Spacer()
                    }.padding(.top, 20)
                    .isHidden(self.refresh ? false : true, remove: self.refresh ? false : true)
                    
                    
                    ScrollView(.vertical, showsIndicators: false){
                        
                        
                        if self.searchText != ""{
//
                            if self.suppliersController.suppliersList.filter({$0.company.lowercased().contains(self.searchText.lowercased())}).count == 0 {
//
                                    HStack {
                                        Text("Nessun risultato trovato 😩")
                                            .foregroundColor(Color("Title"))
                                            .fontWeight(.medium)
                                        Spacer()
                                    }.padding(.top)
//
                            }
//
                            else {
                                VStack {
                                    ForEach(suppliersController.suppliersList.filter({$0.company.lowercased().contains(self.searchText.lowercased())} ), id: \.id) { list in

                                        SuppliersRow(company: list.company, fullname: list.fullname, avatar: list.avatar).padding(.bottom, 20)
                                            .onTapGesture {
                                                self.suppliersController.suppliersDetail = list
                                                self.showDetail.toggle()

                                            }.sheet(isPresented: $showDetail) {
                                                DetailView(inDetail: $showDetail)
                                            }
                                    }
                                }.padding(.top)
                            }
                        }
                        
                        else {
                            
                            GeometryReader { g in
                                let frame = g.frame(in: CoordinateSpace.global)
                                
                                if frame.origin.y > 180 {
                                    Text("").onAppear {
                                        self.refresh = true
                                    }
                                }
                                
                                else if frame.origin.y > 220 {
                                    Text("").onAppear{
                                        suppliersController.getSuppliers()
                                        
                                        
                                        let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                        impactMed.impactOccurred()
                                    }
                                }
                                
                                
                                else if frame.origin.y < 200{
                                    Text("").onAppear{
                                        self.refresh = false
                                    }
                                }
                                
                            }
                            
                            ForEach(suppliersController.suppliersList, id: \.id) { list in
                                
//                        ForEach(suppliersController.suppliersList.filter({$0.company.lowercased().contains(self.searchText.lowercased())} ), id: \.id) { list in
                                
                                    SuppliersRow(company: list.company, fullname: list.fullname, avatar: list.avatar).padding(.bottom, 20)
                                        .onTapGesture {
                                            self.suppliersController.suppliersDetail = list
                                            self.showDetail.toggle()
                                            
                                        }.sheet(isPresented: $showDetail) {
                                            DetailView(inDetail: $showDetail)
                                        }
                            }
                        }
                    }.padding(0)
                }
            }.padding(.horizontal, 30)
        }.onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(APISuppliers())
    }
}
