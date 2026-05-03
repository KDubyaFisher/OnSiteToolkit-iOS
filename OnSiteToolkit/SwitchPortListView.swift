//
//  SwitchPortListView.swift
//  OnSiteToolkit
//
//  Created by Kolton Fisher on 5/3/26.
//

import SwiftUI

struct SwitchPortListView: View {
    let equipment: Equipment

    private var ports: [SwitchPort] {
        InventoryData.ports(for: equipment)
    }

    var body: some View {
        List {
            if ports.isEmpty {
                Text("No ports added.")
                    .foregroundStyle(.secondary)
            } else {
                ForEach(ports) { port in
                    NavigationLink {
                        SwitchPortDetailView(port: port)
                    } label: {
                        SwitchPortRowView(port: port)
                    }
                }
            }
        }
        .navigationTitle("Ports")
    }
}

struct SwitchPortRowView: View {
    let port: SwitchPort

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(port.portName)
                    .font(.headline)

                Spacer()

                Text(port.status.rawValue)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Text(port.connectedDevice)
                .font(.subheadline)
                .foregroundStyle(.secondary)

            if !port.vlan.isEmpty {
                Text("VLAN \(port.vlan)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    NavigationStack {
        SwitchPortListView(equipment: InventoryData.equipment[0])
    }
}
