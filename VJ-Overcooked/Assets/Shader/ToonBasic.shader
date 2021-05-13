Shader "Toon/Basic" {
	Properties {
		_Color ("Main Color", Vector) = (0.5,0.5,0.5,1)
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_ToonShade ("ToonShader Cubemap(RGB)", Cube) = "" {}
	}
	SubShader {
		Tags { "RenderType" = "Opaque" }
		Pass {
			Name "BASE"
			Tags { "RenderType" = "Opaque" }
			ZClip Off
			Cull Off
			GpuProgramID 44141
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
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _MainTex_ST;
						vec4 unused_0_2;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						mat4x4 glstate_matrix_modelview0;
						vec4 unused_1_2[14];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec3 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.xyz = in_NORMAL0.yyy * glstate_matrix_modelview0[1].xyz;
					    u_xlat0.xyz = glstate_matrix_modelview0[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = glstate_matrix_modelview0[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
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
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _MainTex_ST;
						vec4 unused_0_2;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						mat4x4 glstate_matrix_modelview0;
						vec4 unused_1_2[14];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec3 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.xyz = in_NORMAL0.yyy * glstate_matrix_modelview0[1].xyz;
					    u_xlat0.xyz = glstate_matrix_modelview0[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = glstate_matrix_modelview0[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "FOG_LINEAR" }
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
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _MainTex_ST;
						vec4 unused_0_2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						mat4x4 glstate_matrix_modelview0;
						vec4 unused_2_2[14];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_3_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec3 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out float vs_TEXCOORD2;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z / _ProjectionParams.y;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.z;
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    vs_TEXCOORD2 = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.xyz = in_NORMAL0.yyy * glstate_matrix_modelview0[1].xyz;
					    u_xlat0.xyz = glstate_matrix_modelview0[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = glstate_matrix_modelview0[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					Keywords { "FOG_LINEAR" }
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
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[2];
						vec4 _MainTex_ST;
						vec4 unused_0_2;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						mat4x4 glstate_matrix_modelview0;
						vec4 unused_1_2[14];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_2_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					in  vec3 in_NORMAL0;
					out vec2 vs_TEXCOORD0;
					out float vs_TEXCOORD2;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    gl_Position = u_xlat0;
					    vs_TEXCOORD2 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.xyz = in_NORMAL0.yyy * glstate_matrix_modelview0[1].xyz;
					    u_xlat0.xyz = glstate_matrix_modelview0[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = glstate_matrix_modelview0[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
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
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[3];
						vec4 _Color;
					};
					uniform  sampler2D _MainTex;
					uniform  samplerCube _ToonShade;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = texture(_ToonShade, vs_TEXCOORD1.xyz);
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat0.xyz;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1 = u_xlat1 * _Color;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
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
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[3];
						vec4 _Color;
					};
					uniform  sampler2D _MainTex;
					uniform  samplerCube _ToonShade;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = texture(_ToonShade, vs_TEXCOORD1.xyz);
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat0.xyz;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1 = u_xlat1 * _Color;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "FOG_LINEAR" }
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
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[3];
						vec4 _Color;
					};
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unused_1_1;
					};
					uniform  sampler2D _MainTex;
					uniform  samplerCube _ToonShade;
					in  vec2 vs_TEXCOORD0;
					in  float vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = texture(_ToonShade, vs_TEXCOORD1.xyz);
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat0.xyz;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz + (-unity_FogColor.xyz);
					    SV_Target0.w = u_xlat1.w;
					    u_xlat6 = vs_TEXCOORD2;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					Keywords { "FOG_LINEAR" }
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
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[3];
						vec4 _Color;
					};
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unused_1_1;
					};
					uniform  sampler2D _MainTex;
					uniform  samplerCube _ToonShade;
					in  vec2 vs_TEXCOORD0;
					in  float vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = texture(_ToonShade, vs_TEXCOORD1.xyz);
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat0.xyz;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz + (-unity_FogColor.xyz);
					    SV_Target0.w = u_xlat1.w;
					    u_xlat6 = vs_TEXCOORD2;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
					    return;
					}"
				}
			}
		}
	}
	Fallback "VertexLit"
}