Shader "Custom/Cloud" {
	Properties {
		_Color ("Main Color", Vector) = (1,1,1,1)
		_MainTex ("Base (RGB) Trans (A)", 2D) = "white" {}
		_WrapAmount ("Wrap Amount", Range(0, 1)) = 0.5
	}
	SubShader {
		Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Opaque" }
		GrabPass {
			"_GrabTexture"
		}
		Pass {
			Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Opaque" }
			ZClip Off
			Cull Off
			Fog {
				Mode Off
			}
			GpuProgramID 24584
			Program "vp" {
				SubProgram "d3d11 " {
					"vs_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_0_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_NORMAL0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat1.xyz = u_xlat0.xwy * vec3(0.5, 0.5, -0.5);
					    vs_TEXCOORD1.zw = u_xlat0.zw;
					    vs_TEXCOORD1.xy = u_xlat1.yy + u_xlat1.xz;
					    vs_NORMAL0.xyz = in_NORMAL0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					"vs_4_0_level_9_1
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_0_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_NORMAL0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat1.xyz = u_xlat0.xwy * vec3(0.5, 0.5, -0.5);
					    vs_TEXCOORD1.zw = u_xlat0.zw;
					    vs_TEXCOORD1.xy = u_xlat1.yy + u_xlat1.xz;
					    vs_NORMAL0.xyz = in_NORMAL0.xyz;
					    return;
					}"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"ps_4_0
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform UnityPerDrawRare {
						mat4x4 glstate_matrix_transpose_modelview0;
					};
					uniform  sampler2D _GrabTexture;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_NORMAL0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.x = dot(glstate_matrix_transpose_modelview0[2].xyz, glstate_matrix_transpose_modelview0[2].xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * glstate_matrix_transpose_modelview0[2].xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, vs_NORMAL0.xyz);
					    u_xlat0.x = u_xlat0.x * 1.20000005;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat2 = (-u_xlat0.x) + 1.0;
					    u_xlat4.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat1 = texture(_GrabTexture, u_xlat4.xy);
					    SV_Target0.xyz = u_xlat1.xyz * vec3(u_xlat2) + u_xlat0.xxx;
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					"ps_4_0_level_9_1
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					layout(std140) uniform UnityPerDrawRare {
						mat4x4 glstate_matrix_transpose_modelview0;
					};
					uniform  sampler2D _GrabTexture;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_NORMAL0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.x = dot(glstate_matrix_transpose_modelview0[2].xyz, glstate_matrix_transpose_modelview0[2].xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * glstate_matrix_transpose_modelview0[2].xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, vs_NORMAL0.xyz);
					    u_xlat0.x = u_xlat0.x * 1.20000005;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat2 = (-u_xlat0.x) + 1.0;
					    u_xlat4.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat1 = texture(_GrabTexture, u_xlat4.xy);
					    SV_Target0.xyz = u_xlat1.xyz * vec3(u_xlat2) + u_xlat0.xxx;
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
			}
		}
	}
}