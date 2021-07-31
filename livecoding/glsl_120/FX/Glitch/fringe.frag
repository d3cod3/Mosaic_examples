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

uniform float param1f0;//volume@
uniform float param1f1;//scalew@
uniform float param1f2;//scaleh@

uniform vec2 resolution;
uniform float time;

void main(){

	float Volume = param1f0/8;
	float ScaleW = param1f1/10 * resolution.x;
	float ScaleH = param1f2/10 * resolution.y;

	vec2 center = vec2(ScaleW/2.0, ScaleH/2.0);
	vec2 st = gl_TexCoord[0].st;
	vec2 rev = (center - st) * Volume;

	vec3 col;
	vec3 col_fringe;

	col = texture2DRect(tex0, vec2(st.x,st.y)).rgb;
	col_fringe.r = texture2DRect(tex0, vec2(st.x,st.y) + rev).r;
	col_fringe.b = texture2DRect(tex0, vec2(st.x,st.y) - rev).b;
	col_fringe.g = 0.0;

	col.r = col_fringe.r;
	col.b = col_fringe.b;

	gl_FragColor = vec4(col,1.0);
}




