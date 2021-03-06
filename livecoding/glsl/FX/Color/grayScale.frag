#version 150

uniform sampler2DRect tex0;
uniform float param1f0;//intensity@
uniform float param1f1;//red@
uniform float param1f2;//green@
uniform float param1f3;//blue@

uniform vec2 resolution;
uniform float time;

in vec2 texCoordVarying;
out vec4 outputColor;

float u_intensity = param1f0/10.0;
float u_redCoefficient = param1f1/10.0;
float u_greenCoefficient = param1f2/10.0;
float u_blurCoefficient = param1f3/10.0;

void main(void){

    vec4 source = texture(tex0, texCoordVarying);

    vec3 grayscale = vec3(source.r * 0.299 + source.g * 0.587 + source.b * 0.114);
    grayscale.r *= u_redCoefficient;
    grayscale.g *= u_greenCoefficient;
    grayscale.b *= u_blurCoefficient;

    vec3 compose = (grayscale * u_intensity) + (source.rgb * (1.0 - u_intensity));

    outputColor = vec4(compose, source.a);
}
