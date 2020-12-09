#version 150

uniform sampler2DRect	tex0;
uniform float param1f0;//blurSize@
uniform float param1f1;//bloom@
uniform float param1f2;//Woffset@
uniform float param1f3;//Hoffset@

uniform vec2 resolution;
uniform float time;

in vec2 texCoordVarying;
out vec4 outputColor;

const float pi = 3.141592653589793;

void main (void) {
  float v;

  float radius = param1f0;
  if ( radius < 0 ) radius = 0;
  int steps = int(min(radius * 0.7, sqrt(radius) * pi));
  float r = radius / steps;
  float t = (param1f1+1) / (steps * 2 + 1);
  float x = texCoordVarying.x;
  float y = texCoordVarying.y;
  vec4 sum = texture(tex0, vec2(x, y)) * t;
  int i;
  for(i = 1; i <= steps; i++){
    v = (cos(i / (steps + 1) / pi) + 1) * 0.5;
    sum += texture(tex0, vec2(x + i * param1f2 * r, y + i * param1f3 * r)) * v * t;
    sum += texture(tex0, vec2(x - i * param1f2 * r, y - i * param1f3 * r)) * v * t;
  }

  outputColor = sum;
}
