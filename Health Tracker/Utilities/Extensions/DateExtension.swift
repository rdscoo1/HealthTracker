//
//  DateExtension.swift
//  Health Tracker
//
//  Created by Roman Khodukin on 14.06.2020.
//  Copyright © 2020 Roman Khodukin. All rights reserved.
//

import UIKit

enum DateFormat: String {
    case dateTime = "d MMM, HH:mm"
    case fullHoursAndMinutes = "HH:mm"
    case fullDate = "d MMM yyyy"
}

extension Date {
    func toString(dateFormat: DateFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "RU-ru")
        dateFormatter.dateFormat = dateFormat.rawValue
        return dateFormatter.string(from: self)
    }
}
