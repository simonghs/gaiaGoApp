//
//  Extensions.swift
//  ChallengeApp
//
//  Created by Simone on 24/01/21.
//

import SwiftUI

//Visualizzare immagini tramite url
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


//custom corner radius, singoli angoli
struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}


//chiudere tastiera al tap
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


//nascondere ed eliminare gli elementi tramite custom hidden
extension View {
    
    func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        modifier(HiddenModifier(isHidden: hidden, remove: remove))
    }
}


fileprivate struct HiddenModifier: ViewModifier {
    
    private let isHidden: Bool
    private let remove: Bool
    
    init(isHidden: Bool, remove: Bool = false) {
        self.isHidden = isHidden
        self.remove = remove
    }
    
    func body(content: Content) -> some View {
        Group {
            if isHidden {
                if remove {
                    EmptyView()
                } else {
                    content.hidden()
                }
            } else {
                content
            }
        }
    }
}
