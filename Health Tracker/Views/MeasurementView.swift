//
//  MeasurementView.swift
//  Health Tracker
//
//  Created by Roman Khodukin on 10.06.2020.
//  Copyright © 2020 Roman Khodukin. All rights reserved.
//

import SwiftUI

struct MeasurementView: View {
    @State var picker = 0
    
    var body: some View {
            VStack {
                    Picker(selection: self.$picker,
                           label: Text("")) {
                            Text("Давление").tag(0)
                            Text("Анализы").tag(2)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                                    
                    if self.picker == 0 {
                        PressureView()
                    } else {
                        AnalysisView()
                    }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
//            .navigationBarTitle(Text("Замеры"), displayMode: .inline)
    }
}

struct MeasurementView_Previews: PreviewProvider {
    static var previews: some View {
        MeasurementView()
    }
}
