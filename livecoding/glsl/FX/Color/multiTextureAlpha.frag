/*
	----------------------------------------------------------
	Mosaic | OF Visual Patching Developer Platform

	Copyright (c) 2019 Emanuele Mazza aka n3m3da

	Mosaic is distributed under the MIT License. This gives everyone the
  freedoms to use Mosaic in any context: commercial or non-commercial,
  public or private, open or closed source.

  See https://github.com/d3cod3/Mosaic for documentation
	----------------------------------------------------------


	empty.fs: A Fragment Shader template for Mosaic,

*/

#version 120

varying vec3 v;
varying vec3 N;

uniform sampler2DRect tex0;
uniform sampler2DRect tex1;
uniform sampler2DRect tex2;

uniform float param1f0;//alpha1@
uniform float param1f1;//alpha2@
uniform float param1f2;//alpha3@

uniform vec2 resolution;
uniform float time;

void main(){
	vec4 textureColor0 = texture2DRect(tex0, gl_TexCoord[0].st);
	vec4 textureColor1 = texture2DRect(tex1, gl_TexCoord[0].st);
	vec4 textureColor2 = texture2DRect(tex2, gl_TexCoord[0].st);

	float alpha0 = param1f0/10.0;
	float alpha1 = param1f1/10.0;
	float alpha2 = param1f2/10.0;

	vec4 ta0 = vec4( textureColor0.rgb*alpha0, textureColor0.a );
	vec4 ta1 = vec4( textureColor1.rgb*alpha1, textureColor1.a );
	vec4 ta2 = vec4( textureColor2.rgb*alpha2, textureColor2.a );

	gl_FragColor = vec4( ta0+ta1+ta2 );
}
