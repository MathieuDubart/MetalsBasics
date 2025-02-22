//
//  Distorsion.metal
//  MetalBasics
//
//  Created by Mathieu Dubart on 19/02/2025.
//
#include <metal_stdlib>
using namespace metal;

[[ stitchable ]]
float2 distortion(float2 position) {
    return float2(position.x*2, position.y);
}

[[ stitchable ]]
float2 wiggly(float2 position, float time) {
    return float2(position.x, position.y+3*(sin(2*time + (position.x/10))));
}
