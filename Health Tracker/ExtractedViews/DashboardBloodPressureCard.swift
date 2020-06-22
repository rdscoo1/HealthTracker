//
//  DashboardBloodPressureCard.swift
//  BloodPressure
//
//  Created by Roman Khodukin on 03.06.2020.
//  Copyright © 2020 Roman Khodukin. All rights reserved.
//

import SwiftUI

struct DashboardBloodPressureCard: View {
    var highPressure: String
    var lowPressure: String
    
    var body: some View {
            VStack {
                HStack {
                    Text("Артериальное давление")
                        .font(.system(size: 24, weight: .bold))
                        .frame(width: 180, alignment: .leading)
                        .foregroundColor(Color.black)
                    Spacer()
                    Image("cardio")
                        .resizable()
                        .colorMultiply(.red)
                        .frame(width: 56, height: 52)
                }
                .padding(.top, 24)
                
                HStack {
                    VStack(alignment: .center) {
                        Text("\(highPressure)")
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundColor(.primary)
                            .lineLimit(3)
                        Text("Верхнее")
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                                        
                    Divider().padding(.vertical, 16)
                        .padding(.horizontal, 16)

                    VStack(alignment: .center) {
                        Text("\(lowPressure)")
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundColor(.primary)
                            .lineLimit(3)
                        Text("Нижнее")
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.horizontal, 32)
            }
        .padding(.horizontal, 16)
        .frame(width: 340, height: 190)
        .background(Color.white)
        .cornerRadius(30)
        .modifier(ShadowModifier())
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardBloodPressureCard(highPressure: "120", lowPressure: "80")
    }
}
