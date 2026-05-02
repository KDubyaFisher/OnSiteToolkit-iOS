//
//  Site.swift
//  OnSiteToolkit
//
//  Created by Kolton Fisher on 5/1/26.
//

import Foundation

struct Site: Identifiable {
    let id: Int
    let customerId: Int
    let name: String
    let addressLine1: String
    let addressLine2: String
    let city: String
    let state: String
    let zipCode: String
    let notes: String

    var fullAddress: String {
        if addressLine2.isEmpty {
            return "\(addressLine1)\n\(city), \(state) \(zipCode)"
        }

        return "\(addressLine1), \(addressLine2)\n\(city), \(state) \(zipCode)"
    }
}
