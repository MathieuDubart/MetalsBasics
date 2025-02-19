//
//  View+ColorEffect.swift
//  MetalBasics
//
//  Created by Mathieu Dubart on 19/02/2025.
//

import SwiftUI

extension View {
    func colorShader() -> some View {
        modifier(ColorShader())
    }
    
    func sizeAwareColorShader() -> some View {
        modifier(SizeAwareColorShader())
    }
    
    func timeVaryingColorShader() -> some View {
        modifier(TimeVaryingColorShader())
    }
}

// Applique un shader sur tout l'écran (n'a pas conscience de la taille de l'écran)
struct ColorShader: ViewModifier {
    func body(content: Content) -> some View {
        content.colorEffect(ShaderLibrary.color())
    }
}

/**
 * content.visualEffect{}  permet de d'appliquer le shader sur le content en prenant en paramètre sa taille (proxy.size)
 */

struct SizeAwareColorShader: ViewModifier {
    func body (content: Content) -> some View {
        content.visualEffect { content, proxy in
            content.colorEffect(ShaderLibrary.sizeAwareColor(
                .float2(proxy.size)
            ))
        }
    }
}

struct TimeVaryingColorShader: ViewModifier {
    private var startDate: Date = Date()
    
    func body(content: Content) -> some View {
        // Timeline view permet d'injecter du temps dans notre shader
        TimelineView(.animation) { _ in
            content.visualEffect { content, proxy in
                content
                    .colorEffect(
                        ShaderLibrary.timeVaryingColor(
                            .float2(proxy.size),
                            .float(startDate.timeIntervalSinceNow)
                        )
                    )
            }
        }
    }
}
