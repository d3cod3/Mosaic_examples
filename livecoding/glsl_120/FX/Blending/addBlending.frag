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

	float r;
	if (overlay.r * base.a + base.r * overlay.a >= overlay.a * base.a) {
   		r = overlay.a * base.a + overlay.r * (1.0 - base.a) + base.r * (1.0 - overlay.a);
	} else {
   		r = overlay.r + base.r;
	}

	float g;
	if (overlay.g * base.a + base.g * overlay.a >= overlay.a * base.a) {
   		g = overlay.a * base.a + overlay.g * (1.0 - base.a) + base.g * (1.0 - overlay.a);
	} else {
   		g = overlay.g + base.g;
	}

	float b;
	if (overlay.b * base.a + base.b * overlay.a >= overlay.a * base.a) {
   		b = overlay.a * base.a + overlay.b * (1.0 - base.a) + base.b * (1.0 - overlay.a);
	} else {
   		b = overlay.b + base.b;
	}

	float a = overlay.a + base.a - overlay.a * base.a;

	gl_FragColor = vec4(r, g, b, a);

}

