#version 150

uniform sampler2DRect tex0;
uniform float param1f0;//random@

uniform vec2 resolution;
uniform float time;

in vec2 varyingtexcoord;
out vec4 outputColor;

void main (void){

    float rando = param1f0;

    outputColor = texture(tex0,varyingtexcoord + vec2(sin(varyingtexcoord.y*0.03+time*20.0)*(6.0+12.0*rando),0));
}
