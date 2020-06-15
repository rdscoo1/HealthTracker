//
//  WeightView.swift
//  Health Tracker
//
//  Created by Roman Khodukin on 14.06.2020.
//  Copyright © 2020 Roman Khodukin. All rights reserved.
//

import SwiftUI

struct WeightView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button(action: {}) {
                    HStack {
                        Text("Графики")
                        
                        Image("line-chart")
                            .resizable()
                            .frame(width: 24, height: 18)
                    }
                }
                .padding(.horizontal)
                .foregroundColor(Color.black)

            }
            .padding(.bottom, 8)
            
            Spacer()
        }
    }
}

struct WeightView_Previews: PreviewProvider {
    static var previews: some View {
        WeightView()
    }
}
