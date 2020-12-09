#version 150

uniform sampler2DRect tex0;
uniform sampler2DRect tex1;

uniform float param1f0;//mix@

uniform vec2 resolution;
uniform float time;

in vec2 texCoordVarying;
out vec4 outputColor;

void main(){

	vec4 base = texture(tex0, texCoordVarying);
	vec4 overlay = texture(tex1, texCoordVarying);

	float mixturePercent = param1f0/10.0;

	outputColor = vec4(mix(base.rgb, overlay.rgb, overlay.a * mixturePercent), base.a);

}
