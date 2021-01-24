//
//  DetailView.swift
//  ChallengeApp
//
//  Created by Simone on 22/01/21.
//

import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var suppliersController: APISuppliers
    
    @State private var dateFormatted: String = ""
    
    @Binding var inDetail: Bool
    
    var body: some View {
        
        ZStack(alignment: .top) {
            Color.init("Background")
                .edgesIgnoringSafeArea(.all)
            
            Image(uiImage: self.suppliersController.suppliersDetail.avatar.loadImage())
                .resizable().scaledToFit()
                .cornerRadius(12, corners: [.bottomLeft, .bottomRight])
                .edgesIgnoringSafeArea(.top)
            
            VStack {
                HStack(alignment: .center) {
                    Button (action: {self.inDetail = false}) {
                        Image("CloseArrow")
                            .renderingMode(.template)
                            .resizable().scaledToFit()
                            .foregroundColor(Color.white)
                            .frame(height: 10)
                    }
                    
                    Spacer()
                    Text(self.suppliersController.suppliersDetail.fullname)
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .font(.system(size: 18))
                    Spacer()
                }.padding(.horizontal, 30).background(Color.black.opacity(0.2))
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Spacer()
                    VStack(alignment: .leading, spacing: 35) {
                        
                        SuppliersInfo(icon: "Company", type: "Compagnia", info: .constant(self.suppliersController.suppliersDetail.company))
                        
                        SuppliersInfo(icon: "Mail", type: "Email", info: .constant(self.suppliersController.suppliersDetail.email.lowercased()))
                        
                        SuppliersInfo(icon: "Date", type: "Fornitore dal", info: self.$dateFormatted)
                        
                        MainButton(text: self.suppliersController.suppliersDetail.phone, action: {let telephone = "tel://"
                                    let formattedString = telephone + self.suppliersController.suppliersDetail.phone
                                    guard let url = URL(string: formattedString) else { return }
                                    UIApplication.shared.open(url)})
                            .padding(.top)
                    }.padding(.horizontal, 30)
                    .padding(.top, 30)
                    .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .background(Color("Background")).cornerRadius(25, corners: [.topLeft, .topRight])
                }
            }
            
            .onAppear {
                let string = self.suppliersController.suppliersDetail.createdAt
                let dateFormatter = DateFormatter()
                let tempLocale = dateFormatter.locale
                dateFormatter.locale = Locale(identifier: "it_CH")
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                let date = dateFormatter.date(from: string)!
                dateFormatter.dateFormat = "dd MMMM yyyy"
                dateFormatter.locale = tempLocale
                let dateString = dateFormatter.string(from: date)
                self.dateFormatted = dateString
            }
        }.edgesIgnoringSafeArea(.bottom)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(inDetail: .constant(false)).environmentObject(APISuppliers())
    }
}

