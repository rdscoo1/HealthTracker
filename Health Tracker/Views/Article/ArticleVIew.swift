//
//  ArticleVIew.swift
//  Health Tracker
//
//  Created by Roman Khodukin on 16.06.2020.
//  Copyright © 2020 Roman Khodukin. All rights reserved.
//

import SwiftUI

struct ArticleView: View {
    @ObservedObject var store = ArticleStore()
    @State var active = false
    @State var activeIndex = -1
    
    var body: some View {
        ZStack {
            Color.black.opacity(active ? 0.5 : 0)
                .animation(.linear)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 30) {
                    Text("Статьи")
                        .font(.largeTitle).bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 30)
                        .padding(.top, 30)
                        .blur(radius: active ? 20 : 0)
                    
                    ForEach(store.articles.indices, id: \.self) { index in
                        GeometryReader { geometry in
                            ArticleItemView(
                                show: self.$store.articles[index].show,
                                article: self.store.articles[index],
                                active: self.$active,
                                index: index,
                                activeIndex: self.$activeIndex
                            )
                                .offset(y: self.store.articles[index].show ? -geometry.frame(in: .global).minY : 0)
                                .opacity(self.activeIndex != index && self.active ? 0 : 1)
                                .scaleEffect(self.activeIndex != index && self.active ? 0.5 : 1)
                                .offset(x: self.activeIndex != index && self.active ? screen.width : 0)
                        }
                        .frame(height: 280)
                        .frame(maxWidth: self.store.articles[index].show ? .infinity : screen.width - 60)
                        .zIndex(self.store.articles[index].show ? 1 : 0)
                    }
                }
                .frame(width: screen.width)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            }
            .statusBar(hidden: active ? true : false)
            .animation(.linear)
        }
    }
}

struct ArticleVIew_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView()
    }
}

struct ArticleItemView: View {
    @Binding var show: Bool
    var article: Article
    @Binding var active: Bool
    var index: Int
    @Binding var activeIndex: Int
    @State var activeView = CGSize.zero
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 30.0) {
                Text("Следите за своим здоровьем, иначе будут большие проблемы(((")
                
                Text("Диета Dash")
                    .font(.title).bold()
                
                Text("Действие диеты DASH основано на сокращении потребления натрия и включении в рацион продуктов с высоким содержанием пищевых компонентов, способствующих снижению артериального давления, таких как калий, кальций, магний и пищевые волокна. Помимо снижения артериального давления, она имеет и другие полезные эффекты, в число которых входят снижение уровня холестерина и сахара в крови, профилактика остеопороза и злокачественных новообразований.")
                
                Text("Ограничение потребления натрия. Классическая диета DASH содержит примерно 2300 мг натрия в сутки (в пересчете на поваренную соль – это менее 5 г соли, включая и ту соль, которая используется при приготовлении пищи, и ту соль, которая входит в продукты готового питания и полуфабрикаты - хлеб, выпечку, сосиски, пельмени и др.). Также разработан вариант диеты DASH с более жестким ограничением натрия – до 1500 мг в сутки (менее 3 грамм соли в сутки), который позволяет добиться более выраженного снижения артериального давления. Напротив, компоненты диеты обеспечивают повышенное потребление калия (≥ 4,7 г/сутки).")
            }
            .padding(30)
            .frame(maxWidth: show ? .infinity : screen.width - 60,
                   maxHeight: show ? .infinity : 280,
                   alignment: .top)
                .offset(y: show ? 460 : 0)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                .opacity(show ? 1 : 0)
            
            VStack {
                HStack{
                    Text(article.title)
                        .font(.system(size: 24, weight: .bold))
                        .frame(width: 250, alignment: .leading)
                    Spacer()
                    
                    Image(systemName: "xmark")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(Color.white)
                        .frame(width: 36, height: 36)
                        .background(Color.gray)
                        .clipShape(Circle())
                        .padding(.top, 8)
                        .opacity(show ? 1 : 0)
                }
                Image(article.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 210)
            }
            .padding(show ? 30 : 20)
            .padding(.top, show ? 30 : 0)
            .frame(maxWidth: show ? .infinity : screen.width - 60,
                   maxHeight: show ? 460 : 280)
                .background(Color.white)
                .cornerRadius(30)
                .shadow(color: Color.black.opacity(0.2), radius: 12, x: 0, y: 12)
                .gesture(
                    DragGesture().onChanged { value in
                        if self.activeView.height > 50 {
                            self.show = false
                            self.active = false
                            self.activeIndex = -1
                        }
                        self.activeView = value.translation
                    }
                    .onEnded { value in
                        self.activeView = .zero
                    }
            )
                .onTapGesture {
                    self.show.toggle()
                    self.active.toggle()
                    if self.show {
                        self.activeIndex = self.index
                    } else {
                        self.activeIndex = -1
                    }
            }
            if show {
                ArticleDetail(article: article, show: $show, active: $active, activeIndex: $activeIndex)
                    .background(Color.white)
                    .animation(nil)
            }
        }
        .frame(height: show ? screen.height : 280)
        .scaleEffect(1 - self.activeView.height / 1000)
            
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 9))
        .edgesIgnoringSafeArea(.all)
    }
}

struct Article: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var show: Bool
}

let articleData = [
    Article(title: "Как правильно измерить давление?", image: "HeathWithTonome", show: false),
    Article(title: "Питание Dash", image: "AnalysisIllustration", show: false),
    Article(title: "Что такое гипертония?", image: "AnalysisIllustration", show: false)
]
