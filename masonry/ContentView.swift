//
//  ContentView.swift
//  masonry
//
//  Created by Shaan on 22/05/25.
//
import SwiftUI
import WaterfallGrid

struct MasonryItem: Identifiable {
    let id = UUID()
    let imageName: String
    let height: CGFloat
}

struct ContentView: View {
    let imageNames = (1...6).map { "image\($0)" }
    
    var items: [MasonryItem] {
        (0..<15).map { index in
            MasonryItem(
                imageName: imageNames[index % imageNames.count],
                height: CGFloat.random(in: 130...300)
            )
        }
    }

    var body: some View {
        NavigationView {
            ScrollView {
                WaterfallGrid(items) { item in
                    GeometryReader { geometry in
                        Image(item.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width, height: item.height)
                            .clipped()
                            .cornerRadius(12)
                            .shadow(radius: 5)
                    }
                    .frame(height: item.height)
                }
                .gridStyle(columns: 2, spacing: 10, animation: .easeInOut)
                .padding()
            }
            .navigationTitle("CARTOON")
        }
    }
}

#Preview {
    ContentView()
}
