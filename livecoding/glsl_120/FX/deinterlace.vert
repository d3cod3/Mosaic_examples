#version 120

varying vec3 v;
varying vec3 N;
varying vec2 textureCoordinate;
varying vec2 texdim0;

void main() {
    v = vec3(gl_ModelViewMatrix * gl_Vertex);
    N = normalize(gl_NormalMatrix * gl_Normal);

    gl_TexCoord[0] = gl_MultiTexCoord0;
    gl_Position = ftransform();

    textureCoordinate = vec2(gl_TextureMatrix[0] * gl_MultiTexCoord0);
    texdim0 = vec2(abs(gl_TextureMatrix[0][0] [0]),abs(gl_TextureMatrix[0][1][1]));
}
