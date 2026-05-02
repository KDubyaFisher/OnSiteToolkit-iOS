//
//  InventoryData.swift
//  OnSiteToolkit
//
//  Created by Kolton Fisher on 5/1/26.
//



import Foundation

struct InventoryData {
    static let customers: [Customer] = [
        Customer(
            id: 1,
            name: "Demo Customer",
            mainContactName: "Alex Johnson",
            mainContactEmail: "alex.johnson@example.com",
            mainContactPhone: "555-0100",
            mainSiteId: 1,
            notes: "Primary demo customer for local inventory testing."
        ),
        Customer(
            id: 2,
            name: "Second Demo Customer",
            mainContactName: "Morgan Smith",
            mainContactEmail: "morgan.smith@example.com",
            mainContactPhone: "555-0200",
            mainSiteId: 4,
            notes: "Secondary demo customer."
        )
    ]

    static let sites: [Site] = [
        Site(
            id: 1,
            customerId: 1,
            name: "Main Office",
            addressLine1: "123 Main Street",
            addressLine2: "Suite 200",
            city: "Houston",
            state: "TX",
            zipCode: "77002",
            notes: "Main site for Demo Customer."
        ),
        Site(
            id: 2,
            customerId: 1,
            name: "Admin",
            addressLine1: "500 Admin Drive",
            addressLine2: "",
            city: "Houston",
            state: "TX",
            zipCode: "77003",
            notes: "Administrative office."
        ),
        Site(
            id: 3,
            customerId: 1,
            name: "Auxiliary",
            addressLine1: "750 Auxiliary Road",
            addressLine2: "",
            city: "Houston",
            state: "TX",
            zipCode: "77004",
            notes: "Auxiliary site."
        ),
        Site(
            id: 4,
            customerId: 2,
            name: "Main Site",
            addressLine1: "900 Demo Parkway",
            addressLine2: "",
            city: "Houston",
            state: "TX",
            zipCode: "77005",
            notes: "Main site for Second Demo Customer."
        )
    ]

    static let equipmentTypes: [EquipmentType] = [
        EquipmentType(id: 1, name: "Switch"),
        EquipmentType(id: 2, name: "Access Point"),
        EquipmentType(id: 3, name: "Firewall"),
        EquipmentType(id: 4, name: "Controller"),
        EquipmentType(id: 5, name: "UPS")
    ]

    static let equipment: [Equipment] = [
        Equipment(
            id: 1,
            siteId: 1,
            equipmentTypeId: 1,
            name: "MDF Core Switch",
            manufacturer: "RUCKUS",
            model: "ICX 7150-48P",
            ipAddress: "192.168.10.2",
            macAddress: "A1:B2:C3:D4:E5:F6",
            serialNumber: "RCKS123456",
            dateInstalled: "2026-05-01",
            lastUpdated: "2026-05-01",
            location: "MDF Rack",
            notes: "Main access switch for the office."
        ),
        Equipment(
            id: 2,
            siteId: 1,
            equipmentTypeId: 1,
            name: "IDF-1 Access Switch",
            manufacturer: "RUCKUS",
            model: "ICX 7150-24P",
            ipAddress: "192.168.10.3",
            macAddress: "A1:B2:C3:D4:E5:F7",
            serialNumber: "RCKS654321",
            dateInstalled: "2026-05-01",
            lastUpdated: "2026-05-01",
            location: "IDF-1 Rack",
            notes: "Access switch serving front office ports."
        )
    ]

    static let switchPorts: [SwitchPort] = [
        SwitchPort(
            id: 1,
            equipmentId: 1,
            portName: "Gi1/0/1",
            connectedDevice: "Firewall LAN",
            connectedDeviceIp: "192.168.10.1",
            vlan: "10",
            status: .active,
            notes: "Uplink to firewall."
        ),
        SwitchPort(
            id: 2,
            equipmentId: 1,
            portName: "Gi1/0/2",
            connectedDevice: "Front Desk PC",
            connectedDeviceIp: "192.168.10.25",
            vlan: "20",
            status: .active,
            notes: "User workstation."
        ),
        SwitchPort(
            id: 3,
            equipmentId: 1,
            portName: "Gi1/0/3",
            connectedDevice: "Available",
            connectedDeviceIp: "",
            vlan: "",
            status: .available,
            notes: "Open port."
        ),
        SwitchPort(
            id: 4,
            equipmentId: 2,
            portName: "Gi1/0/1",
            connectedDevice: "Lobby Access Point",
            connectedDeviceIp: "192.168.20.15",
            vlan: "20",
            status: .active,
            notes: "PoE access point connection."
        )
    ]

    static func sites(for customer: Customer) -> [Site] {
        sites.filter { $0.customerId == customer.id }
    }

    static func equipment(for site: Site) -> [Equipment] {
        equipment.filter { $0.siteId == site.id }
    }

    static func ports(for equipment: Equipment) -> [SwitchPort] {
        switchPorts.filter { $0.equipmentId == equipment.id }
    }

    static func equipmentTypeName(for equipment: Equipment) -> String {
        equipmentTypes.first { $0.id == equipment.equipmentTypeId }?.name ?? "Unknown"
    }

    static func isSwitch(_ equipment: Equipment) -> Bool {
        equipmentTypeName(for: equipment) == "Switch"
    }
}