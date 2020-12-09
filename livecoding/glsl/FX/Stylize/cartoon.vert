#version 150

uniform mat4 modelViewProjectionMatrix;

in vec4 position;
in vec2 texcoord;

out vec2 texCoordVarying;

out vec2 leftTextureCoordinate;
out vec2 rightTextureCoordinate;

out vec2 topTextureCoordinate;
out vec2 topLeftTextureCoordinate;
out vec2 topRightTextureCoordinate;

out vec2 bottomTextureCoordinate;
out vec2 bottomLeftTextureCoordinate;
out vec2 bottomRightTextureCoordinate;

uniform float param1f1;
uniform float param1f2;

void main() {
  texCoordVarying = texcoord;

	gl_Position = modelViewProjectionMatrix * position;

  vec2 widthStep = vec2(param1f1*3, 0.0);
  vec2 heightStep = vec2(0.0, param1f2*3);
  vec2 widthHeightStep = vec2(param1f1*3, param1f2*3);
  vec2 widthNegativeHeightStep = vec2(param1f1*3, -param1f2*3);

  leftTextureCoordinate = texcoord - widthStep;
  rightTextureCoordinate = texcoord + widthStep;

  topTextureCoordinate = texcoord - heightStep;
  topLeftTextureCoordinate = texcoord - widthHeightStep;
  topRightTextureCoordinate = texcoord + widthNegativeHeightStep;

  bottomTextureCoordinate = texcoord + heightStep;
  bottomLeftTextureCoordinate = texcoord - widthNegativeHeightStep;
  bottomRightTextureCoordinate = texcoord + widthHeightStep;
}
