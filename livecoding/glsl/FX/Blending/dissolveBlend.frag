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

	vec4 color;
	if (texCoordVarying.x > 0.5) color = base;
	else color = overlay;

	outputColor = mix(base, overlay, mixturePercent);

}
