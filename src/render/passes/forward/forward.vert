#version 450

layout(location = 0) in vec4 a_Pos;
layout(location = 1) in vec4 a_Normal;
layout(location = 2) in vec4 a_Uv;

layout(location = 0) out vec3 v_Normal;
layout(location = 1) out vec4 v_Position;

layout(set = 0, binding = 0) uniform Globals {
    mat4 ViewProj;
    uvec4 NumLights;
};
layout(set = 1, binding = 0) uniform Entity {
    mat4 World;
    vec4 Color;
};

void main() {
    v_Normal = mat3(World) * vec3(a_Normal.xyz);
    v_Position = World * vec4(a_Pos);
    gl_Position = ViewProj * v_Position;
}
