//
//  ContentView.swift
//  Health Tracker
//
//  Created by Roman Khodukin on 10.06.2020.
//  Copyright © 2020 Roman Khodukin. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        TabView {
            Text("The content of the first view")
                .tabItem {
                    Image(systemName: "phone.fill")
                    Text("First Tab")
            }
            Text("The content of the second view")
                .tabItem {
                    Image(systemName: "tv.fill")
                    Text("Second Tab")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
