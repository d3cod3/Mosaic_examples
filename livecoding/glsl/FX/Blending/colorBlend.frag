#version 150

uniform sampler2DRect tex0;
uniform sampler2DRect tex1;

uniform vec2 resolution;
uniform float time;

in vec2 texCoordVarying;
out vec4 outputColor;

float lum(vec3 c) {
	return dot(c, vec3(0.3, 0.59, 0.11));
}

vec3 clipcolor(vec3 c) {
	float l = lum(c);
	float n = min(min(c.r, c.g), c.b);
	float x = max(max(c.r, c.g), c.b);

	if (n < 0.0) {
		c.r = l + ((c.r - l) * l) / (l - n);
		c.g = l + ((c.g - l) * l) / (l - n);
		c.b = l + ((c.b - l) * l) / (l - n);
	}
	if (x > 1.0) {
		c.r = l + ((c.r - l) * (1.0 - l)) / (x - l);
		c.g = l + ((c.g - l) * (1.0 - l)) / (x - l);
		c.b = l + ((c.b - l) * (1.0 - l)) / (x - l);
	}

	return c;
}

vec3 setlum(vec3 c, float l) {
	float d = l - lum(c);
	c = c + vec3(d);
	return clipcolor(c);
}

void main(){

	vec4 base = texture(tex0, texCoordVarying);
	vec4 overlay = texture(tex1, texCoordVarying);

	outputColor = vec4(base.rgb * (1.0 - overlay.a) + setlum(overlay.rgb, lum(base.rgb)) * overlay.a, base.a);

}
