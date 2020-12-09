#version 150

uniform sampler2DRect tex0;
uniform float param1f0;//slitH@

in vec2 varyingtexcoord;
out vec4 outputColor;

void main (void){

	float slit_h = param1f0*100.0;

  vec2 texCoord = vec2(3.0+floor(varyingtexcoord.x/slit_h)*slit_h ,varyingtexcoord.y);
  vec4 col = texture(tex0, texCoord);

  outputColor = col.rgba;
}
