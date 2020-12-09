#version 150

uniform sampler2DRect tex0;
uniform float param1f0;//thresh@

uniform vec2 resolution;
uniform float time;

in vec2 texCoordVarying;
out vec4 outputColor;

void main(void) {
    vec2 coord = texCoordVarying;
    vec4 source = texture(tex0, coord);
    float a = source.a;

    float u_threshold = param1f0/10.0;

    vec3 grayscale = vec3(source.r * 0.299 + source.g * 0.587 + source.b * 0.114);

    vec3 binarization = vec3(step(u_threshold, grayscale));
    vec4 finalColor = vec4(binarization, a);
    outputColor = finalColor;
}
