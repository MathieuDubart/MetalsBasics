//
//  ContentView.swift
//  MetalBasics
//
//  Created by Mathieu Dubart on 19/02/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .font(.largeTitle)
            .fontWeight(.bold)
            .kerning(2)
            .foregroundStyle(.green)
            .wigglyShader()
    }
}

#Preview {
    ContentView()
}
