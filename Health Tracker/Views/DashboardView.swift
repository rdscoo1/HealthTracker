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
    @FetchRequest(fetchRequest: Analysis.getAllAnalysisItems()) var analysisItems: FetchedResults<Analysis>
    
    @State var showProfile = false
    @EnvironmentObject var store: ArticleStore
    @State var active = false
    @State var activeIndex = -1
    
    var body: some View {
        GeometryReader { bounds in
            ScrollView {
                VStack {
                    HStack {
                        Text("Главная")
                            .font(.system(size: 32, weight: .bold))
                        
                        Spacer()
                        
                        AvatarView(showProfile: self.$showProfile)
                    }
                    .padding(.horizontal)
                    .padding(.leading, 14)
                    
                    DashboardBloodPressureCard(highPressure: self.pressureItems.first?.high ?? "--",
                                               lowPressure: self.pressureItems.first?.low ?? "--")
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 24) {
                            ForEach(sectionData) { item in
                                GeometryReader { geometry in
                                    DefaultCard(cardModel: item, value: self.pressureItems.first?.high ?? "--")
                                        .rotation3DEffect(.degrees(Double(geometry.frame(in: .global).minX - 30) / -25),
                                                          axis: (x: 0, y: 10, z: 0))
                                }
                                .frame(width: 275, height: 128)
                            }
                        }
                        .padding(.top, 30)
                        .padding(.horizontal, 48)
                        .padding(.bottom, 24)
                    }
                    HStack {
                        Text("Статьи")
                            .font(.system(size: 28, weight: .bold))
                            .padding(.horizontal)
                            .padding(.leading, 14)
                        Spacer()
                    }
                    
                    VStack(spacing: 30) {
                        ForEach(self.store.articles.indices, id: \.self) { index in
                            GeometryReader { geometry in
                                ArticleItemView(
                                    show: self.$store.articles[index].show,
                                    article: self.store.articles[index],
                                    active: self.$active,
                                    index: index,
                                    activeIndex: self.$activeIndex
                                )
                                self.printView(self.store.articles[index])
                                self.printView(self.$store.articles[index].show)
                                self.printView(self.$active)
                                self.printView(self.$activeIndex)
                                    .offset(y: self.store.articles[index].show ? -geometry.frame(in: .global).minY : 0)
                                    .opacity(self.activeIndex != index && self.active ? 0 : 1)
                                    .scaleEffect(self.activeIndex != index && self.active ? 0.5 : 1)
                                    .offset(x: self.activeIndex != index && self.active ? bounds.size.width : 0)
                            }
                            .frame(height: 280)
                            .frame(maxWidth: self.store.articles[index].show ? .infinity : screen.width - 60)
                            .zIndex(self.store.articles[index].show ? 1 : 0)
                        }
                    }
                    
                    Spacer()
                }
                .padding(.vertical, 20)
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
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
        }
    }
}

struct DefaultCard: View {
    var cardModel: CardModel
    var value: String
     
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text(cardModel.title)
                        .font(.system(size: 28, weight: .bold))
                        .frame(width: 180, alignment: .leading)
                        .foregroundColor(Color.black)
                    Spacer()
                    Image(cardModel.image)
                        .resizable()
                        .colorMultiply(.red)
                        .frame(width: 40, height: 24)
                }
                HStack(alignment: .bottom) {
                    Text(cardModel.value)
                        .font(.system(size: 28, weight: .medium))
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(1)
                        .padding(.trailing, 2)
                    Text(cardModel.unit)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.secondary)
                        .padding(.bottom, 6)
                }
                .padding(.top, 12)
            }
            .padding(.horizontal, 8)
        }
        .padding(16)
        .frame(width: 275, height: 128)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(color: Color.black.opacity(0.2), radius: 12, x: 0, y: 12)
    }
}

struct ArticleCard: View {
    var body: some View {
        VStack {
            HStack{
                Text("Как улучшить давление?")
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 250, alignment: .leading)
                Spacer()
                Image("star")
                    .resizable()
                    .colorMultiply(.red)
                    .frame(width: 35, height: 36)
            }
            Image("AnalysisIllustration")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: screen.width - 60, height: 275)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(color: Color.black.opacity(0.2), radius: 12, x: 0, y: 12)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static let article = ArticleStore()
    
    static var previews: some View {
        DashboardView(showProfile: false, active: true, activeIndex: -1)
            .environmentObject(article)
    }
}

struct CardModel: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var unit: String
    var value: String
}

let sectionData = [
    CardModel(title: "Пульс", image: "pulse", unit: "уд/м", value: "90"),
    CardModel(title: "Глюкоза", image: "star", unit: "ммоль/л", value: "2"),
    CardModel(title: "Гемоглобин", image: "star", unit: "ммоль/л", value: "5.2"),
    CardModel(title: "Холестерин", image: "star", unit: "ммоль/л", value: "4")
]
