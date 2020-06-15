//
//  ContentView.swift
//  Health Tracker
//
//  Created by Roman Khodukin on 10.06.2020.
//  Copyright © 2020 Roman Khodukin. All rights reserved.
//

import SwiftUI


struct ContentView: View {
     let managedObjectContext = CoreDataService.instance.persistentContainer.viewContext
    
    var body: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Главная")
            }
            .environment(\.managedObjectContext, managedObjectContext)
            
            MeasurementView()
                .tabItem {
                    Image("diary")
                    Text("Замеры")
            }
            .environment(\.managedObjectContext, managedObjectContext)
            
            ChartsView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Профиль")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
