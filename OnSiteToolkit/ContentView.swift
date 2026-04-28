//
//  ContentView.swift
//  OnSiteToolkit
//
//  Created by Kolton Fisher on 4/27/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    Text("CIDR Calculator")
                        .navigationTitle("CIDR Calculator")
                } label: {
                    ToolRowView(
                        title: "CIDR Calculator",
                        subtitle: "Calculate subnet details from an IP address and CIDR prefix.",
                        icon: "network"
                    )
                }

                NavigationLink {
                    Text("Common Ports")
                        .navigationTitle("Common Ports")
                } label: {
                    ToolRowView(
                        title: "Common Ports",
                        subtitle: "Search common network ports and services.",
                        icon: "list.bullet.rectangle"
                    )
                }

                NavigationLink {
                    Text("Troubleshooting Checklists")
                        .navigationTitle("Checklists")
                } label: {
                    ToolRowView(
                        title: "Troubleshooting Checklists",
                        subtitle: "Follow guided steps for common onsite issues.",
                        icon: "checklist"
                    )
                }
            }
            .navigationTitle("OnSite Toolkit")
        }
    }
}

struct ToolRowView: View {
    let title: String
    let subtitle: String
    let icon: String

    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: icon)
                .font(.title2)
                .frame(width: 32)
                .foregroundStyle(.blue)

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)

                Text(subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    ContentView()
}
