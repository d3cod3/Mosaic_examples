#version 150

uniform sampler2DRect tex0;
uniform float param1f0;//passes@
uniform float param1f1;//a0@
uniform float param1f2;//a1@
uniform float param1f3;//epsilon@
uniform float param1f4;//delta@
uniform float param1f5;//k1@
uniform float param1f6;//k2@
uniform float param1f7;//k3@

uniform vec2 resolution;
uniform float time;

float kernel[9];
vec2 offset[9];

in vec2 texCoordVarying;
out vec4 outputColor;

void main(){

  float passes  = param1f0;
  float a0      = param1f1;
  float a1      = param1f2;
  float epsilon = param1f3;
  float delta   = param1f4;
  float k1      = param1f5;
  float k2      = param1f6;
  float k3      = param1f7;

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

  kernel[0] = 1.0;
  kernel[1] = 1.0;
  kernel[2] = -6.82842712;
  kernel[3] = 1.0;
  kernel[4] = 1.0;

  kernel[5] = 0.707106781;
  kernel[6] = 0.707106781;
  kernel[7] = 0.707106781;
  kernel[8] = 0.707106781;

  vec2 lap = vec2(0.0, 0.0);
  for(int i=0; i<9; i++){
    vec2 tmp = texture(tex0, st + offset[i]).rb;
    lap += tmp * kernel[i];
  }

  float u = texture(tex0, st).r;
  float v = texture(tex0, st).b;

  float du = (k1 * u) - (k2 * pow(u, 2.0)) - pow(u, 3.0) - v + lap.x;
  float dv = epsilon * (k3 * u - a1 * v - a0) + delta * lap.y;
  u += du * passes * 0.1;
  v += dv * passes * 0.1;
  outputColor = vec4(clamp(u, 0.0, 1.0), 0, clamp(v, 0.0, 1.0), 1.0);
}
