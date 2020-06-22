//
//  ArticleStore.swift
//  Health Tracker
//
//  Created by Roman Khodukin on 16.06.2020.
//  Copyright © 2020 Roman Khodukin. All rights reserved.
//

import Combine

class ArticleStore: ObservableObject {
    @Published var articles: [Article] = articleData
}
