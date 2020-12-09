#version 150

const int GAUSSIAN_SAMPLES = 9;
out vec2 blurCoordinates[GAUSSIAN_SAMPLES];
uniform float param1f1;
uniform float param1f2;

uniform mat4 modelViewProjectionMatrix;

in vec4 position;
in vec2 texcoord;

out vec2 texCoordVarying;

void main(){
  texCoordVarying = texcoord;

	gl_Position = modelViewProjectionMatrix * position;

  // Calculate the positions for the blur
  int multiplier = 0;
  vec2 blurStep;
  vec2 singleStepOffset = vec2(param1f1,param1f2);

  for (int i = 0; i < GAUSSIAN_SAMPLES; i++) {
      multiplier = (i - ((GAUSSIAN_SAMPLES - 1) / 2));
      blurStep = float(multiplier) * singleStepOffset;
      blurCoordinates[i] = texCoordVarying + blurStep;
  }
}
