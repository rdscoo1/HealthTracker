//
//  BlurView.swift
//  BloodPressure
//
//  Created by Roman Khodukin on 03.06.2020.
//  Copyright © 2020 Roman Khodukin. All rights reserved.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    typealias UIViewType = UIView
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = .clear
        
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        NSLayoutConstraint.activate([
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}

