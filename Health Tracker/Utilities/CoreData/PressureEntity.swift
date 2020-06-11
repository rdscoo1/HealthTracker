//
//  Pressure.swift
//  Health Tracker
//
//  Created by Roman Khodukin on 10.06.2020.
//  Copyright © 2020 Roman Khodukin. All rights reserved.
//

import Foundation
import CoreData

public class Pressure: NSManagedObject, Identifiable {
    @NSManaged public var createdAt: Date?
    @NSManaged public var high: Int16
    @NSManaged public var low: Int16
    @NSManaged public var pulse: Int16
}

extension Pressure {
    static func getAllPressureItems() -> NSFetchRequest<Pressure> {
        let requst: NSFetchRequest<Pressure> = Pressure.fetchRequest() as!
        NSFetchRequest<Pressure>
        
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        
        requst.sortDescriptors = [sortDescriptor]
        
        return requst
    }
}
