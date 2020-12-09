#version 150

uniform sampler2DRect tex0;

uniform float param1f0;//volume@
uniform float param1f1;//phase@

uniform vec2 resolution;
uniform float time;

in vec2 texCoordVarying;
out vec4 outputColor;

const int   oct  = 8;
const float per  = 0.5;
const float PI   = 3.1415926;
const float cCorners = 1.0 / 16.0;
const float cSides   = 1.0 / 8.0;
const float cCenter  = 1.0 / 4.0;

float interpolate(float a, float b, float x){
	float f = (1.0 - cos(x * PI)) * 0.5;
	return a * (1.0 - f) + b * f;
}

float rnd(vec2 p){
	return fract(sin(dot(p ,vec2(12.9898,78.233))) * 43758.5453);
}

float irnd(vec2 p){
	vec2 i = floor(p);
	vec2 f = fract(p);
	vec4 v = vec4(rnd(vec2(i.x,       i.y      )),
	rnd(vec2(i.x + 1.0, i.y      )),
	rnd(vec2(i.x,       i.y + 1.0)),
	rnd(vec2(i.x + 1.0, i.y + 1.0)));
	return interpolate(interpolate(v.x, v.y, f.x), interpolate(v.z, v.w, f.x), f.y);
}

float noise(vec2 p){
	float t = 0.0;
	for(int i = 0; i < oct; i++){
		float freq = pow(2.0, float(i));
		float amp  = pow(per, float(oct - i));
		t += irnd(vec2(p.x / freq, p.y / freq)) * amp;
	}
	return t;
}

float snoise(vec2 p, vec2 q, vec2 r){
	return noise(vec2(p.x,       p.y      )) *        q.x  *        q.y  +
	noise(vec2(p.x,       p.y + r.y)) *        q.x  * (1.0 - q.y) +
	noise(vec2(p.x + r.x, p.y      )) * (1.0 - q.x) *        q.y  +
	noise(vec2(p.x + r.x, p.y + r.y)) * (1.0 - q.x) * (1.0 - q.y);
}

void main(){

	float Volume = param1f0/6;
	float Phase = param1f1;

	vec2 st = texCoordVarying;
	vec2 t = vec2(st.y+st.x,Phase*100.0);
	float ns = noise(t)*Volume*300.0;

	vec3 col;

	if (ns > 150.0){
		float shift = 30.0;
		col.r = texture(tex0, vec2(st.x-shift,st.y-shift)).r;
		col.b = texture(tex0, vec2(st.x-shift,st.y-shift)).b;
		col.g = texture(tex0, vec2(st.x-shift,st.y-shift)).g;
	}else{
			col.r = texture(tex0, vec2(st.x,st.y)).r;
			col.b = texture(tex0, vec2(st.x,st.y)).b;
			col.g = texture(tex0, vec2(st.x,st.y)).g;
	}

	outputColor = vec4(col,1.0);

}
