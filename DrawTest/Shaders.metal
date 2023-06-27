//
//  Shaders.metal
//  DrawTest
//
//  Created by Salman Ahmed on 27/06/2023.
//

// File for Metal kernel and shader functions

#include <metal_stdlib>
#include <simd/simd.h>

// Including header shared between this Metal shader code and Swift/C code executing Metal API commands
#import "ShaderTypes.h"

using namespace metal;

typedef struct
{
    float2 position [[attribute(0)]];
} Vertex;

typedef struct
{
    float4 position [[position]];
} ColorInOut;

vertex ColorInOut vertexShader(Vertex in [[stage_in]],
                               constant Uniforms & uniforms [[ buffer(1) ]])
{
    ColorInOut out;

    float4 position = float4(in.position, 0.0, 1.0);
    out.position = position;

    return out;
}

fragment float4 fragmentShader(ColorInOut in [[stage_in]],
                               constant Uniforms & uniforms [[ buffer(1) ]])
{
    return float4(1.0, 1.0, 1.0, 1.0);
}
