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

uniform float param1f0;//scaleh@

uniform vec2 resolution;
uniform float time;

void main(){

	float ScaleH = param1f0/10 * resolution.y;

	vec2 st = gl_TexCoord[0].st;

	vec4 col;

	col = texture2DRect(tex0, vec2(st.x,mod(st.y,ScaleH)));

	gl_FragColor = vec4(col);

}



