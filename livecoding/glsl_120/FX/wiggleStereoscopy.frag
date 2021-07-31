#version 120

/*
    wiggleStereoscopy from ofxWiggleStereoscopy shaders from Jotaro <https://github.com/JotaroS/ofxWiggleStereoscopy>
    adapted for Mosaic platform
*/

varying vec3 v;
varying vec3 N;

uniform sampler2DRect tex0;
uniform sampler2DRect tex1;

uniform float param1f0;//offsetX@
uniform float param1f1;//offsetY@
uniform float param1f2;//focus@

uniform vec2 resolution;

void main(){

    vec2 pos = gl_TexCoord[0].st;

    vec2 offset = vec2(param1f0/10.0,param1f1/10.0);

    float r = texture2DRect(tex0, pos).r;
    float g = texture2DRect(tex0, pos).g;
    float b = texture2DRect(tex0, pos).b;
    float a = texture2DRect(tex0, pos).a;

    float gr = (r + g + b) / 3.0; //set intensity

    vec4 color = vec4(r, g, b, a); //set src color
    float aspect = resolution.x / resolution.y;
    vec2 scale2 = vec2(1.0 * min(1.0, 1.0 / aspect), 1.0 * min(1.0, aspect)) * vec2(1, -1) * vec2(1);
    vec2 mapCords = gl_TexCoord[0].st;
    float map = texture2DRect(tex1, mapCords).r;
    map = map * -1.0 + (param1f2/10.0);
    vec2 disCords = gl_TexCoord[0].st;
    disCords += offset * map * scale2;           //deform coordinate based on offset and scale
    gl_FragColor = texture2DRect(tex0, disCords); //maybe this should be deleted??

    // wiggle light color
    float _r = texture2DRect(tex0, disCords).r;
    float _g = texture2DRect(tex0, disCords).g;
    float _b = texture2DRect(tex0, disCords).b;
    float _a = texture2DRect(tex0, disCords).a;

    vec4 dstcolor = vec4(_r, _g, _b, 1.0); // set alpha level

    gl_FragColor = dstcolor;
}
