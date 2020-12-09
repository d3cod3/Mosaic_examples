#version 150

uniform sampler2DRect tex0;

uniform float param1f0;//light@
uniform float param1f1;//rows@

uniform vec2 resolution;
uniform float time;

in vec2 texCoordVarying;
out vec4 outputColor;

void main(void){

    float brightness = param1f0/4.0;
    float rows = param1f1/2.0;

    vec2 uv = 0.5 + (1.0/texCoordVarying-0.5)*( (1.0-brightness) + brightness*sin(0.2*time) );

    vec3 col;

    col.r = texture(tex0, vec2(texCoordVarying.x+0.003,texCoordVarying.y)).r;
    col.g = texture(tex0, vec2(texCoordVarying.x+0.000,texCoordVarying.y)).g;
    col.b = texture(tex0, vec2(texCoordVarying.x-0.003,texCoordVarying.y)).b;

    col = clamp(col * 0.5 + 0.5 * col * col * 1.2,0.0,1.0);

    col *= 0.5 + 0.5 * 16.0 * uv.x * uv.y * (1.0-uv.x) * (1.0-uv.y);
    col *= vec3(0.8,1.0,0.7);
    col *= 0.9 + 0.1 * sin(10.0 * time + texCoordVarying.y * rows);
    col *= 0.97 + 0.03 * sin(110.0 * time);

    outputColor = vec4(col,1.0);
}
