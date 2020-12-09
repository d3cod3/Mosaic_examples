#version 150

uniform sampler2DRect tex0;
uniform float param1f0;//level@
uniform float param1f1;//texelW@
uniform float param1f2;//texelH@

uniform vec2 resolution;
uniform float time;

in vec2 leftTextureCoordinate;
in vec2 rightTextureCoordinate;
in vec2 topTextureCoordinate;
in vec2 topLeftTextureCoordinate;
in vec2 topRightTextureCoordinate;
in vec2 bottomTextureCoordinate;
in vec2 bottomLeftTextureCoordinate;
in vec2 bottomRightTextureCoordinate;

in vec2 texCoordVarying;
out vec4 outputColor;

void main(void){

    float quantizationLevels = param1f0;

    vec2 textureCoordinate = texCoordVarying;
    vec4 textureColor = texture(tex0, textureCoordinate);

    float bottomLeftIntensity = texture(tex0, bottomLeftTextureCoordinate).r;
    float topRightIntensity = texture(tex0, topRightTextureCoordinate).r;
    float topLeftIntensity = texture(tex0, topLeftTextureCoordinate).r;
    float bottomRightIntensity = texture(tex0, bottomRightTextureCoordinate).r;
    float leftIntensity = texture(tex0, leftTextureCoordinate).r;
    float rightIntensity = texture(tex0, rightTextureCoordinate).r;
    float bottomIntensity = texture(tex0, bottomTextureCoordinate).r;
    float topIntensity = texture(tex0, topTextureCoordinate).r;
    float h = -topLeftIntensity - 2.0 * topIntensity - topRightIntensity + bottomLeftIntensity + 2.0 * bottomIntensity + bottomRightIntensity;
    float v = -bottomLeftIntensity - 2.0 * leftIntensity - topLeftIntensity + bottomRightIntensity + 2.0 * rightIntensity + topRightIntensity;

    float mag = length(vec2(h, v));

    vec3 posterizedImageColor = floor((textureColor.rgb * quantizationLevels) + 0.5) / quantizationLevels;

    float thresholdTest = 1.0 - step(1.0, mag);

    outputColor = vec4(posterizedImageColor * thresholdTest, textureColor.a);

}
