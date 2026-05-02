//
//  CustomerDetailView.swift
//  OnSiteToolkit
//
//  Created by Kolton Fisher on 5/2/26.
//

import SwiftUI

struct CustomerDetailView: View {
    let customer: Customer

    private var sites: [Site] {
        InventoryData.sites(for: customer)
    }

    var body: some View {
        List {
            Section("Main Contact") {
                DetailRow(label: "Name", value: customer.mainContactName)
                DetailRow(label: "Phone", value: customer.mainContactPhone)
                DetailRow(label: "Email", value: customer.mainContactEmail)
            }

            if !customer.notes.isEmpty {
                Section("Notes") {
                    Text(customer.notes)
                        .foregroundStyle(.secondary)
                }
            }

            Section("Sites") {
                if sites.isEmpty {
                    Text("No sites added.")
                        .foregroundStyle(.secondary)
                } else {
                    ForEach(sites) { site in
                        NavigationLink {
                            SiteDetailView(site: site)
                        } label: {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(site.name)
                                    .font(.headline)

                                Text("\(site.city), \(site.state)")
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
        }
        .navigationTitle(customer.name)
    }
}

struct DetailRow: View {
    let label: String
    let value: String

    var body: some View {
        HStack(alignment: .top) {
            Text(label)

            Spacer()

            Text(value.isEmpty ? "—" : value)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.trailing)
                .textSelection(.enabled)
        }
    }
}

#Preview {
    NavigationStack {
        CustomerDetailView(customer: InventoryData.customers[0])
    }
}
