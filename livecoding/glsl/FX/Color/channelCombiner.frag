#version 150

uniform sampler2DRect tex0;
uniform sampler2DRect tex1;
uniform sampler2DRect tex2;
uniform sampler2DRect tex3;

uniform vec2 resolution;
uniform float time;

in vec2 texCoordVarying;
out vec4 outputColor;

void main(void){
	vec2 st = texCoordVarying;

	float r = texture(tex0, st).r;
	float g = texture(tex1, st).r;
	float b = texture(tex2, st).r;
	float a = texture(tex3, st).r;

	outputColor = vec4(r,g,b,a);
}
