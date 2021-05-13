Shader "Projector/Multiply" {
	Properties {
		_Prop ("Prop", Range(0, 1)) = 1
		_ShadowTex ("Cookie", 2D) = "gray" {}
		_FalloffTex ("FallOff", 2D) = "white" {}
	}
	SubShader {
		Tags { "QUEUE" = "Transparent" }
		Pass {
			Tags { "QUEUE" = "Transparent" }
			Blend DstColor Zero, DstColor Zero
			ColorMask RGB -1
			ZClip Off
			ZWrite Off
			Offset -1, -1
			GpuProgramID 5530
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
						mat4x4 unity_Projector;
						mat4x4 unity_ProjectorClip;
						vec4 unused_0_3;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_Projector[1];
					    u_xlat0 = unity_Projector[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_Projector[2] * in_POSITION0.zzzz + u_xlat0;
					    vs_TEXCOORD0 = unity_Projector[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = in_POSITION0.yyyy * unity_ProjectorClip[1];
					    u_xlat0 = unity_ProjectorClip[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ProjectorClip[2] * in_POSITION0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ProjectorClip[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
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
						mat4x4 unity_Projector;
						mat4x4 unity_ProjectorClip;
						vec4 unused_0_3;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_Projector[1];
					    u_xlat0 = unity_Projector[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_Projector[2] * in_POSITION0.zzzz + u_xlat0;
					    vs_TEXCOORD0 = unity_Projector[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = in_POSITION0.yyyy * unity_ProjectorClip[1];
					    u_xlat0 = unity_ProjectorClip[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ProjectorClip[2] * in_POSITION0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ProjectorClip[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
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
						mat4x4 unity_Projector;
						mat4x4 unity_ProjectorClip;
						vec4 unused_0_3;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_2_1[18];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_3_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out float vs_TEXCOORD2;
					vec4 u_xlat0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_Projector[1];
					    u_xlat0 = unity_Projector[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_Projector[2] * in_POSITION0.zzzz + u_xlat0;
					    vs_TEXCOORD0 = unity_Projector[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = in_POSITION0.yyyy * unity_ProjectorClip[1];
					    u_xlat0 = unity_ProjectorClip[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ProjectorClip[2] * in_POSITION0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ProjectorClip[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat1 = u_xlat0.z / _ProjectionParams.y;
					    gl_Position = u_xlat0;
					    u_xlat0.x = (-u_xlat1) + 1.0;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.z;
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    vs_TEXCOORD2 = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
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
						mat4x4 unity_Projector;
						mat4x4 unity_ProjectorClip;
						vec4 unused_0_3;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_2_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out float vs_TEXCOORD2;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_Projector[1];
					    u_xlat0 = unity_Projector[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_Projector[2] * in_POSITION0.zzzz + u_xlat0;
					    vs_TEXCOORD0 = unity_Projector[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = in_POSITION0.yyyy * unity_ProjectorClip[1];
					    u_xlat0 = unity_ProjectorClip[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ProjectorClip[2] * in_POSITION0.zzzz + u_xlat0;
					    vs_TEXCOORD1 = unity_ProjectorClip[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD2 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    gl_Position = u_xlat0;
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
						vec4 unused_0_0[10];
						float _Prop;
					};
					uniform  sampler2D _ShadowTex;
					uniform  sampler2D _FalloffTex;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat0 = texture(_FalloffTex, u_xlat0.xy);
					    u_xlat0.x = u_xlat0.w * _Prop;
					    u_xlat2.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat1 = texture(_ShadowTex, u_xlat2.xy);
					    u_xlat1 = u_xlat1 * vec4(1.0, 1.0, 1.0, -1.0) + vec4(-1.0, -1.0, -1.0, 1.0);
					    SV_Target0 = u_xlat0.xxxx * u_xlat1 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 unused_0_0[10];
						float _Prop;
					};
					uniform  sampler2D _ShadowTex;
					uniform  sampler2D _FalloffTex;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat0 = texture(_FalloffTex, u_xlat0.xy);
					    u_xlat0.x = u_xlat0.w * _Prop;
					    u_xlat2.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat1 = texture(_ShadowTex, u_xlat2.xy);
					    u_xlat1 = u_xlat1 * vec4(1.0, 1.0, 1.0, -1.0) + vec4(-1.0, -1.0, -1.0, 1.0);
					    SV_Target0 = u_xlat0.xxxx * u_xlat1 + vec4(1.0, 1.0, 1.0, 0.0);
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
						vec4 unused_0_0[10];
						float _Prop;
					};
					uniform  sampler2D _ShadowTex;
					uniform  sampler2D _FalloffTex;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  float vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat0 = texture(_FalloffTex, u_xlat0.xy);
					    u_xlat0.x = u_xlat0.w * _Prop;
					    u_xlat2.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat1 = texture(_ShadowTex, u_xlat2.xy);
					    u_xlat1 = u_xlat1 * vec4(1.0, 1.0, 1.0, -1.0) + vec4(-1.0, -1.0, -1.0, 1.0);
					    u_xlat0 = u_xlat0.xxxx * u_xlat1;
					    u_xlat1.x = vs_TEXCOORD2;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    SV_Target0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(1.0, 1.0, 1.0);
					    SV_Target0.w = u_xlat0.w;
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
						vec4 unused_0_0[10];
						float _Prop;
					};
					uniform  sampler2D _ShadowTex;
					uniform  sampler2D _FalloffTex;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  float vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat0 = texture(_FalloffTex, u_xlat0.xy);
					    u_xlat0.x = u_xlat0.w * _Prop;
					    u_xlat2.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
					    u_xlat1 = texture(_ShadowTex, u_xlat2.xy);
					    u_xlat1 = u_xlat1 * vec4(1.0, 1.0, 1.0, -1.0) + vec4(-1.0, -1.0, -1.0, 1.0);
					    u_xlat0 = u_xlat0.xxxx * u_xlat1;
					    u_xlat1.x = vs_TEXCOORD2;
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    SV_Target0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(1.0, 1.0, 1.0);
					    SV_Target0.w = u_xlat0.w;
					    return;
					}"
				}
			}
		}
	}
}