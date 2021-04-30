//
//  LoadingView.swift
//  BloodPressure
//
//  Created by Roman Khodukin on 03.06.2020.
//  Copyright © 2020 Roman Khodukin. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {        
        LottieView(filename: "loadingheart").frame(width: 200, height: 200)
            .padding(16)
            .frame(width: 200, height: 200)
            .background(BlurView(style: .systemMaterial))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 30, x: 0, y: 30)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
