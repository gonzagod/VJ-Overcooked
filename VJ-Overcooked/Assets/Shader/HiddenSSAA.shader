Shader "Hidden/SSAA" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 6214
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
						vec4 _MainTex_TexelSize;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD2;
					out vec2 vs_TEXCOORD3;
					out vec2 vs_TEXCOORD4;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0.yz = _MainTex_TexelSize.yx * vec2(1.75, 1.75);
					    u_xlat0.x = float(0.0);
					    u_xlat0.w = float(0.0);
					    vs_TEXCOORD0.xy = (-u_xlat0.xy) + in_TEXCOORD0.xy;
					    vs_TEXCOORD1.xy = (-u_xlat0.zw) + in_TEXCOORD0.xy;
					    vs_TEXCOORD2.xy = u_xlat0.zw + in_TEXCOORD0.xy;
					    vs_TEXCOORD3.xy = u_xlat0.xy + in_TEXCOORD0.xy;
					    vs_TEXCOORD4.xy = in_TEXCOORD0.xy;
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
						vec4 _MainTex_TexelSize;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD2;
					out vec2 vs_TEXCOORD3;
					out vec2 vs_TEXCOORD4;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0.yz = _MainTex_TexelSize.yx * vec2(1.75, 1.75);
					    u_xlat0.x = float(0.0);
					    u_xlat0.w = float(0.0);
					    vs_TEXCOORD0.xy = (-u_xlat0.xy) + in_TEXCOORD0.xy;
					    vs_TEXCOORD1.xy = (-u_xlat0.zw) + in_TEXCOORD0.xy;
					    vs_TEXCOORD2.xy = u_xlat0.zw + in_TEXCOORD0.xy;
					    vs_TEXCOORD3.xy = u_xlat0.xy + in_TEXCOORD0.xy;
					    vs_TEXCOORD4.xy = in_TEXCOORD0.xy;
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
						vec4 unused_0_0[2];
						vec4 _MainTex_TexelSize;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec2 vs_TEXCOORD2;
					in  vec2 vs_TEXCOORD3;
					in  vec2 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					float u_xlat6;
					bool u_xlatb6;
					vec2 u_xlat12;
					vec2 u_xlat13;
					float u_xlat18;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat6 = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat12.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat18 = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat0.x = (-u_xlat18) + u_xlat0.x;
					    u_xlat1.x = (-u_xlat0.x);
					    u_xlat1.y = (-u_xlat6) + u_xlat12.x;
					    u_xlat0.x = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlatb6 = u_xlat0.x<0.0625;
					    if(u_xlatb6){
					        SV_Target0 = texture(_MainTex, vs_TEXCOORD4.xy);
					    } else {
					        u_xlat0.xy = _MainTex_TexelSize.xy / u_xlat0.xx;
					        u_xlat12.xy = u_xlat0.xy * u_xlat1.xy;
					        u_xlat2 = texture(_MainTex, vs_TEXCOORD4.xy);
					        u_xlat13.xy = u_xlat12.xy * vec2(0.5, 0.5) + vs_TEXCOORD4.xy;
					        u_xlat3 = texture(_MainTex, u_xlat13.xy);
					        u_xlat12.xy = (-u_xlat12.xy) * vec2(0.5, 0.5) + vs_TEXCOORD4.xy;
					        u_xlat4 = texture(_MainTex, u_xlat12.xy);
					        u_xlat12.xy = u_xlat1.xy * u_xlat0.xy + vs_TEXCOORD4.xy;
					        u_xlat5 = texture(_MainTex, u_xlat12.xy);
					        u_xlat0.xy = (-u_xlat1.xy) * u_xlat0.xy + vs_TEXCOORD4.xy;
					        u_xlat0 = texture(_MainTex, u_xlat0.xy);
					        u_xlat1 = u_xlat3 * vec4(0.899999976, 0.899999976, 0.899999976, 0.899999976) + u_xlat2;
					        u_xlat1 = u_xlat4 * vec4(0.899999976, 0.899999976, 0.899999976, 0.899999976) + u_xlat1;
					        u_xlat1 = u_xlat5 * vec4(0.75, 0.75, 0.75, 0.75) + u_xlat1;
					        u_xlat0 = u_xlat0 * vec4(0.75, 0.75, 0.75, 0.75) + u_xlat1;
					        SV_Target0 = u_xlat0 * vec4(0.232558131, 0.232558131, 0.232558131, 0.232558131);
					    }
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
						vec4 unused_0_0[2];
						vec4 _MainTex_TexelSize;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec2 vs_TEXCOORD2;
					in  vec2 vs_TEXCOORD3;
					in  vec2 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					float u_xlat6;
					bool u_xlatb6;
					vec2 u_xlat12;
					vec2 u_xlat13;
					float u_xlat18;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat6 = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat12.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat18 = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat0.x = (-u_xlat18) + u_xlat0.x;
					    u_xlat1.x = (-u_xlat0.x);
					    u_xlat1.y = (-u_xlat6) + u_xlat12.x;
					    u_xlat0.x = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlatb6 = u_xlat0.x<0.0625;
					    if(u_xlatb6){
					        SV_Target0 = texture(_MainTex, vs_TEXCOORD4.xy);
					    } else {
					        u_xlat0.xy = _MainTex_TexelSize.xy / u_xlat0.xx;
					        u_xlat12.xy = u_xlat0.xy * u_xlat1.xy;
					        u_xlat2 = texture(_MainTex, vs_TEXCOORD4.xy);
					        u_xlat13.xy = u_xlat12.xy * vec2(0.5, 0.5) + vs_TEXCOORD4.xy;
					        u_xlat3 = texture(_MainTex, u_xlat13.xy);
					        u_xlat12.xy = (-u_xlat12.xy) * vec2(0.5, 0.5) + vs_TEXCOORD4.xy;
					        u_xlat4 = texture(_MainTex, u_xlat12.xy);
					        u_xlat12.xy = u_xlat1.xy * u_xlat0.xy + vs_TEXCOORD4.xy;
					        u_xlat5 = texture(_MainTex, u_xlat12.xy);
					        u_xlat0.xy = (-u_xlat1.xy) * u_xlat0.xy + vs_TEXCOORD4.xy;
					        u_xlat0 = texture(_MainTex, u_xlat0.xy);
					        u_xlat1 = u_xlat3 * vec4(0.899999976, 0.899999976, 0.899999976, 0.899999976) + u_xlat2;
					        u_xlat1 = u_xlat4 * vec4(0.899999976, 0.899999976, 0.899999976, 0.899999976) + u_xlat1;
					        u_xlat1 = u_xlat5 * vec4(0.75, 0.75, 0.75, 0.75) + u_xlat1;
					        u_xlat0 = u_xlat0 * vec4(0.75, 0.75, 0.75, 0.75) + u_xlat1;
					        SV_Target0 = u_xlat0 * vec4(0.232558131, 0.232558131, 0.232558131, 0.232558131);
					    }
					    return;
					}"
				}
			}
		}
	}
}