//
//  UserStore.swift
//  Health Tracker
//
//  Created by Roman Khodukin on 03.06.2020.
//  Copyright © 2020 Roman Khodukin. All rights reserved.
//

import SwiftUI
import Combine

class UserStore: ObservableObject {
    @Published var isLogged: Bool = UserDefaults.standard.bool(forKey: "isLogged") {
        didSet {
            UserDefaults.standard.set(self.isLogged, forKey: "isLogged")
        }
    }
    @Published var showLogin = false
}
