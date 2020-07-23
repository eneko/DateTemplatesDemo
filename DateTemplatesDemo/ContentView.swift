//
//  ContentView.swift
//  DateTemplatesDemo
//
//  Created by Eneko Alonso on 7/23/20.
//

import SwiftUI
import DateTemplates

struct Entry: Identifiable {
    let id: UUID
    let title: String
    let body: String
    let timestamp: Date
}

let entries = [
    Entry(id: UUID(),
          title: "Bob Jones Trail",
          body: """
            The Bob Jones Trail is the City to the Sea bike trail that follows the
            Pacific Coast Railroad right-of-way along the San Luis Obispo Creek to Avila Beach.
            """,
          timestamp: Date().addingTimeInterval(10000 * Double.random(in: -10...10))),
    Entry(id: UUID(),
          title: "Cerro San Luis",
          body: """
            Cerro San Luis is a member of the Morros, or Nine Sisters, a chain of prominent
            volcanic peaks stretching east from Morro Bay.
            """,
          timestamp: Date().addingTimeInterval(10000 * Double.random(in: -10...10)))
]

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(entries) { entry in
                    HStack(spacing: 16) {
                        Image(systemName: "person.crop.circle")
                            .font(.system(size: 40))
                            .foregroundColor(.gray)
                        VStack(alignment: .leading) {
                            Text(entry.title)
                                .font(.headline)
                            Text(
                                DateTemplate()
                                    .dayOfWeek(.full)
                                    .month(.abbreviated)
                                    .day()
                                    .time()
                                    .localizedString(from: entry.timestamp)
                            )
                            .font(.caption)
                            .foregroundColor(.gray)
                            HStack(spacing: 2) {
                                Image(systemName: "star.fill")
                                Image(systemName: "star.fill")
                                Image(systemName: "star.fill")
                                Image(systemName: "star.fill")
                                Image(systemName: "star.fill")
                            }
                            .foregroundColor(.yellow)
                            .font(.caption2)
                            Text(entry.body)
                                .font(.subheadline)
                                .lineLimit(3)
                        }
                    }
                }
            }
            .navigationTitle("Reviews")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
