//
//  Color.metal
//  MetalBasics
//
//  Created by Mathieu Dubart on 19/02/2025.
//

#include <metal_stdlib>
using namespace metal;

[[ stitchable ]]
half4 color(float2 position, half4 color) {
    // ici, la couleur est calculé par rapport à la position absolue du pixel sur l'écran
    return half4(position.x/255.0, position.y/255.0, 0.0, 1.0);
}


[[ stitchable ]]
half4 sizeAwareColor(float2 position, half4 color, float2 proxySize) {
    // ici, la couleur est calculé par rapport à la position horizontale ou verticale relative du pixel sur l'écran
    return half4(position.x/proxySize.x, position.y/proxySize.x, position.x/proxySize.y, 1.0);
}

// creates a sinusoidal wave
float oscillate(float f) {
    //return 0 to 1 values for rgb
    return 0.5 * (sin(f) + 1);
}

[[ stitchable ]]
half4 timeVaryingColor(float2 position, half4 color, float2 proxySize, float time) {
    // M_PI_F = pi en float
    return half4(oscillate(2 * time + position.x/proxySize.x),
                 oscillate(4 * time + position.y/proxySize.y),
                 oscillate(-2 * time + position.x/proxySize.y),
                 1.0);
}
