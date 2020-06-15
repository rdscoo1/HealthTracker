//
//  ChartsView.swift
//  Health Tracker
//
//  Created by Roman Khodukin on 14.06.2020.
//  Copyright © 2020 Roman Khodukin. All rights reserved.
//

import SwiftUI

struct ChartsView: View {
    @FetchRequest(fetchRequest: Pressure.getAllPressureItems()) var pressureItems: FetchedResults<Pressure>
    
    func getHighPressure(items: FetchedResults<Pressure>) -> Array<Double> {
        var arr = [Double]()
        items.forEach { item in
            let doubleItem = Double(item.high)
            arr.append(doubleItem ?? 0)
        }
        return arr
    }
    
    func getLowPressure(items: FetchedResults<Pressure>) -> Array<Double> {
        var arr = [Double]()
        items.forEach { item in
            let doubleItem = Double(item.low)
            arr.append(doubleItem ?? 0)
        }
        return arr
    }
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 164) {
                LineView(data: getHighPressure(items: pressureItems), title: "Артериальное давление", legend: "Верхнее", valueSpecifier: "%.0f")
                    .padding()
                
                Spacer()
                
                LineView(data: getLowPressure(items: pressureItems), title: "Артериальное давление", legend: "Нижнее", valueSpecifier: "%.0f")
                    .padding()
            }
            .navigationBarTitle(Text("Графики"),displayMode: .inline)
        }
    }
}

struct ChartsView_Previews: PreviewProvider {
    static var previews: some View {
        ChartsView()
    }
}

