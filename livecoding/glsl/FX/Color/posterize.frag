#version 150

uniform sampler2DRect tex0;
uniform float param1f0;//level@

uniform vec2 resolution;
uniform float time;

in vec2 texCoordVarying;
out vec4 outputColor;

void main() {
	float colorLevels = param1f0/3.0 + 0.5;

	vec4 textureColor = texture(tex0, texCoordVarying);

	outputColor = floor((textureColor * colorLevels) + vec4(0.5)) / colorLevels;

}
