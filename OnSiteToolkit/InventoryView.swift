//
//  InventoryView.swift
//  OnSiteToolkit
//
//  Created by Kolton Fisher on 5/1/26.
//


import SwiftUI

struct InventoryView: View {
    var body: some View {
        List(InventoryData.customers) { customer in
            NavigationLink {
                Text(customer.name)
                    .navigationTitle(customer.name)
            } label: {
                CustomerRowView(customer: customer)
            }
        }
        .navigationTitle("Inventory")
    }
}

struct CustomerRowView: View {
    let customer: Customer

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(customer.name)
                .font(.headline)

            Text(customer.mainContactName)
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text(customer.mainContactPhone)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    NavigationStack {
        InventoryView()
    }
}