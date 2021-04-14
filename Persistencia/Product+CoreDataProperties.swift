//
//  Product+CoreDataProperties.swift
//  Persistencia
//
//  Created by Henrique Matheus Alves Pereira on 13/04/21.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var name: String?
    @NSManaged public var price: Float
    @NSManaged public var company: NSSet?

}

// MARK: Generated accessors for company
extension Product {

    @objc(addCompanyObject:)
    @NSManaged public func addToCompany(_ value: Company)

    @objc(removeCompanyObject:)
    @NSManaged public func removeFromCompany(_ value: Company)

    @objc(addCompany:)
    @NSManaged public func addToCompany(_ values: NSSet)

    @objc(removeCompany:)
    @NSManaged public func removeFromCompany(_ values: NSSet)

}

extension Product : Identifiable {

}
