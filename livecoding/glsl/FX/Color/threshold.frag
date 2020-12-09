#version 150

uniform sampler2DRect tex0;
uniform float param1f0;//thresh@

uniform vec2 resolution;
uniform float time;

in vec2 texCoordVarying;
out vec4 outputColor;

void main(){
    vec4 color = texture(tex0,texCoordVarying);
    float c = color.g;
    c = c - (param1f0/16.0);
    c = max(c,0.0);
    c = c/c;
    outputColor = vec4(c,c,c,1.0);
}
