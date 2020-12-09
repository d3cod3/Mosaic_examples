#version 150

uniform sampler2DRect tex0;
uniform float param1f0;//alpha@

uniform vec2 resolution;
uniform float time;

in vec2 texCoordVarying;
out vec4 outputColor;

void main(){

	float alpha = param1f0/10.0;

	vec4 textureColor = texture(tex0, texCoordVarying);

	outputColor = vec4( textureColor.rgb*alpha, textureColor.a );
}
