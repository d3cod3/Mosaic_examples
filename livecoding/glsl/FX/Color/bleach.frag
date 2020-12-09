#version 150

uniform sampler2DRect tex0;
uniform float param1f0;//bleach@

uniform vec2 resolution;
uniform float time;

in vec2 texCoordVarying;
out vec4 outputColor;

void main() {

   float opacity = param1f0/5.0;

   vec2 vUv = texCoordVarying;
   vec4 base = texture( tex0, vUv );

   vec3 lumCoeff = vec3( 0.25, 0.65, 0.1 );
   float lum = dot( lumCoeff, base.rgb );
   vec3 blend = vec3( lum );

   float L = min( 1.0, max( 0.0, 10.0 * ( lum - 0.45 ) ) );

   vec3 result1 = 2.0 * base.rgb * blend;
   vec3 result2 = 1.0 - 2.0 * ( 1.0 - blend ) * ( 1.0 - base.rgb );

   vec3 newColor = mix( result1, result2, L );

   float A2 = opacity * base.a;
   vec3 mixRGB = A2 * newColor.rgb;
   mixRGB += ( ( 1.0 - A2 ) * base.rgb );

   outputColor = vec4( mixRGB, base.a );

}
