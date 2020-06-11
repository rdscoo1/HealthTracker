//
//  BMI.swift
//  Health Tracker
//
//  Created by Roman Khodukin on 11.06.2020.
//  Copyright © 2020 Roman Khodukin. All rights reserved.
//

import Foundation
import CoreData

public class BMI: NSManagedObject, Identifiable {
    @NSManaged public var createdAt: Date?
    @NSManaged public var weight: String
    @NSManaged public var height: String
}

extension BMI {
    static func getAllBMIItems() -> NSFetchRequest<BMI> {
        let request: NSFetchRequest<BMI> = BMI.fetchRequest() as! NSFetchRequest<BMI>
        
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
