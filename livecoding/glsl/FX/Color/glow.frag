// fragment shader
#version 150

uniform sampler2DRect tex0;
uniform float param1f0;//strength@

in vec2 varyingtexcoord;
out vec4 outputColor;


void main (void)
{
    float e = 2.718281828459045235360287471352;
    vec2 texCoord = vec2(varyingtexcoord.x , varyingtexcoord.y);
    vec4 col = texture(tex0,texCoord);

    int blur_w = 12;
    float pi = 3.1415926535;
    vec4 gws = vec4(0.0,0.0,0.0,1.0);
    float weight;
    float k = 1.0;

    weight = 1.0/(float(blur_w)*2.0+1.0)/(float(blur_w)*2.0+1.0);

    for (int i = 0;i < blur_w*blur_w;i++){
        gws = gws + texture(tex0,vec2(texCoord.x+float(mod(float(i),float(blur_w))),texCoord.y+float(i/blur_w)))*weight*param1f0;
        gws = gws + texture(tex0,vec2(texCoord.x-float(mod(float(i),float(blur_w))),texCoord.y+float(i/blur_w)))*weight*param1f0;
        gws = gws + texture(tex0,vec2(texCoord.x+float(mod(float(i),float(blur_w))),texCoord.y-float(i/blur_w)))*weight*param1f0;
        gws = gws + texture(tex0,vec2(texCoord.x-float(mod(float(i),float(blur_w))),texCoord.y-float(i/blur_w)))*weight*param1f0;
    }


    outputColor = col+gws;
}
