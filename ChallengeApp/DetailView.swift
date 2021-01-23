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
                .resizable().scaledToFit()
//                .cornerRadius(12)
                .cornerRadius(12, corners: [.bottomLeft, .bottomRight])
                .edgesIgnoringSafeArea(.top)
            
            //            HStack {
            //                Spacer()
            //                Button (action: {self.inDetail = false}) {
            //                        Image(systemName: "xmark")
            //                            .foregroundColor(.white)
            //                            .padding()
            //                            .background(Color.black.opacity(0.8))
            //                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            //                }
            //            }.padding(.horizontal, 30)
            HStack(alignment: .center) {
                
                Button (action: {self.inDetail = false}) {
                    Image("closeArrow")
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
//                        .padding(.leading, -30)
                Spacer()
            }.padding(.horizontal, 30).background(Color.black.opacity(0.2))
            
            VStack(alignment: .leading) {
                Spacer()
                HStack {
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
                
                //                .background(Color("UpperGB")).cornerRadius(25, corners: [.topLeft, .topRight]).shadow(color: Color("UpperGB").opacity(0.5), radius: 10, x:0, y: 0)
            }.padding(.horizontal, 30).padding(.bottom, 50).padding(.top)
            .edgesIgnoringSafeArea(.bottom)
            .onAppear{
                let string = self.suppliersController.suppliersDetail.createdAt

                let dateFormatter = DateFormatter()
                let tempLocale = dateFormatter.locale
                dateFormatter.locale = Locale(identifier: "it_CH")
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                let date = dateFormatter.date(from: string)!
                dateFormatter.dateFormat = "dd MMMM yyyy"
                dateFormatter.locale = tempLocale // reset the locale
                let dateString = dateFormatter.string(from: date)
                self.dateFormatted = dateString
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(inDetail: .constant(false)).environmentObject(APISuppliers())
    }
}

