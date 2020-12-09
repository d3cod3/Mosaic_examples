#version 150

uniform sampler2DRect tex0;

uniform float param1f0;//random@
uniform float param1f1;//shakeX@
uniform float param1f2;//shakeY@

uniform vec2 resolution;
uniform float time;

in vec2 varyingtexcoord;
out vec4 outputColor;

void main (void){

    vec2 texCoord = vec2(varyingtexcoord.x, varyingtexcoord.y);

    vec4 col = texture(tex0, texCoord);

    vec2 blur_vec = vec2(param1f1,param1f2);
    float rando = param1f0;

    vec4 col_s[5],col_s2[5];
    for (int i = 0;i < 5;i++){
        col_s[i] = texture(tex0,texCoord +  vec2(-1.0*float(i)*blur_vec.x*rando*rando ,-1.0*float(i)*blur_vec.y*rando*rando));
        col_s2[i] = texture(tex0,texCoord + vec2( 1.0*float(i)*blur_vec.x*rando*rando , 1.0*float(i)*blur_vec.y*rando*rando));
    }
    col_s[0] = (col_s[0] + col_s[1] + col_s[2] + col_s[3] + col_s[4])/5.0;
    col_s2[0]= (col_s2[0]+ col_s2[1]+ col_s2[2]+ col_s2[3]+ col_s2[4])/5.0;
    col = (col_s[0] + col_s2[0]) / 2.0;

    outputColor = col.rgba;
}
