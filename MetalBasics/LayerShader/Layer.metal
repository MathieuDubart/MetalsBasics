//
//  View+LayerEffect.metal
//  MetalBasics
//
//  Created by Mathieu Dubart on 19/02/2025.
//

#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>
using namespace metal;

[[ stitchable ]]
half4 pixellate(float2 position, SwiftUI::Layer layer, float size, float time) {
    float sample_x = sin(time) + size * round(position.x/size);
    float sample_y = cos(time) + size * round(position.y/size);
    return layer.sample(float2(sample_x, sample_y));
}
