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

uniform vec2 resolution;
uniform float time;

void main(){

	vec4 base = texture2DRect(tex0, gl_TexCoord[0].st);
	vec4 overlay = texture2DRect(tex1, gl_TexCoord[0].st);

	gl_FragColor = base * overlay + base * (1.0 - overlay.a) + overlay * (1.0 - base.a);

}
