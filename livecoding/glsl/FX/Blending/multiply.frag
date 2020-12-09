#version 150

uniform sampler2DRect tex0;
uniform sampler2DRect tex1;

uniform vec2 resolution;
uniform float time;

in vec2 texCoordVarying;
out vec4 outputColor;

void main(){

	vec4 base = texture(tex0, texCoordVarying);
	vec4 overlay = texture(tex1, texCoordVarying);

	outputColor = base * overlay + base * (1.0 - overlay.a) + overlay * (1.0 - base.a);

}
