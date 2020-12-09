#version 150

uniform sampler2DRect tex0;
uniform float param1f0;//gamma@

uniform vec2 resolution;
uniform float time;

in vec2 texCoordVarying;
out vec4 outputColor;

void main(void){
	vec2 st = texCoordVarying;
	vec4 color = texture(tex0, st);

	float gammaCorrection = 1.0 / (param1f0/3.0);
	color.rgb = 1.0 * pow(color.rgb / vec3(1.0), vec3(gammaCorrection));


	outputColor = color;
}
