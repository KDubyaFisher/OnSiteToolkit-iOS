//
//  PortsReferenceView.swift
//  OnSiteToolkit
//
//  Created by Kolton Fisher on 4/30/26.
//

import SwiftUI

struct PortsReferenceView: View {
    @State private var searchText: String = ""

    private var filteredPorts: [PortReference] {
        if searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return PortReference.commonPorts
        }

        return PortReference.commonPorts.filter { port in
            port.service.localizedCaseInsensitiveContains(searchText) ||
            port.protocolName.localizedCaseInsensitiveContains(searchText) ||
            port.description.localizedCaseInsensitiveContains(searchText) ||
            String(port.number).contains(searchText)
        }
    }

    var body: some View {
        List(filteredPorts) { port in
            PortRowView(port: port)
        }
        .navigationTitle("Common Ports")
        .searchable(text: $searchText, prompt: "Search ports")
    }
}

struct PortRowView: View {
    let port: PortReference

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("\(port.number)")
                    .font(.headline)

                Text(port.protocolName)
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(.thinMaterial)
                    .clipShape(Capsule())

                Spacer()
            }

            Text(port.service)
                .font(.subheadline)
                .fontWeight(.semibold)

            Text(port.description)
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    NavigationStack {
        PortsReferenceView()
    }
}
