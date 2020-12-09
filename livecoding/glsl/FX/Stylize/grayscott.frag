#version 150

float kernel[9];
vec2 offset[9];

uniform sampler2DRect backbuffer;
uniform sampler2DRect tex0;

uniform vec2 resolution;
uniform float time;

in vec2 texCoordVarying;
out vec4 outputColor;

float diffU = 0.25;
float diffV = 0.04;
float k = 0.047;
float f = 0.1;

void main(void){
    vec2 st  = texCoordVarying;

    kernel[0] = 0.707106781;
    kernel[1] = 1.0;
    kernel[2] = 0.707106781;
    kernel[3] = 1.0;
    kernel[4] = -6.82842712;
    kernel[5] = 1.0;
    kernel[6] = 0.707106781;
    kernel[7] = 1.0;
    kernel[8] = 0.707106781;

    offset[0] = vec2( -1.0, -1.0);
    offset[1] = vec2(  0.0, -1.0);
    offset[2] = vec2(  1.0, -1.0);
    offset[3] = vec2( -1.0, 0.0);
    offset[4] = vec2(  0.0, 0.0);
    offset[5] = vec2(  1.0, 0.0);
    offset[6] = vec2( -1.0, 1.0);
    offset[7] = vec2(  0.0, 1.0);
    offset[8] = vec2(  1.0, 1.0);

    vec2 texColor		= texture( backbuffer, st ).rb;
    float srcTexColor   = texture( tex0, st ).r;

    vec2 lap            = vec2( 0.0, 0.0 );

    for( int i=0; i < 9; i++ ){
        vec2 tmp    = texture( backbuffer, st + offset[i] ).rb;
        lap         += tmp * kernel[i];
    }

    float F     = f + srcTexColor * 0.025 - 0.0005;
    float K     = k + srcTexColor * 0.025 - 0.0005;

    float u		= texColor.r;
    float v		= texColor.g + srcTexColor * 0.5;

    float uvv   = u * v * v;

    float du    = diffU * lap.r - uvv + F * (1.0 - u);
    float dv    = diffV * lap.g + uvv - (F + K) * v;

    u += du * 0.6;
    v += dv * 0.6;

    outputColor = vec4(clamp( u, 0.0, 1.0 ), 1.0 - u/v ,clamp( v, 0.0, 1.0 ), 1.0);
}
