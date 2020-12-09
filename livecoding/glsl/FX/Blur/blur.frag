#version 150

uniform sampler2DRect tex0;
uniform float param1f0;//amount@

uniform vec2 resolution;
uniform float time;

in vec2 texCoordVarying;
out vec4 outputColor;

void main(void) {
    vec4 finalColor = vec4(0.0,0.0,0.0,1.0);
    float weight = 0.;
    int radius = int(param1f0) + 1;

    for(int x = radius * -1 ; x < radius; x++) {
        for(int y = radius * -1; y < radius; y++){

            vec2 coord = texCoordVarying + vec2(x,y);

            if(distance(coord, texCoordVarying) < float(radius)){
                vec4 texel = texture(tex0, coord);
                float w = length(texel.rgb)+ 0.1;
                weight += w;
                finalColor += texel * w;
            }
        }
    }

    outputColor = finalColor/weight;
}
