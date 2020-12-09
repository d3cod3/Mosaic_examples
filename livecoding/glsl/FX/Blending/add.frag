#version 150

uniform sampler2DRect tex0;
uniform sampler2DRect tex1;

uniform vec2 resolution;
uniform float time;

in vec2 texCoordVarying;
out vec4 outputColor;

void main(){

	vec4 base = texture(tex0, texCoordVarying);
	vec4 overlay = texture(tex1, texCoordVarying);

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

	outputColor = vec4(r, g, b, a);

}
