Shader "Hidden/SeparableBlur" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "" {}
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 15974
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
						vec4 offsets;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2 = offsets.xyxy * vec4(2.0, 2.0, -2.0, -2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = offsets.xyxy * vec4(3.0, 3.0, -3.0, -3.0) + in_TEXCOORD0.xyxy;
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
						vec4 offsets;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = offsets.xyxy * vec4(1.0, 1.0, -1.0, -1.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2 = offsets.xyxy * vec4(2.0, 2.0, -2.0, -2.0) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = offsets.xyxy * vec4(3.0, 3.0, -3.0, -3.0) + in_TEXCOORD0.xyxy;
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
					
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat0 = u_xlat0 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006);
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat1 * vec4(0.400000006, 0.400000006, 0.400000006, 0.400000006) + u_xlat0;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat0 = u_xlat1 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat0;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat0 = u_xlat1 * vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001) + u_xlat0;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat0 = u_xlat1 * vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001) + u_xlat0;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat0 = u_xlat1 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat0;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD3.zw);
					    SV_Target0 = u_xlat1 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat0;
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					"ps_4_0_level_9_1
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat0 = u_xlat0 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006);
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat1 * vec4(0.400000006, 0.400000006, 0.400000006, 0.400000006) + u_xlat0;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat0 = u_xlat1 * vec4(0.150000006, 0.150000006, 0.150000006, 0.150000006) + u_xlat0;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat0 = u_xlat1 * vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001) + u_xlat0;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat0 = u_xlat1 * vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001) + u_xlat0;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat0 = u_xlat1 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat0;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD3.zw);
					    SV_Target0 = u_xlat1 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + u_xlat0;
					    return;
					}"
				}
			}
		}
	}
}