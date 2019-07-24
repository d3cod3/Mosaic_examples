#version 120

varying vec3 v;
varying vec3 N;

uniform sampler2DRect tex0;
uniform float param1f0;//alpha@

uniform vec2 resolution;
uniform float time;

void main(){

	float alpha = param1f0/10.0;

	vec4 textureColor = texture2DRect(tex0, gl_TexCoord[0].st);

	gl_FragColor = vec4( textureColor.rgb*alpha, textureColor.a );
}
