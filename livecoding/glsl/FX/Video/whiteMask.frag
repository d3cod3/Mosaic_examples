#version 150

uniform sampler2DRect tex0;
uniform sampler2DRect tex1;

in vec2 texCoordVarying;
out vec4 outputColor;

void main (void){
    vec4 mask = texture(tex0, texCoordVarying);
    vec4 image = texture(tex1, texCoordVarying);

    if(mask.r == 1 && mask.g == 1 && mask.b == 1){
      outputColor = vec4(image.rgb,1);
    }else{
      outputColor = vec4(0,0,0,1);
    }




}
