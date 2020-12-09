#version 150

uniform sampler2DRect tex0;

uniform float param1f0;//space@
uniform float param1f1;//width@

uniform vec2 resolution;
uniform float time;

in vec2 texCoordVarying;
out vec4 outputColor;

const vec3 W = vec3(0.2125, 0.7154, 0.0721);

void main() {

 float crosshatchSpacing = param1f0/10.0;
 float lineWidth = param1f1/10.0;

 if(crosshatchSpacing < 1.0/resolution.x){
   crosshatchSpacing = 1.0/resolution.x;
 }

 float luminance = dot(texture(tex0, texCoordVarying).rgb, W);

  vec4 colorToDisplay = vec4(1.0, 1.0, 1.0, 1.0); // use sample color?
  if (luminance < 1.00)
  {
    if (mod(texCoordVarying.x + texCoordVarying.y, crosshatchSpacing) <= lineWidth)
    {
      colorToDisplay = vec4(0.0, 0.0, 0.0, 1.0);
    }
  }
  if (luminance < 0.75)
  {
    if (mod(texCoordVarying.x - texCoordVarying.y, crosshatchSpacing) <= lineWidth)
    {
      colorToDisplay = vec4(0.0, 0.0, 0.0, 1.0);
    }
  }
  if (luminance < 0.50)
  {
    if (mod(texCoordVarying.x + texCoordVarying.y - (crosshatchSpacing / 2.0), crosshatchSpacing) <= lineWidth)
    {
      colorToDisplay = vec4(0.0, 0.0, 0.0, 1.0);
    }
  }
  if (luminance < 0.3)
  {
    if (mod(texCoordVarying.x - texCoordVarying.y - (crosshatchSpacing / 2.0), crosshatchSpacing) <= lineWidth)
    {
      colorToDisplay = vec4(0.0, 0.0, 0.0, 1.0);
    }
  }

  outputColor = colorToDisplay;
}
