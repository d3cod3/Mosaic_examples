#version 150

uniform sampler2DRect tex0;
uniform float param1f0;//passes@
uniform float param1f1;//alpha@
uniform float param1f2;//beta@
uniform float param1f3;//gamma@

uniform vec2 resolution;
uniform float time;

float kernel[9];
vec2 offset[9];

in vec2 texCoordVarying;
out vec4 outputColor;

void main(){

  float passes  = param1f0;
  float alpha   = param1f1;
  float beta    = param1f2;
  float gamma   = param1f3;

  vec2 st = texCoordVarying;

  offset[0] = vec2( 0.0, -1.0);
  offset[1] = vec2(-1.0,  0.0);
  offset[2] = vec2( 0.0,  0.0);
  offset[3] = vec2( 1.0,  0.0);
  offset[4] = vec2( 0.0,  1.0);

  offset[5] = vec2(-1.0, -1.0);
  offset[6] = vec2( 1.0, -1.0);
  offset[7] = vec2(-1.0,  1.0);
  offset[8] = vec2( 1.0,  1.0);

  vec3 source = vec3(0);
  for(int i=0; i<9; i++){
    source += texture(tex0, st + offset[i]).rgb;
  }
  source /= 9.0;

  float a = source.r + source.r * ((alpha * (source.g * gamma)) - source.b) * passes;
  float b = source.g + source.g * ((beta * source.b) - (alpha * source.r)) * passes;
  float c = source.b + source.b * ((gamma * source.r) - (beta * source.g)) * passes;

  source.r = a;
  source.g = b;
  source.b = c;

  outputColor = vec4(source, 1.0);
}
