//
//  ArticleDetail.swift
//  Health Tracker
//
//  Created by Roman Khodukin on 16.06.2020.
//  Copyright © 2020 Roman Khodukin. All rights reserved.
//

import SwiftUI

struct ArticleDetail: View {
    var article: Article
    @Binding var show: Bool
    @Binding var active: Bool
    @Binding var activeIndex: Int
    
    var body: some View {
        ScrollView {
            VStack {
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
                            .onTapGesture {
                                self.show = false
                                self.active = false
                                self.activeIndex = -1
                        }
                    }
                    Spacer()
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
                
                VStack(alignment: .leading, spacing: 30.0) {
                    Text("Измерение давления - привычное дело. Но если не соблюдать простые правила, тонометр покажет неверные данные.")
                    
                    Text("Основные правила")
                        .font(.title).bold()
                    
                    Text("Артериальное давление (АД) измеряется после 5-минутного отдыха. Нужно сесть удобно на стул или кресло с поддержкой для спины и максимально расслабиться в течение 5 минут")
                    
                    Text("Выполните два измерения с интервалом 1-2 минуты. Если разница между измерениями будет более 10 мм рт.ст., выполните третье измерение. Ваше давление будет равняться среднему арифметическому от двух последних измерений")
                    
                    Text("Делайте замеры в одно и тоже время. Лучше всего утром - до приема лекарств и вечером - до ужина.")
                    
                    Text("Манжета накладывается так, чтобы ее нижний край находился выше локтевого сгиба на 2 см, а трубка, отходящая от манжеты, располагалась посередине локтевого сгиба")
                    
                    Text("Обе ноги должны находиться на полу и не быть скрещенными")
                    
                    Text("В первый раз измеряйте давление на обеих руках. В дельнейшем на той, где давление было больше.")
                }
                .padding(30)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ArticleDetail_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetail(article: articleData[0],
                      show: .constant(true),
                      active: .constant(true),
                      activeIndex: .constant(-1))
    }
}
