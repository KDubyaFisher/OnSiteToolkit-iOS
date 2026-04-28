//
//  SubnetResult.swift
//  OnSiteToolkit
//
//  Created by Kolton Fisher on 4/27/26.
//

import Foundation

struct SubnetResult {
    let ipAddress: String
    let cidr: Int
    let subnetMask: String
    let wildcardMask: String
    let networkAddress: String
    let broadcastAddress: String
    let firstUsableAddress: String
    let lastUsableAddress: String
    let totalAddresses: UInt64
    let usableHosts: UInt64
}
