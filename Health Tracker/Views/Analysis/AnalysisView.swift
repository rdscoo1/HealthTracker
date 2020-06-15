//
//  AnalysisView.swift
//  Health Tracker
//
//  Created by Roman Khodukin on 11.06.2020.
//  Copyright © 2020 Roman Khodukin. All rights reserved.
//

import SwiftUI

struct AnalysisView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Analysis.getAllAnalysisItems()) var analysisItems: FetchedResults<Analysis>
    
    @State var showAddAnalysisView = false
    
    init() {
        UITableViewHeaderFooterView.appearance().tintColor = UIColor.clear
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        VStack {
            ZStack {
                List {
                    Section(header: FirstMeasurementHeader(), footer: EmptyView()) {
                        AnalysisCard(glucose: "\(analysisItems.last?.glucose ?? "--")",
                            сholesterol: "\(analysisItems.last?.cholesterol ?? "--")",
                            hemoglobin: "\(analysisItems.last?.hemoglobin ?? "--")",
                            time: "\(analysisItems.last?.createdAt?.toString(dateFormat: .fullDate) ?? "--")")
                            .padding(.vertical, 8)
                            .padding(.horizontal)
                    }
                    
                    Section(header: HistoryHeader()) {
                        ForEach(self.analysisItems.dropLast().reversed()) { item in
                            AnalysisCard(glucose: "\(item.glucose ?? "--")",
                                сholesterol: "\(item.cholesterol ?? "--")",
                                hemoglobin: "\(item.hemoglobin ?? "--")",
                                time: "\(item.createdAt?.toString(dateFormat: .fullDate) ?? "--")")
                                .padding(.vertical, 4)
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
                            self.showAddAnalysisView.toggle()
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
                        .buttonStyle(PlainButtonStyle())
                        .sheet(isPresented: $showAddAnalysisView) {
                            AddAnalysisView().environment(\.managedObjectContext, self.managedObjectContext)
                        }
                        .padding(16)
                    }
                }
            }
        }
    }
}


struct AnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        let context = CoreDataService.instance.context
        let newAnalysis = Analysis(context: context)
        newAnalysis.glucose = "10"
        newAnalysis.hemoglobin = "5"
        newAnalysis.cholesterol = "2"
        newAnalysis.createdAt = Date()
        return AnalysisView().environment(\.managedObjectContext, context)
    }
}
