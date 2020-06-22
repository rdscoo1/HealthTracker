//
//  ProfileView.swift
//  Health Tracker
//
//  Created by Roman Khodukin on 15.06.2020.
//  Copyright © 2020 Roman Khodukin. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Image("avatarImage")
                .resizable()
                .frame(width: 160, height: 160)
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .padding()
            
            InfoStackView()
            Divider()
            Spacer()
            
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct InfoStackView: View {
    let infos = [
        Info(number: 180, label: "Рост"),
        Info(number: 85, label: "Вес"),
        Info(number: 22, label: "Возраст")
    ]
    
    var body: some View {
        HStack {
            ForEach(infos, id: \.self) { info in
                VStack {
                    Text("\(info.number)")
                        .font(.system(size: 20, weight: .semibold)).bold()
                    Text("\(info.label)")
                        .font(.system(size: 24, weight: .semibold)).bold()
                }
            .padding()
            }
        }
    }
}

struct Info: Hashable {
    let number: Int
    let label: String
}
