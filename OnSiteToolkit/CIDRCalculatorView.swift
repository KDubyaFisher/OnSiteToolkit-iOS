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

    @State private var result: SubnetResult?
    @State private var errorMessage: String?

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
                    calculateSubnet()
                }
            }

            if let errorMessage {
                Section("Error") {
                    Text(errorMessage)
                        .foregroundStyle(.red)
                }
            }

            if let result {
                Section("Results") {
                    ResultRow(label: "IP Address", value: result.ipAddress)
                    ResultRow(label: "CIDR", value: "/\(result.cidr)")
                    ResultRow(label: "Subnet Mask", value: result.subnetMask)
                    ResultRow(label: "Wildcard Mask", value: result.wildcardMask)
                    ResultRow(label: "Network Address", value: result.networkAddress)
                    ResultRow(label: "Broadcast Address", value: result.broadcastAddress)
                    ResultRow(label: "First Usable", value: result.firstUsableAddress)
                    ResultRow(label: "Last Usable", value: result.lastUsableAddress)
                    ResultRow(label: "Total Addresses", value: "\(result.totalAddresses)")
                    ResultRow(label: "Usable Hosts", value: "\(result.usableHosts)")
                }
            } else if errorMessage == nil {
                Section("Results") {
                    Text("Subnet results will appear here.")
                        .foregroundStyle(.secondary)
                }
            }
        }
        .navigationTitle("CIDR Calculator")
    }

    private func calculateSubnet() {
        errorMessage = nil
        result = nil

        guard let cidr = Int(cidrPrefix) else {
            errorMessage = "CIDR prefix must be a number between 0 and 32."
            return
        }

        do {
            result = try SubnetCalculator.calculate(
                ipAddress: ipAddress,
                cidr: cidr
            )
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}

struct ResultRow: View {
    let label: String
    let value: String

    var body: some View {
        HStack {
            Text(label)

            Spacer()

            Text(value)
                .foregroundStyle(.secondary)
                .textSelection(.enabled)
        }
    }
}

#Preview {
    NavigationStack {
        CIDRCalculatorView()
    }
}
