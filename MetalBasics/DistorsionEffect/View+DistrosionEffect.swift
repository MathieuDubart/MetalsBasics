//
//  View+DistrosionEffect.swift
//  MetalBasics
//
//  Created by Mathieu Dubart on 19/02/2025.
//

import SwiftUI

extension View {
    func distortionShader() -> some View {
        modifier(DistortionEffect())
    }
    
    func wigglyShader() -> some View {
        modifier(WigglyEffect())
    }
}

struct DistortionEffect: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 100)
            .drawingGroup() // pour éviter que l'image ne sorte de la zone dessinable et qu'elle soit coupée.
            .distortionEffect(
                ShaderLibrary.distortion(),
                maxSampleOffset: CGSize(width: 100, height: 0) // maxSampleOffset warns SwiftUI that the shader function will try to offset the pixels from their original location
            )
    }
}

struct WigglyEffect: ViewModifier {
    private let startDate = Date()
    
    func body(content: Content) -> some View {
        TimelineView(.animation) { _ in
            content
                .padding(.vertical, 50)
                .drawingGroup()
                .distortionEffect(
                    ShaderLibrary.wiggly(
                        .float(startDate.timeIntervalSinceNow)),
                    maxSampleOffset: CGSize(width: 0, height: 50)
                )
        }
    }
}
