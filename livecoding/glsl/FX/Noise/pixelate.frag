/*
	----------------------------------------------------------
	Mosaic | OF Visual Patching Developer Platform

	Copyright (c) 2019 Emanuele Mazza aka n3m3da

	Mosaic is distributed under the MIT License. This gives everyone the
  freedoms to use Mosaic in any context: commercial or non-commercial,
  public or private, open or closed source.

  See https://github.com/d3cod3/Mosaic for documentation
	----------------------------------------------------------


	pixelate.frag: Pixelate filter

*/

#version 120

varying vec3 v;
varying vec3 N;

uniform sampler2DRect tex0;

uniform float param1f0;//amount@

uniform vec2 resolution;
uniform float time;

void main(){
	vec2 uv = gl_TexCoord[0].st; // .st
	
	float fractionalWidthOfPixel = param1f0*8 + 1;
	
	vec2 sampleDivisor = vec2(fractionalWidthOfPixel, fractionalWidthOfPixel);
	vec2 samplePos = uv - mod(uv, sampleDivisor) + 0.5 * sampleDivisor;
	vec4 textureColor = texture2DRect(tex0, samplePos);

	gl_FragColor = textureColor;
}















