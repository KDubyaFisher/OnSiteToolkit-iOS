//
//  EquipmentDetailView.swift
//  OnSiteToolkit
//
//  Created by Kolton Fisher on 5/3/26.
//

import SwiftUI

struct EquipmentDetailView: View {
    let equipment: Equipment

    private var equipmentTypeName: String {
        InventoryData.equipmentTypeName(for: equipment)
    }

    private var isSwitch: Bool {
        InventoryData.isSwitch(equipment)
    }

    var body: some View {
        List {
            Section("Overview") {
                DetailRow(label: "Type", value: equipmentTypeName)
                DetailRow(label: "Manufacturer", value: equipment.manufacturer)
                DetailRow(label: "Model", value: equipment.model)
                DetailRow(label: "Location", value: equipment.location)
            }

            Section("Network") {
                DetailRow(label: "IP Address", value: equipment.ipAddress)
                DetailRow(label: "MAC Address", value: equipment.macAddress)
            }

            Section("Asset Information") {
                DetailRow(label: "Serial Number", value: equipment.serialNumber)
                DetailRow(label: "Date Installed", value: equipment.dateInstalled)
                DetailRow(label: "Last Updated", value: equipment.lastUpdated)
            }

            if !equipment.notes.isEmpty {
                Section("Notes") {
                    Text(equipment.notes)
                        .foregroundStyle(.secondary)
                        .textSelection(.enabled)
                }
            }

            if isSwitch {
                Section {
                    NavigationLink {
                        SwitchPortListView(equipment: equipment)
                    } label: {
                        Label("View Ports", systemImage: "cable.connector")
                    }
                }
            }
        }
        .navigationTitle(equipment.name)
    }
}

#Preview {
    NavigationStack {
        EquipmentDetailView(equipment: InventoryData.equipment[0])
    }
}
