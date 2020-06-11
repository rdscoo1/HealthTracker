//
//  DashboardView.swift
//  BloodPressure
//
//  Created by Roman Khodukin on 13.04.2020.
//  Copyright © 2020 Roman Khodukin. All rights reserved.
//

import SwiftUI


struct DashboardView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: Pressure.getAllPressureItems()) var pressureItems: FetchedResults<Pressure>
    
    @State var showProfile = false
    @State var showAddPressure = false
    
    var body: some View {
        NavigationView {
            VStack {
                BloodPressureCard(highPressure: "\(pressureItems.last?.high ?? "--")", lowPressure: "\(pressureItems.last?.low ?? "--")")
                
                Text("Пульс \(pressureItems.last?.pulse ?? "--")")
                
                Spacer()
                
                Button(action: {
                    self.showAddPressure.toggle()
                }) {
                    Text("Добавить давление")
                        .foregroundColor(.white)

                }
                .padding(16)
                .padding(.horizontal, 96)
                .background(Color(#colorLiteral(red: 0.9055276113, green: 0.1088131421, blue: 0.04684824486, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .shadow(color: Color(#colorLiteral(red: 0.9055276113, green: 0.1088131421, blue: 0.04684824486, alpha: 1)).opacity(0.3), radius: 20, x: 0, y: 20)
                .buttonStyle(PlainButtonStyle())
                .sheet(isPresented: $showAddPressure) {
                    AddPressureView().environment(\.managedObjectContext, self.managedObjectContext)
                }
            }
            .padding(.vertical, 20)
            .navigationBarTitle(Text("Главная"))
            .navigationBarItems(trailing: AvatarView(showProfile: $showProfile))
        }
    }
}

struct AvatarView: View {
    @Binding var showProfile: Bool
    //    @EnvironmentObject var user: UserStore
    
    var body: some View {
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

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(showProfile: false)
    }
}
