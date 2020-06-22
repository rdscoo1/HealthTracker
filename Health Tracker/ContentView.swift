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
    var article = ArticleStore()
    
    var body: some View {
        TabView {
            DashboardView(showProfile: false, active: true, activeIndex: -1)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Главная")
            }
            .environment(\.managedObjectContext, managedObjectContext)
            .environmentObject(article)
            
            MeasurementView()
                .tabItem {
                    Image("diary")
                    Text("Замеры")
            }
            .environment(\.managedObjectContext, managedObjectContext)
            
            ProfileView()
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
