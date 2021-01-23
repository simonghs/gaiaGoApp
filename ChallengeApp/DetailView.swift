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
                .cornerRadius(12)
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
            
            VStack(alignment: .leading) {
                
                Spacer()
                HStack {
                    Spacer()
                    VStack(alignment: .leading) {
                        Text(self.suppliersController.suppliersDetail.fullname)
                            .foregroundColor(Color("Title"))
                            .fontWeight(.bold)
                            .padding(.bottom, 15)
                            .font(.system(size: 16))
                        
                        Text("Compagnia: " + self.suppliersController.suppliersDetail.company)
                            .fontWeight(.medium)
                            .foregroundColor(Color("Description"))
                            .font(.system(size: 14))
                            .padding(.bottom, 15)
                        
                        Text("Email: " + self.suppliersController.suppliersDetail.email.lowercased())
                            .fontWeight(.medium)
                            .foregroundColor(Color("Description"))
                            .font(.system(size: 14))
                            .padding(.bottom, 15)
                        
                        Text("Fornitore dal: " + self.dateFormatted)
                            .fontWeight(.medium)
                            .foregroundColor(Color("Description"))
                            .font(.system(size: 14))
                            .padding(.bottom, 10)
                        
                        
                        MainButton(text: "+39 3493058797", action: {let telephone = "tel://"
                                    let formattedString = telephone + "3493058797"
                                    guard let url = URL(string: formattedString) else { return }
                                    UIApplication.shared.open(url)}).padding(.top, 30)
                        
                    }
                    Spacer()
                }
                .padding(.horizontal, 30).padding(.bottom, 50).padding(.top, 30)
                //                .background(Color("UpperGB")).cornerRadius(25, corners: [.topLeft, .topRight]).shadow(color: Color("UpperGB").opacity(0.5), radius: 10, x:0, y: 0)
            }
            .edgesIgnoringSafeArea(.bottom)
            .onAppear{
                let string = self.suppliersController.suppliersDetail.createdAt
                
                let dateFormatter = DateFormatter()
                let tempLocale = dateFormatter.locale
                dateFormatter.locale = Locale(identifier: "en_US_POSIX")
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                let date = dateFormatter.date(from: string)!
                dateFormatter.dateFormat = "dd MMMM yyyy"
                dateFormatter.locale = tempLocale // reset the locale
                let dateString = dateFormatter.string(from: date)
                self.dateFormatted = dateString
                //                print(dateFormatter.date(from: string) ?? "Unknown date")
                
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(inDetail: .constant(false)).environmentObject(APISuppliers())
    }
}

