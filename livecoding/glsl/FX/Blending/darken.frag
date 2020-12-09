#version 150

uniform sampler2DRect tex0;
uniform sampler2DRect tex1;

uniform vec2 resolution;
uniform float time;

in vec2 texCoordVarying;
out vec4 outputColor;

void main(){
	vec4 base = texture(tex0, texCoordVarying);
	vec4 overlayer = texture(tex1, texCoordVarying);

	outputColor = vec4(min(overlayer.rgb * base.a, base.rgb * overlayer.a) + overlayer.rgb * (0.5) + base.rgb * (1.0 - overlayer.a), 1.0);
}
