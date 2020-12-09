#version 150

uniform sampler2DRect tex0;
uniform sampler2DRect tex1;

in vec2 texCoordVarying;

out vec4 fragColor;

void main (void){
  vec2 pos = texCoordVarying;

  vec3 src = texture(tex0, pos).rgb;
  float mask = texture(tex1, pos).r;

  fragColor = vec4( src , mask);
}
