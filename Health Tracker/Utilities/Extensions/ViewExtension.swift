//
//  ViewExtension.swift
//  Health Tracker
//
//  Created by Roman Khodukin on 14.06.2020.
//  Copyright © 2020 Roman Khodukin. All rights reserved.
//

import SwiftUI

extension View {
    func printView(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}
