//
//  TroubleshootingView.swift
//  OnSiteToolkit
//
//  Created by Kolton Fisher on 5/1/26.
//

import SwiftUI

struct TroubleshootingView: View {
    var body: some View {
        List(TroubleshootingChecklist.sampleChecklists) { checklist in
            NavigationLink {
                ChecklistDetailView(checklist: checklist)
            } label: {
                ChecklistRowView(checklist: checklist)
            }
        }
        .navigationTitle("Checklists")
    }
}

struct ChecklistRowView: View {
    let checklist: TroubleshootingChecklist

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(checklist.title)
                .font(.headline)

            Text(checklist.description)
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text("\(checklist.steps.count) steps")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding(.vertical, 6)
    }
}

struct ChecklistDetailView: View {
    let checklist: TroubleshootingChecklist

    @State private var completedStepIDs: Set<UUID> = []

    var body: some View {
        List {
            Section("Overview") {
                Text(checklist.description)
                    .foregroundStyle(.secondary)
            }

            Section("Steps") {
                ForEach(checklist.steps) { step in
                    Button {
                        toggleStep(step.id)
                    } label: {
                        HStack(alignment: .top, spacing: 12) {
                            Image(systemName: completedStepIDs.contains(step.id) ? "checkmark.circle.fill" : "circle")
                                .font(.title3)
                                .foregroundStyle(completedStepIDs.contains(step.id) ? .green : .secondary)

                            Text(step.text)
                                .foregroundStyle(.primary)

                            Spacer()
                        }
                        .padding(.vertical, 4)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .navigationTitle(checklist.title)
    }

    private func toggleStep(_ id: UUID) {
        if completedStepIDs.contains(id) {
            completedStepIDs.remove(id)
        } else {
            completedStepIDs.insert(id)
        }
    }
}

#Preview {
    NavigationStack {
        TroubleshootingView()
    }
}
