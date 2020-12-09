#version 150

uniform sampler2DRect tex0;

uniform float param1f0;//scaleh@

uniform vec2 resolution;
uniform float time;

in vec2 texCoordVarying;
out vec4 outputColor;

void main(){

	float ScaleH = param1f0/10 * resolution.y;

	vec2 st = texCoordVarying;

	vec4 col;

	col = texture(tex0, vec2(st.x,mod(st.y,ScaleH)));

	outputColor = vec4(col);

}
