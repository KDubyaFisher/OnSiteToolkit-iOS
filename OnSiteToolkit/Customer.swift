//
//  Customer.swift
//  OnSiteToolkit
//
//  Created by Kolton Fisher on 5/1/26.
//

import Foundation

struct Customer: Identifiable {
    let id: Int
    let name: String
    let mainContactName: String
    let mainContactEmail: String
    let mainContactPhone: String
    let mainSiteId: Int?
    let notes: String
}
