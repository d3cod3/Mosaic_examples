#version 150

uniform sampler2DRect tex0;
uniform sampler2DRect tex1;

float size = 64.0;

uniform vec2 resolution;
uniform float time;

in vec2 texCoordVarying;
out vec4 outputColor;

void main(void){
  vec3 rawColor = texture(tex0, texCoordVarying).rgb;
  float rawAlpha = texture(tex0, texCoordVarying).a;

  if (rawAlpha <= 0.0) {
    outputColor = vec4(rawColor, 0.0);
  }else {
    vec3 originalColor = floor(texture(tex0, texCoordVarying).rgb * vec3(size - 1.0));
    vec2 blueIndex = vec2(mod(originalColor.b, sqrt(size)), floor(originalColor.b / sqrt(size)));
    vec2 index = vec2((size * blueIndex.x + originalColor.r) + 0.5, (size * blueIndex.y + originalColor.g) + 0.5);
    outputColor = vec4(texture(tex1, index).rgb, rawAlpha);
  }
}
