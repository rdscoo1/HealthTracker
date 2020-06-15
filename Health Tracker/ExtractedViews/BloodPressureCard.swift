//
//  BloodPressureCard.swift
//  Health Tracker
//
//  Created by Roman Khodukin on 14.06.2020.
//  Copyright © 2020 Roman Khodukin. All rights reserved.
//

import SwiftUI

struct BloodPressureCard: View {
    var highPressure: String
    var lowPressure: String
    var pulse: String
    var time: String
    
    var body: some View {
        VStack {
            
            HStack {
                Text("\(time)")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(Color.black)
                Spacer()
            }
            .padding(.top, 16)
            .padding(.horizontal, 8)
            
            HStack {
                ZStack {
                    Rectangle()
                        .frame(width: 144, height: 32)
                        .foregroundColor(Color.green)
                        .cornerRadius(14)
                    
                    Text("Нормальное")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(Color.white)
                }
                
                Spacer()
                Image("cardio")
                    .resizable()
                    .colorMultiply(.red)
                    .frame(width: 48, height: 44)
                
            }
            .padding(.leading, 8)
            
            HStack {
                HStack {
                    VStack(alignment: .center) {
                        Text("\(highPressure)")
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundColor(.primary)
                            .lineLimit(1)
                        Text("Верхнее")
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                    
                    Divider().padding(.vertical, 12)
                        .padding(.horizontal, 8)
                    
                    VStack(alignment: .center) {
                        Text("\(lowPressure)")
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundColor(.primary)
                            .lineLimit(1)
                        Text("Нижнее")
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                }
                
                Spacer()
                
                VStack(alignment: .center) {
                    Text("\(pulse)")
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                    Text("Пульс")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
            }
            .padding(.bottom)
        }
        .padding(.horizontal, 16)
        .frame(width: 320, height: 180)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 4)
        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
    }
}

struct BloodPressureCard_Previews: PreviewProvider {
    static var previews: some View {
        BloodPressureCard(highPressure: "120", lowPressure: "80", pulse: "60", time: "19:30")
    }
}
