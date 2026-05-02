//
//  SiteDetailView.swift
//  OnSiteToolkit
//
//  Created by Kolton Fisher on 5/2/26.
//

import SwiftUI

struct SiteDetailView: View {
    let site: Site

    private var equipment: [Equipment] {
        InventoryData.equipment(for: site)
    }

    var body: some View {
        List {
            Section("Address") {
                Text(site.fullAddress)
                    .foregroundStyle(.secondary)
                    .textSelection(.enabled)
            }

            if !site.notes.isEmpty {
                Section("Notes") {
                    Text(site.notes)
                        .foregroundStyle(.secondary)
                }
            }

            Section("Equipment") {
                if equipment.isEmpty {
                    Text("No equipment added.")
                        .foregroundStyle(.secondary)
                } else {
                    ForEach(equipment) { item in
                        NavigationLink {
                            Text(item.name)
                                .navigationTitle(item.name)
                        } label: {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(item.name)
                                    .font(.headline)

                                Text("\(item.manufacturer) \(item.model)")
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)

                                Text(item.location)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
        }
        .navigationTitle(site.name)
    }
}

#Preview {
    NavigationStack {
        SiteDetailView(site: InventoryData.sites[0])
    }
}
