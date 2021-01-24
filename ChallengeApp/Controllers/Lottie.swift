//
//  Lottie.swift
//  ChallengeApp
//
//  Created by Simone on 24/01/21.
//

import SwiftUI
import Lottie

struct Lottie: UIViewRepresentable {
    typealias UIViewType = UIView
    var filename : String
    
    func makeUIView(context: UIViewRepresentableContext<Lottie>) -> UIView {
        let view = UIView()
        
        let animationView = AnimationView()
        let animation = Animation.named(filename)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        animationView.clipsToBounds = false

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<Lottie>) {
        
    }
}
