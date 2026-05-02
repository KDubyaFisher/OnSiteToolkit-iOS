//
//  TroubleshootingChecklist.swift
//  OnSiteToolkit
//
//  Created by Kolton Fisher on 5/1/26.
//

import Foundation

struct TroubleshootingChecklist: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let steps: [TroubleshootingStep]
}

struct TroubleshootingStep: Identifiable {
    let id = UUID()
    let text: String
}

extension TroubleshootingChecklist {
    static let sampleChecklists: [TroubleshootingChecklist] = [
        TroubleshootingChecklist(
            title: "No Internet",
            description: "Basic steps for troubleshooting loss of internet connectivity.",
            steps: [
                TroubleshootingStep(text: "Confirm whether the issue affects one device or multiple devices."),
                TroubleshootingStep(text: "Check physical link lights at the wall plate, switch, firewall, and modem."),
                TroubleshootingStep(text: "Verify the device has a valid IP address, subnet mask, gateway, and DNS server."),
                TroubleshootingStep(text: "Ping the default gateway."),
                TroubleshootingStep(text: "Ping a public IP address such as 8.8.8.8."),
                TroubleshootingStep(text: "Test DNS resolution by browsing to a website or pinging a domain name."),
                TroubleshootingStep(text: "Power cycle network equipment only if appropriate for the site."),
                TroubleshootingStep(text: "Document test results, affected users, and escalation details.")
            ]
        ),

        TroubleshootingChecklist(
            title: "Wireless Connectivity Issue",
            description: "Steps for troubleshooting weak, unstable, or unavailable Wi-Fi.",
            steps: [
                TroubleshootingStep(text: "Confirm whether the issue affects one user, one area, or the entire site."),
                TroubleshootingStep(text: "Verify the device is connected to the correct SSID."),
                TroubleshootingStep(text: "Check signal strength and distance from the nearest access point."),
                TroubleshootingStep(text: "Confirm the device received a valid IP address."),
                TroubleshootingStep(text: "Test connectivity by pinging the default gateway."),
                TroubleshootingStep(text: "Check for nearby interference or obvious physical obstructions."),
                TroubleshootingStep(text: "Verify access point status in the management portal if available."),
                TroubleshootingStep(text: "Document SSID, location, device type, and test results.")
            ]
        ),

        TroubleshootingChecklist(
            title: "Printer Offline",
            description: "Steps for troubleshooting a network printer that appears offline.",
            steps: [
                TroubleshootingStep(text: "Confirm the printer has power and is not showing a local error."),
                TroubleshootingStep(text: "Check the printer network cable or wireless connection."),
                TroubleshootingStep(text: "Print a network configuration page if available."),
                TroubleshootingStep(text: "Confirm the printer IP address."),
                TroubleshootingStep(text: "Ping the printer from the workstation."),
                TroubleshootingStep(text: "Verify the workstation is using the correct printer IP port."),
                TroubleshootingStep(text: "Restart the print spooler if needed."),
                TroubleshootingStep(text: "Document any driver, queue, or connectivity changes.")
            ]
        ),

        TroubleshootingChecklist(
            title: "Access Control Device Offline",
            description: "Steps for troubleshooting an offline access control device.",
            steps: [
                TroubleshootingStep(text: "Confirm whether the device is offline in the management dashboard."),
                TroubleshootingStep(text: "Check power to the controller or access control device."),
                TroubleshootingStep(text: "Verify network link lights at the device and switch."),
                TroubleshootingStep(text: "Confirm the switch port is active and on the correct VLAN."),
                TroubleshootingStep(text: "Check whether the device is receiving an IP address."),
                TroubleshootingStep(text: "Power cycle the device only if safe and approved."),
                TroubleshootingStep(text: "Verify the device comes back online in the dashboard."),
                TroubleshootingStep(text: "Document the controller, door, switch port, and final status.")
            ]
        ),

        TroubleshootingChecklist(
            title: "Slow Workstation",
            description: "Steps for checking common causes of workstation slowness.",
            steps: [
                TroubleshootingStep(text: "Ask when the slowness started and whether it happens all the time."),
                TroubleshootingStep(text: "Check CPU, memory, disk, and network usage."),
                TroubleshootingStep(text: "Confirm available storage space."),
                TroubleshootingStep(text: "Review startup applications."),
                TroubleshootingStep(text: "Check for pending updates or recent failed updates."),
                TroubleshootingStep(text: "Test whether the issue is local, network-related, or application-specific."),
                TroubleshootingStep(text: "Restart the workstation if appropriate."),
                TroubleshootingStep(text: "Document symptoms, findings, and recommended next steps.")
            ]
        )
    ]
}
