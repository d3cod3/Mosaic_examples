#version 150

uniform sampler2DRect tex0;
uniform float param1f0;//amount@

uniform vec2 resolution;
uniform float time;

in vec2 texCoordVarying;
out vec4 outputColor;

void main(){
	vec2 uv = texCoordVarying;

	float fractionalWidthOfPixel = param1f0*8 + 1;

	vec2 sampleDivisor = vec2(fractionalWidthOfPixel, fractionalWidthOfPixel);
	vec2 samplePos = uv - mod(uv, sampleDivisor) + 0.5 * sampleDivisor;
	vec4 textureColor = texture(tex0, samplePos);

	outputColor = textureColor;
}
