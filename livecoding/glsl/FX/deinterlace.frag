#version 120

varying vec3 v;
varying vec3 N;

varying vec2 textureCoordinate;
varying vec2 texdim0;

uniform sampler2DRect tex0;

uniform vec2 resolution;
uniform float time;


void main() {
  float isodd = mod(textureCoordinate.y, 2.0);
  vec4 result;
  if(bool(isodd)){
      vec4 evenfield = texture2DRect(tex0, vec2(textureCoordinate.x, textureCoordinate.y + 1.0));
      vec4 oddfield = texture2DRect(tex0, textureCoordinate);
      result = mix(evenfield, oddfield, 0.5);
  } else {
      vec4 evenfield = texture2DRect(tex0, textureCoordinate);
      vec4 oddfield = texture2DRect(tex0, vec2(textureCoordinate.x, textureCoordinate.y - 1.0));
      result = mix(evenfield, oddfield, 0.5);
  }
  gl_FragColor = result;
}
