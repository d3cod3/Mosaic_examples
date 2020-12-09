#version 150

uniform sampler2DRect tex0;
uniform float param1f0;//strength@

uniform vec2 resolution;
uniform float time;

in vec2 texCoordVarying;
out vec4 outputColor;

void main(){
    vec4 sum = vec4(0);
    vec2 st = texCoordVarying;
    int j;
    int i;

    for( i= -4 ;i < 4; i++){
        for (j = -3; j < 3; j++){
            sum += texture(tex0, st + vec2(j, i)*0.004) * 0.25;
        }
    }

    float strength = param1f0/10.0;

    if (texture(tex0, st).r < 0.3){
        outputColor = sum * sum * (strength/10.0) + texture(tex0, st);
    } else {
        if (texture(tex0, st).r < 0.5){
            outputColor = sum * sum * (strength/14.0) + texture(tex0, st);
        } else {
            outputColor = sum * sum * (strength/18.0) + texture(tex0, st);
        }
    }
}
