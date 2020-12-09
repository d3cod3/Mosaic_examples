#version 150

uniform sampler2DRect tex0;
uniform sampler2DRect tex1;

uniform vec2 resolution;
uniform float time;

in vec2 texCoordVarying;
out vec4 outputColor;

void main(){
	
	vec4 c2 = texture(tex0, texCoordVarying);
	vec4 c1 = texture(tex1, texCoordVarying);

	vec4 finalColor;

	float a = c1.a + c2.a * (1.0 - c1.a);
	float alphaDivisor = a + step(a, 0.0); // Protect against a divide-by-zero blacking out things in the output

	finalColor.r = (c1.r * c1.a + c2.r * c2.a * (1.0 - c1.a))/alphaDivisor;
	finalColor.g = (c1.g * c1.a + c2.g * c2.a * (1.0 - c1.a))/alphaDivisor;
	finalColor.b = (c1.b * c1.a + c2.b * c2.a * (1.0 - c1.a))/alphaDivisor;
	finalColor.a = a;

	outputColor = finalColor;

}
