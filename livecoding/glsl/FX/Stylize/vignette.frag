#version 150

uniform sampler2DRect tex0;
uniform float param1f0;//start@
uniform float param1f1;//end@

uniform vec2 resolution;

in vec2 texCoordVarying;
out vec4 outputColor;

void main() {

    vec2 vignetteCenter = vec2(resolution.x/2.0,resolution.y/2.0);

    vec3 vignetteColor = vec3(0.0,0.0,0.0);

    float vignetteStart = param1f0*resolution.x/10.0;
    float vignetteEnd   = param1f1*resolution.x/10.0;

    vec2 uv = texCoordVarying;
    vec4 sourceImageColor = texture(tex0, uv);
    float d = distance(uv, vec2(vignetteCenter.x, vignetteCenter.y));
    float percent = smoothstep(vignetteStart, vignetteEnd, d);
    outputColor = vec4(mix(sourceImageColor.rgb, vignetteColor, percent), sourceImageColor.a);
}
