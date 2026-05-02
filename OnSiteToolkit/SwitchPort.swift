//
//  SwitchPort.swift
//  OnSiteToolkit
//
//  Created by Kolton Fisher on 5/1/26.
//


import Foundation

struct SwitchPort: Identifiable {
    let id: Int
    let equipmentId: Int
    let portName: String
    let connectedDevice: String
    let connectedDeviceIp: String
    let vlan: String
    let status: SwitchPortStatus
    let notes: String
}

enum SwitchPortStatus: String {
    case active = "Active"
    case available = "Available"
    case disabled = "Disabled"
    case unknown = "Unknown"
}