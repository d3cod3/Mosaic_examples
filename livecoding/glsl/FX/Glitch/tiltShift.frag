#version 150

uniform sampler2DRect tex0;
uniform float param1f0;//shift@

uniform vec2 resolution;
uniform float time;

in vec2 texCoordVarying;
out vec4 outputColor;

void main() {

    float v = param1f0/10.0;

    vec2 vUv = texCoordVarying;
    vec4 sum = vec4( 0.0 );

    float vv = v * abs( 1.0 - vUv.y );

    sum += texture( tex0, vec2( vUv.x, vUv.y - 4.0 * vv ) ) * 0.051;
    sum += texture( tex0, vec2( vUv.x, vUv.y - 3.0 * vv ) ) * 0.0918;
    sum += texture( tex0, vec2( vUv.x, vUv.y - 2.0 * vv ) ) * 0.12245;
    sum += texture( tex0, vec2( vUv.x, vUv.y - 1.0 * vv ) ) * 0.1531;
    sum += texture( tex0, vec2( vUv.x, vUv.y ) ) * 0.1633;
    sum += texture( tex0, vec2( vUv.x, vUv.y + 1.0 * vv ) ) * 0.1531;
    sum += texture( tex0, vec2( vUv.x, vUv.y + 2.0 * vv ) ) * 0.12245;
    sum += texture( tex0, vec2( vUv.x, vUv.y + 3.0 * vv ) ) * 0.0918;
    sum += texture( tex0, vec2( vUv.x, vUv.y + 4.0 * vv ) ) * 0.051;

    outputColor = sum;
}
