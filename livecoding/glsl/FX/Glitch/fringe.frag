#version 150

uniform sampler2DRect tex0;

uniform float param1f0;//volume@
uniform float param1f1;//Wscale@
uniform float param1f2;//Hscale@

uniform vec2 resolution;
uniform float time;

in vec2 texCoordVarying;
out vec4 outputColor;

void main(){

	float Volume = param1f0/8;
	float ScaleW = param1f1/10 * resolution.x;
	float ScaleH = param1f2/10 * resolution.y;

	vec2 center = vec2(ScaleW/2.0, ScaleH/2.0);
	vec2 st = texCoordVarying;
	vec2 rev = (center - st) * Volume;

	vec3 col;
	vec3 col_fringe;

	col = texture(tex0, vec2(st.x,st.y)).rgb;
	col_fringe.r = texture(tex0, vec2(st.x,st.y) + rev).r;
	col_fringe.b = texture(tex0, vec2(st.x,st.y) - rev).b;
	col_fringe.g = 0.0;

	col.r = col_fringe.r;
	col.b = col_fringe.b;

	outputColor = vec4(col,1.0);
}
