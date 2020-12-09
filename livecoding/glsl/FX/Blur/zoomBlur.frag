#version 150

uniform sampler2DRect tex0;
uniform float param1f0;//exposure@
uniform float param1f1;//decay@
uniform float param1f2;//density@
uniform float param1f3;//weight@
uniform float param1f4;//clamp@

uniform vec2 resolution;
uniform float time;

in vec2 texCoordVarying;
out vec4 outputColor;

float fX = 0.5;
float fY = 0.5;

float fExposure = param1f0/3.0;
float fDecay = param1f1/3.0;
float fDensity = param1f2;
float fWeight = param1f3/2.0 + 0.3;
float fClamp = param1f4 + 1.0;

const int iSamples = 20;

void main(void){
  vec2 vUv = texCoordVarying;
  vec2 deltaTextCoord = vec2(vUv - vec2(fX,fY));
  deltaTextCoord *= 1.0 /  float(iSamples) * fDensity;
  vec2 coord = vUv;
  float illuminationDecay = 1.0;
  vec4 FragColor = vec4(0.0);

  for(int i=0; i < iSamples ; i++){
    coord -= deltaTextCoord;
    vec4 texel = texture(tex0, coord);
    texel *= illuminationDecay * fWeight;

    FragColor += texel;

    illuminationDecay *= fDecay;
  }
  FragColor *= fExposure;
  FragColor = clamp(FragColor, 0.0, fClamp);
  outputColor = FragColor;
}
