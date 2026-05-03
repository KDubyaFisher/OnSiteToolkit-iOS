//
//  SwitchPortDetailView.swift
//  OnSiteToolkit
//
//  Created by Kolton Fisher on 5/3/26.
//

import SwiftUI

struct SwitchPortDetailView: View {
    let port: SwitchPort

    var body: some View {
        List {
            Section("Port") {
                DetailRow(label: "Port Name", value: port.portName)
                DetailRow(label: "Status", value: port.status.rawValue)
            }

            Section("Connected Device") {
                DetailRow(label: "Device", value: port.connectedDevice)
                DetailRow(label: "Device IP", value: port.connectedDeviceIp)
            }

            Section("Network") {
                DetailRow(label: "VLAN", value: port.vlan)
            }

            if !port.notes.isEmpty {
                Section("Notes") {
                    Text(port.notes)
                        .foregroundStyle(.secondary)
                        .textSelection(.enabled)
                }
            }
        }
        .navigationTitle(port.portName)
    }
}

#Preview {
    NavigationStack {
        SwitchPortDetailView(port: InventoryData.switchPorts[0])
    }
}
