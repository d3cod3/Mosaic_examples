#version 120

/*
    wiggleStereoscopy from ofxWiggleStereoscopy shaders from Jotaro <https://github.com/JotaroS/ofxWiggleStereoscopy>
    adapted for Mosaic platform
*/

varying vec3 v;
varying vec3 N;

void main(void){

    v = vec3(gl_ModelViewMatrix * gl_Vertex);
    N = normalize(gl_NormalMatrix * gl_Normal);

    gl_TexCoord[0] = gl_MultiTexCoord0;

    gl_Position = ftransform();
}
