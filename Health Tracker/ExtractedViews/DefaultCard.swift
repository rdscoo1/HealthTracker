//
//  DefaultCard.swift
//  BloodPressure
//
//  Created by Roman Khodukin on 03.06.2020.
//  Copyright © 2020 Roman Khodukin. All rights reserved.
//

import SwiftUI

struct DefaultCard: View {
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Пульс")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(Color.black)
                    Spacer()
                    Image("pulse")
                        .resizable()
                        .colorMultiply(.red)
                        .frame(width: 36, height: 20)
                }
                HStack(alignment: .bottom) {
                    Text("200")
                        .font(.system(size: 26, weight: .medium))
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(1)
                    Text("уд/м")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.secondary)
                        .padding(.bottom, 6)
                }
                .padding(.top, 12)
            }
        }
        .padding(16)
        .frame(width: 156, height: 112)
        .background(Color.white)
        .cornerRadius(30)
        .modifier(ShadowModifier())
    }
}

struct DefaultCard_Previews: PreviewProvider {
    static var previews: some View {
        DefaultCard()
    }
}
