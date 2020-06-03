//
//  ContentView.swift
//  BloodPressure
//
//  Created by Roman Khodukin on 13.04.2020.
//  Copyright © 2020 Roman Khodukin. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @State var showProfile: Bool
    
    var body: some View {
        VStack {
            BloodPressureCard(highPressure: 200, lowPressure: 100)
            Spacer()
        }
        .padding(.top, 20)
        .navigationBarTitle(Text("Blood Pressure"))
        .navigationBarItems(trailing: AvatarView(showProfile: $showProfile))
    }
}

struct AvatarView: View {
    @Binding var showProfile: Bool
//    @EnvironmentObject var user: UserStore
    
    var body: some View {
//        if true {
            Button(action: { self.showProfile.toggle() }) {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .colorMultiply(.black)
                    .frame(width: 36, height: 36)
                    .clipShape(Circle())
                    .padding()
                    .offset(x: 0, y: 48)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView(showProfile: false)
        }
    }
}
