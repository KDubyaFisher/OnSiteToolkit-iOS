//
//  Equipment.swift
//  OnSiteToolkit
//
//  Created by Kolton Fisher on 5/1/26.
//


import Foundation

struct Equipment: Identifiable {
    let id: Int
    let siteId: Int
    let equipmentTypeId: Int
    let name: String
    let manufacturer: String
    let model: String
    let ipAddress: String
    let macAddress: String
    let serialNumber: String
    let dateInstalled: String
    let lastUpdated: String
    let location: String
    let notes: String
}