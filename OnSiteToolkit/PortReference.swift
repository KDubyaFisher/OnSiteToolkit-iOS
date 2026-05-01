//
//  PortReference.swift
//  OnSiteToolkit
//
//  Created by Kolton Fisher on 4/30/26.
//

import Foundation

struct PortReference: Identifiable {
    let id = UUID()
    let number: Int
    let protocolName: String
    let service: String
    let description: String
}

extension PortReference {
    static let commonPorts: [PortReference] = [
        PortReference(
            number: 20,
            protocolName: "TCP",
            service: "FTP Data",
            description: "Used for transferring file data with FTP."
        ),
        PortReference(
            number: 21,
            protocolName: "TCP",
            service: "FTP Control",
            description: "Used for FTP command and control traffic."
        ),
        PortReference(
            number: 22,
            protocolName: "TCP",
            service: "SSH",
            description: "Secure remote shell access."
        ),
        PortReference(
            number: 23,
            protocolName: "TCP",
            service: "Telnet",
            description: "Unencrypted remote shell access."
        ),
        PortReference(
            number: 25,
            protocolName: "TCP",
            service: "SMTP",
            description: "Used for sending email between mail servers."
        ),
        PortReference(
            number: 53,
            protocolName: "TCP/UDP",
            service: "DNS",
            description: "Used for domain name resolution."
        ),
        PortReference(
            number: 67,
            protocolName: "UDP",
            service: "DHCP Server",
            description: "Used by DHCP servers to assign IP configuration."
        ),
        PortReference(
            number: 68,
            protocolName: "UDP",
            service: "DHCP Client",
            description: "Used by DHCP clients to receive IP configuration."
        ),
        PortReference(
            number: 80,
            protocolName: "TCP",
            service: "HTTP",
            description: "Unencrypted web traffic."
        ),
        PortReference(
            number: 110,
            protocolName: "TCP",
            service: "POP3",
            description: "Used to retrieve email from a mail server."
        ),
        PortReference(
            number: 123,
            protocolName: "UDP",
            service: "NTP",
            description: "Used for network time synchronization."
        ),
        PortReference(
            number: 143,
            protocolName: "TCP",
            service: "IMAP",
            description: "Used to retrieve and manage email."
        ),
        PortReference(
            number: 161,
            protocolName: "UDP",
            service: "SNMP",
            description: "Used for network monitoring and management."
        ),
        PortReference(
            number: 389,
            protocolName: "TCP/UDP",
            service: "LDAP",
            description: "Used for directory services."
        ),
        PortReference(
            number: 443,
            protocolName: "TCP",
            service: "HTTPS",
            description: "Encrypted web traffic."
        ),
        PortReference(
            number: 445,
            protocolName: "TCP",
            service: "SMB",
            description: "Used for Windows file sharing and domain services."
        ),
        PortReference(
            number: 3389,
            protocolName: "TCP",
            service: "RDP",
            description: "Used for Microsoft Remote Desktop."
        )
    ]
}
