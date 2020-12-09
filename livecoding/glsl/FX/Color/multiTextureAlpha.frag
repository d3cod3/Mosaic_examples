#version 150

uniform sampler2DRect tex0;
uniform sampler2DRect tex1;
uniform sampler2DRect tex2;

uniform float param1f0;//alpha1@
uniform float param1f1;//alpha2@
uniform float param1f2;//alpha3@

uniform vec2 resolution;
uniform float time;

in vec2 texCoordVarying;
out vec4 outputColor;

void main(){
	vec4 textureColor0 = texture(tex0, texCoordVarying);
	vec4 textureColor1 = texture(tex1, texCoordVarying);
	vec4 textureColor2 = texture(tex2, texCoordVarying);

	float alpha0 = param1f0/10.0;
	float alpha1 = param1f1/10.0;
	float alpha2 = param1f2/10.0;

	vec4 ta0 = vec4( textureColor0.rgb*alpha0, textureColor0.a );
	vec4 ta1 = vec4( textureColor1.rgb*alpha1, textureColor1.a );
	vec4 ta2 = vec4( textureColor2.rgb*alpha2, textureColor2.a );

	outputColor = vec4( ta0+ta1+ta2 );
}
