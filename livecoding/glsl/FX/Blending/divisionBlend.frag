#version 150

uniform sampler2DRect tex0;
uniform sampler2DRect tex1;

uniform vec2 resolution;
uniform float time;

in vec2 texCoordVarying;
out vec4 outputColor;

void main(void) {
    vec2 coord = texCoordVarying;
    vec4 base = texture(tex0, coord);

    vec4 blend = texture(tex1, coord);

    vec3 compose = base.rgb / blend.rgb;
    compose = compose * compose * compose * compose * compose;
    outputColor = vec4(compose, base.a);
}
