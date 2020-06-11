//
//  Analysis.swift
//  Health Tracker
//
//  Created by Roman Khodukin on 11.06.2020.
//  Copyright © 2020 Roman Khodukin. All rights reserved.
//

import Foundation
import CoreData

public class Analysis: NSManagedObject, Identifiable {
    @NSManaged public var createdAt: Date?
    @NSManaged public var glucose: String?
    @NSManaged public var hemoglobin: String?
    @NSManaged public var cholesterol: String?
}

extension Analysis {
    static func getAllAnalysisItems() -> NSFetchRequest<Analysis> {
        let request: NSFetchRequest<Analysis> = Analysis.fetchRequest() as! NSFetchRequest<Analysis>
        
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
