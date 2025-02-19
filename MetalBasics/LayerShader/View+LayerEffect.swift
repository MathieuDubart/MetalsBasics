//
//  View+LayerEffect.swift
//  MetalBasics
//
//  Created by Mathieu Dubart on 19/02/2025.
//

import SwiftUI

extension View {
    func pixellationShader(pixelSize: Float = 8) -> some View {
        modifier(PixellationShader(pixelSize: pixelSize))
    }
}

struct PixellationShader: ViewModifier {
    let pixelSize: Float
    let startDate: Date = Date()
    
    func body(content: Content) -> some View {
        TimelineView(.animation) { _ in
            content
                .layerEffect(
                    ShaderLibrary.pixellate(
                        .float(pixelSize),
                        .float(startDate.timeIntervalSinceNow)
                    ), maxSampleOffset: .zero
                )
        }
    }
}
