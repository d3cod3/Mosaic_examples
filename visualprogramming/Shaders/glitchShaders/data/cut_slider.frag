#version 150

uniform sampler2DRect tex0;
uniform float param1f0;//random@

in vec2 varyingtexcoord;
out vec4 outputColor;

void main (void){

  float rando = param1f0;

  outputColor = texture(tex0, varyingtexcoord + vec2(floor(sin(varyingtexcoord.y/10.0*rando+rando*rando))*10.0*rando,0));
}
