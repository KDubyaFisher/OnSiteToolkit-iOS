//
//  CIDRCalculatorView.swift
//  OnSiteToolkit
//
//  Created by Kolton Fisher on 4/27/26.
//

import SwiftUI

struct CIDRCalculatorView: View {
    @State private var ipAddress: String = ""
    @State private var cidrPrefix: String = ""

    var body: some View {
        Form {
            Section("Network Input") {
                TextField("IP Address", text: $ipAddress)
                    .keyboardType(.numbersAndPunctuation)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()

                TextField("CIDR Prefix", text: $cidrPrefix)
                    .keyboardType(.numberPad)
            }

            Section {
                Button("Calculate") {
                    // Subnet calculation logic will be added in a later commit.
                }
            }

            Section("Results") {
                Text("Subnet results will appear here.")
                    .foregroundStyle(.secondary)
            }
        }
        .navigationTitle("CIDR Calculator")
    }
}

#Preview {
    NavigationStack {
        CIDRCalculatorView()
    }
}
