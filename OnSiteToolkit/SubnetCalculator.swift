//
//  SubnetCalculator.swift
//  OnSiteToolkit
//
//  Created by Kolton Fisher on 4/27/26.
//

import Foundation

enum SubnetCalculatorError: LocalizedError {
    case invalidIPAddress
    case invalidCIDRPrefix

    var errorDescription: String? {
        switch self {
        case .invalidIPAddress:
            return "Enter a valid IPv4 address, such as 192.168.1.10."
        case .invalidCIDRPrefix:
            return "CIDR prefix must be a number between 0 and 32."
        }
    }
}

struct SubnetCalculator {
    static func calculate(ipAddress: String, cidr: Int) throws -> SubnetResult {
        guard cidr >= 0 && cidr <= 32 else {
            throw SubnetCalculatorError.invalidCIDRPrefix
        }

        let ipInteger = try ipv4ToInteger(ipAddress)

        let subnetMask = calculateSubnetMask(cidr: cidr)
        let wildcardMask = ~subnetMask
        let networkAddress = ipInteger & subnetMask
        let broadcastAddress = networkAddress | wildcardMask

        let totalAddresses = calculateTotalAddresses(cidr: cidr)

        let firstUsableAddress: UInt32
        let lastUsableAddress: UInt32
        let usableHosts: UInt64

        if cidr == 32 {
            firstUsableAddress = networkAddress
            lastUsableAddress = networkAddress
            usableHosts = 1
        } else if cidr == 31 {
            firstUsableAddress = networkAddress
            lastUsableAddress = broadcastAddress
            usableHosts = 2
        } else {
            firstUsableAddress = networkAddress + 1
            lastUsableAddress = broadcastAddress - 1
            usableHosts = totalAddresses - 2
        }

        return SubnetResult(
            ipAddress: ipAddress,
            cidr: cidr,
            subnetMask: integerToIPv4(subnetMask),
            wildcardMask: integerToIPv4(wildcardMask),
            networkAddress: integerToIPv4(networkAddress),
            broadcastAddress: integerToIPv4(broadcastAddress),
            firstUsableAddress: integerToIPv4(firstUsableAddress),
            lastUsableAddress: integerToIPv4(lastUsableAddress),
            totalAddresses: totalAddresses,
            usableHosts: usableHosts
        )
    }

    private static func ipv4ToInteger(_ ipAddress: String) throws -> UInt32 {
        let parts = ipAddress.split(separator: ".")

        guard parts.count == 4 else {
            throw SubnetCalculatorError.invalidIPAddress
        }

        var result: UInt32 = 0

        for part in parts {
            guard let octet = UInt32(part), octet <= 255 else {
                throw SubnetCalculatorError.invalidIPAddress
            }

            result = (result << 8) + octet
        }

        return result
    }

    private static func integerToIPv4(_ value: UInt32) -> String {
        let firstOctet = (value >> 24) & 255
        let secondOctet = (value >> 16) & 255
        let thirdOctet = (value >> 8) & 255
        let fourthOctet = value & 255

        return "\(firstOctet).\(secondOctet).\(thirdOctet).\(fourthOctet)"
    }

    private static func calculateSubnetMask(cidr: Int) -> UInt32 {
        if cidr == 0 {
            return 0
        }

        return UInt32.max << UInt32(32 - cidr)
    }

    private static func calculateTotalAddresses(cidr: Int) -> UInt64 {
        UInt64(1) << UInt64(32 - cidr)
    }
}
