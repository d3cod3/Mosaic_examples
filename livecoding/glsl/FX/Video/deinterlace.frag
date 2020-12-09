#version 150

uniform sampler2DRect tex0;

uniform vec2 resolution;
uniform float time;

in vec2 texCoordVarying;
out vec4 outputColor;

void main() {
  float isodd = mod(texCoordVarying.y, 2.0);
  vec4 result;
  if(bool(isodd)){
      vec4 evenfield = texture(tex0, vec2(texCoordVarying.x, texCoordVarying.y + 1.0));
      vec4 oddfield = texture(tex0, texCoordVarying);
      result = mix(evenfield, oddfield, 0.5);
  } else {
      vec4 evenfield = texture(tex0, texCoordVarying);
      vec4 oddfield = texture(tex0, vec2(texCoordVarying.x, texCoordVarying.y - 1.0));
      result = mix(evenfield, oddfield, 0.5);
  }
  outputColor = result;
}
