//
//  DetailView.swift
//  ChallengeApp
//
//  Created by Simone on 22/01/21.
//

import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var suppliersController: APISuppliers
    
    @State var dateFormatted: String = ""
    
    @Binding var inDetail: Bool
    
    
    var body: some View {
        
        ZStack(alignment: .top) {
            Color.init("Background")
                .edgesIgnoringSafeArea(.all)
            
            Image(uiImage: self.suppliersController.suppliersDetail.avatar.loadImage())
                
//            Image(uiImage: "https://gaiago-static-files-prod.s3-eu-west-1.amazonaws.com/statics/mockAvatar/avatar-15.png".loadImage())
                .resizable().scaledToFit()
                .cornerRadius(12, corners: [.bottomLeft, .bottomRight])
                .edgesIgnoringSafeArea(.top)
            
            
            VStack {
                HStack(alignment: .center) {
                    
                    Button (action: {self.inDetail = false}) {
                        Image("closeArrow")
                            .renderingMode(.template)

                            .resizable().scaledToFit()
                            .foregroundColor(Color.white)

                            .frame(height: 10)
                            
                    }
                    
                    Spacer()
                        Text(self.suppliersController.suppliersDetail.fullname)
    //                        Text("nome completo")
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .padding(.vertical, 10)
                            .font(.system(size: 18))
                    Spacer()
                }.padding(.horizontal, 30).background(Color.black.opacity(0.2))
            
            Spacer()
            
            VStack(alignment: .leading) {
                HStack(alignment: .top){
                    Spacer()
                    VStack(alignment: .leading) {
                        
//
                        Text("Compagnia")
                            .foregroundColor(Color("Title"))
                            .fontWeight(.bold)
                            .padding(.bottom, 1)
                            .font(.system(size: 14))
                        
//                        Text("nome completo")
                        Text(self.suppliersController.suppliersDetail.company)
                            .fontWeight(.medium)
                            .foregroundColor(Color("Description"))
                            .font(.system(size: 14))
                            .padding(.bottom, 20)
                        
                        Text("Email")
                            .foregroundColor(Color("Title"))
                            .fontWeight(.bold)
                            .padding(.bottom, 1)
                            .font(.system(size: 14))
                        
//                        Text("simone.ghisu@ied.edu")
                                                    Text(self.suppliersController.suppliersDetail.email.lowercased())
                            .fontWeight(.medium)
                            .foregroundColor(Color("Description"))
                            .font(.system(size: 14))
                            .padding(.bottom, 20)
                        
                        Text("Fornitore dal")
                            .foregroundColor(Color("Title"))
                            .fontWeight(.bold)
                            .padding(.bottom, 1)
                            .font(.system(size: 14))
                        
//                        Text("1 febbraio 2020")
                        Text(self.dateFormatted)
                            .fontWeight(.medium)
                            .foregroundColor(Color("Description"))
                            .font(.system(size: 14))
                            .padding(.bottom, 10)
                        
                        
                        MainButton(text: self.suppliersController.suppliersDetail.phone, action: {let telephone = "tel://"
                                    let formattedString = telephone + self.suppliersController.suppliersDetail.phone
                                    guard let url = URL(string: formattedString) else { return }
                                    UIApplication.shared.open(url)}).padding(.top, 30)
                        
                    }
                    Spacer()
                }

            }

            .padding(.horizontal, 30)
            .padding(.top, 30)
//            .edgesIgnoringSafeArea(.bottom)
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.top)
//            .padding(.bottom, 5)
//            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .background(Color("Background")).cornerRadius(25, corners: [.topLeft, .topRight])
                
            
            
            
            }
            
//            .edgesIgnoringSafeArea(.bottom)

            
            .onAppear{
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

