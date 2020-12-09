#version 150

uniform float param1f0;//amount@
uniform float param1f1;//units@
uniform float param1f2;//speed@

uniform float time;
uniform vec2 resolution;

in vec2 texCoordVarying;
out vec4 outputColor;

void main(void){
    float tot = param1f0*3.1415926;
    float n = param1f1;
    float speed = param1f2;

    vec2 p = -1.0 + 2.0 * texCoordVarying / resolution.xy;
    p.y *= resolution.y/resolution.x;
    p *= 100.0;

    float df = tot/n;
    float c = 1.;
    float t = time*speed;

    for (float phi =0.0; phi < tot; phi+=df){
        c+=cos(cos(phi)*p.x+sin(phi)*p.y+t*phi/tot);
    }

    outputColor = vec4(c,c,c,1.0);
}
