#version 150

uniform sampler2DRect tex0;
uniform float param1f0;//segments@

in vec2 texCoordVarying;
out vec4 outputColor;

void main(){

    float segments = (param1f0*4.0) - 20;

    vec2 uv = texCoordVarying;
    vec2 normed = 2.0 * uv - 1.0;
    float r = length(normed);
    float theta = atan(normed.y / abs(normed.x));
    theta *= segments;

    vec2 newUv = (vec2(r * cos(theta), r * sin(theta)) + 1.0) / 2.0;

    outputColor = texture(tex0, newUv);
}
