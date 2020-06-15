//
//  PressureView.swift
//  Health Tracker
//
//  Created by Roman Khodukin on 14.06.2020.
//  Copyright © 2020 Roman Khodukin. All rights reserved.
//

import SwiftUI

struct PressureView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Pressure.getAllPressureItems()) var pressureItems: FetchedResults<Pressure>
    
    @State var showAddPressureView = false
    @State var showChartsView = false
    
    init() {
        UITableViewHeaderFooterView.appearance().tintColor = UIColor.clear
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                NavigationLink(destination: ChartsView().environment(\.managedObjectContext, self.managedObjectContext),
                               isActive: self.$showChartsView) {
                                EmptyView()
                }
                
                Button(action: { self.showChartsView = true }) {
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
            
            
            ZStack {
                
                List {
                    Section(header: FirstMeasurementHeader(), footer: EmptyView()) {
                        BloodPressureCard(highPressure: "\(pressureItems.first?.high ?? "--")", lowPressure: "\(pressureItems.first?.low ?? "--")", pulse: "\(pressureItems.first?.pulse ?? "--")", time: "\(pressureItems.first?.createdAt?.toString(dateFormat: .dateTime) ?? "--")")
                            .padding(.vertical, 8)
                            .padding(.horizontal)
                    }
                    
                    Section(header: HistoryHeader()) {
                        ForEach(self.pressureItems.dropFirst()) { pressureItem in
                            BloodPressureCard(highPressure: "\(pressureItem.high )",
                                lowPressure: "\(pressureItem.low )",
                                pulse: "\(pressureItem.pulse ?? "--")",
                                time: "\(pressureItem.createdAt?.toString(dateFormat: .dateTime) ?? "--")")
                                .padding(.bottom, 4)
                                .padding(.horizontal)
                        }
                    }
                }
                .listSeparatorStyleNone()
                
                Spacer()
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            self.showAddPressureView.toggle()
                        }) {
                            Image(systemName: "plus")
                                .resizable()
                                .foregroundColor(Color.white)
                                .frame(width: 32, height: 32)
                                .padding(16)
                        }
                        .background(Color(#colorLiteral(red: 0.9055276113, green: 0.1088131421, blue: 0.04684824486, alpha: 1)))
                        .clipShape(Circle())
                        .shadow(color: Color(#colorLiteral(red: 0.9055276113, green: 0.1088131421, blue: 0.04684824486, alpha: 1)).opacity(0.3), radius: 20, x: 0, y: 20)
                        .sheet(isPresented: $showAddPressureView) {
                            AddPressureView().environment(\.managedObjectContext, self.managedObjectContext)
                        }
                        .padding(16)
                    }
                }
            }
        }
    }
}


struct HistoryHeader: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("История")
                    .font(.system(size: 22, weight: .semibold))
                    .padding(.top, 8)
                
                Divider()
                    .padding(.bottom, 4)
            }
            .background(Color.white)
        }
    }
}

struct FirstMeasurementHeader: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Последний замер")
                    .font(.system(size: 22, weight: .semibold))
                    .padding(.top, 4)
                
                Divider()
                    .padding(.bottom, 4)
            }
            .background(Color.white)
        }
    }
}

struct PressureView_Previews: PreviewProvider {
    static var previews: some View {
        PressureView()
    }
}
