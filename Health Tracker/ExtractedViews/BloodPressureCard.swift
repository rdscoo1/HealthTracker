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
    
    func getPressureColor(pressure: String) -> UIColor {
        guard let highPressure = Int(pressure) else {
            return (.clear)
        }
        switch highPressure {
        case 0..<120:
            return (#colorLiteral(red: 0.2235294118, green: 0.7098039216, blue: 0.2901960784, alpha: 1))
        case 120..<130:
            return (#colorLiteral(red: 0.2235294118, green: 0.7098039216, blue: 0.2901960784, alpha: 1))
        case 130..<140:
            return (#colorLiteral(red: 0.968627451, green: 0.5411764706, blue: 0.02745098039, alpha: 1))
        case 140..<160:
            return (#colorLiteral(red: 0.968627451, green: 0.5411764706, blue: 0.02745098039, alpha: 1))
        case 160..<180:
            return (#colorLiteral(red: 0.7294117647, green: 0.2117647059, blue: 0.03921568627, alpha: 1))
        default:
            return (#colorLiteral(red: 0.7294117647, green: 0.2117647059, blue: 0.03921568627, alpha: 1))
        }
    }
    
    func getPressureType(high: String) -> String {
        guard let highPressure = Int(high) else {
            return ("")
        }
        switch highPressure {
        case 0..<120:
            return ("Оптимальное")
        case 120..<130:
            return ("Нормальное")
        case 130..<140:
            return ("Высокое нормальное")
        case 140..<160:
            return ("Высокое")
        case 160..<180:
            return ("Очень высокое")
        default:
            return ("Крайне высокое")
        }
    }
    
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
                        .frame(width: 200, height: 32)
                        .foregroundColor(Color(getPressureColor(pressure: highPressure)))
                        .cornerRadius(14)
                    
                    Text(getPressureType(high: highPressure))
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
