#version 150

uniform sampler2DRect tex0;
uniform float param1f0;//random@
uniform float param1f1;//v1@
uniform float param1f2;//v2@

uniform vec2 resolution;
uniform float time;

in vec2 varyingtexcoord;
out vec4 outputColor;

void main (void){

  float rando = param1f0;
  float val2 = param1f1;
  float val3 = param1f2;

  vec2 texCoord = vec2(max(3.0,min(float(resolution.x)  ,varyingtexcoord.x+sin(varyingtexcoord.y/(153.25*rando*rando)*rando+rando*val2+time*3.0)*val3)),
						  max(3.0,min(float(resolution.y),varyingtexcoord.y+cos(varyingtexcoord.x/(251.57*rando*rando)*rando+rando*val2+time*2.4)*val3)-3.));


  outputColor = texture(tex0, texCoord);
}
