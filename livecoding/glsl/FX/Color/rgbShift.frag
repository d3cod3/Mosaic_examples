#version 150

uniform sampler2DRect tex0;
uniform float param1f0;//amount@
uniform float param1f1;//angle@

uniform vec2 resolution;
uniform float time;

in vec2 texCoordVarying;
out vec4 outputColor;

void main() {

  float amount = param1f0;
  float angle = param1f1;

  vec2 vUv = texCoordVarying;
  vec2 offset = amount * vec2( cos(angle), sin(angle));
  vec4 cr = texture(tex0, vUv + offset);
  vec4 cga = texture(tex0, vUv);
  vec4 cb = texture(tex0, vUv - offset);
  outputColor = vec4(cr.r, cga.g, cb.b, cga.a);

}
