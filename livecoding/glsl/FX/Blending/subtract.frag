#version 150

uniform sampler2DRect tex0;
uniform sampler2DRect tex1;

uniform vec2 resolution;
uniform float time;

in vec2 texCoordVarying;
out vec4 outputColor;

void main(){
	vec4 color0 = texture(tex0, texCoordVarying);
	vec4 color1 = texture(tex1, texCoordVarying);

	outputColor = vec4(abs(color0 - color1).rgb,1.0);
}
