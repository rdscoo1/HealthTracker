//
//  AnalysisCard.swift
//  Health Tracker
//
//  Created by Roman Khodukin on 11.06.2020.
//  Copyright © 2020 Roman Khodukin. All rights reserved.
//

import SwiftUI

struct AnalysisCard: View {
    var glucose: String
    var сholesterol: String
    var hemoglobin: String
    var time: String
    
    var body: some View {
            VStack {
                HStack {
                    Text("\(time)")
                        .font(.system(size: 18, weight: .medium))
                        .frame(width: 180, alignment: .leading)
                        .foregroundColor(Color.black)
                    Spacer()
                    Image("star")
                        .resizable()
                        .colorMultiply(.red)
                        .frame(width: 35, height: 36)
                }
                .padding(.top, 24)
                .padding(.horizontal, 8)
                
                HStack {
                    Text("Глюкоза (ммоль/л)")
                        .font(.system(size: 18, weight: .regular))
                    
                    Spacer()
                    
                    Text("\(glucose)")
                        .font(.system(size: 18, weight: .heavy))
                }
                .padding(.top, 16)
                
                HStack {
                    Text("Холестерин (ммоль/л)")
                        .font(.system(size: 18, weight: .regular))
                    
                    Spacer()
                    
                    Text("\(сholesterol)")
                        .font(.system(size: 18, weight: .heavy))
                }
                .padding(.top, 12)
                
                HStack {
                    Text("Гемоглобин (ммоль/л)")
                        .font(.system(size: 18, weight: .regular))
                    
                    Spacer()
                    
                    Text("\(hemoglobin)")
                        .font(.system(size: 18, weight: .heavy))
                }
                .padding(.top, 12)
                
                Spacer()
            }
        .padding(.horizontal, 16)
        .frame(width: 320, height: 200)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 4)
        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
    }
}

struct AnalysisCard_Previews: PreviewProvider {
    static var previews: some View {
        AnalysisCard(glucose: "10,1", сholesterol: "5,2", hemoglobin: "2,5", time: "16 июня 2020")
    }
}
