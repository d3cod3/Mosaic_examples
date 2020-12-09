#version 150

uniform sampler2DRect tex0;
uniform sampler2DRect tex1;
uniform float param1f0;//thresh@
uniform float param1f1;//smooth@
uniform float param1f2;//r@
uniform float param1f3;//g@
uniform float param1f4;//b@

uniform vec2 resolution;
uniform float time;

in vec2 texCoordVarying;
out vec4 outputColor;

void main() {

  vec3 keyColor = vec3(param1f2/10.0,param1f3/10.0,param1f4/10.0);

  vec4 textureColor = texture(tex0, texCoordVarying);
  vec4 textureColor2 = texture(tex1, texCoordVarying);

  float maskY = 0.2989 * keyColor.r + 0.5866 * keyColor.g + 0.1145 * keyColor.b;
  float maskCr = 0.7132 * (keyColor.r - maskY);
  float maskCb = 0.5647 * (keyColor.b - maskY);

  float Y = 0.2989 * textureColor.r + 0.5866 * textureColor.g + 0.1145 * textureColor.b;
  float Cr = 0.7132 * (textureColor.r - Y);
  float Cb = 0.5647 * (textureColor.b - Y);

  float blendValue = 1.0 - smoothstep(param1f0/10.0, (param1f0/10.0) + (param1f1/10.0), distance(vec2(Cr, Cb), vec2(maskCr, maskCb)));
  outputColor = mix(textureColor, textureColor2, blendValue);
}
