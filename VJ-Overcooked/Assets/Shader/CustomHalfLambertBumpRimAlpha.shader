Shader "Custom/HalfLambertBumpRimAlpha" {
	Properties {
		_MainTex ("Texture", 2D) = "white" {}
		_Color ("Color", Vector) = (1,1,1,1)
		_Brightness ("Brightness", Range(0, 5)) = 1
		_BumpMap ("Bumpmap", 2D) = "bump" {}
		_WrapAmount ("Wrap Amount", Range(0, 1)) = 0.5
		_RimColor ("Rim Color", Vector) = (0.26,0.19,0.16,0)
		_RimPower ("Rim Power", Range(0.5, 8)) = 0
		_Cutoff ("Alpha Cutoff", Range(0, 1)) = 0.5
	}
	SubShader {
		Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			Name "FORWARD"
			Tags { "LIGHTMODE" = "ForwardBase" "QUEUE" = "Transparent" "RenderType" = "Transparent" "SHADOWSUPPORT" = "true" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			ZClip Off
			GpuProgramID 54274
			Program "vp" {
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" }
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
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_1_0[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_2_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_4;
						vec4 unity_WorldTransformParams;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD1.w = u_xlat0.x;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat1.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    vs_TEXCOORD1.x = u_xlat1.z;
					    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
					    u_xlat3.xyz = u_xlat2.yzx * u_xlat1.yzx + (-u_xlat3.xyz);
					    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
					    vs_TEXCOORD1.y = u_xlat3.x;
					    vs_TEXCOORD1.z = u_xlat2.x;
					    vs_TEXCOORD2.x = u_xlat1.x;
					    vs_TEXCOORD3.x = u_xlat1.y;
					    vs_TEXCOORD2.w = u_xlat0.y;
					    vs_TEXCOORD3.w = u_xlat0.z;
					    vs_TEXCOORD2.y = u_xlat3.y;
					    vs_TEXCOORD3.y = u_xlat3.z;
					    vs_TEXCOORD2.z = u_xlat2.y;
					    vs_TEXCOORD3.z = u_xlat2.z;
					    u_xlat0.x = u_xlat2.y * u_xlat2.y;
					    u_xlat0.x = u_xlat2.x * u_xlat2.x + (-u_xlat0.x);
					    u_xlat1 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat1);
					    u_xlat3.y = dot(unity_SHBg, u_xlat1);
					    u_xlat3.z = dot(unity_SHBb, u_xlat1);
					    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat3.xyz;
					    u_xlat2.w = 1.0;
					    u_xlat1.x = dot(unity_SHAr, u_xlat2);
					    u_xlat1.y = dot(unity_SHAg, u_xlat2);
					    u_xlat1.z = dot(unity_SHAb, u_xlat2);
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					Keywords { "DIRECTIONAL" }
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
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_1_0[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_2_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_4;
						vec4 unity_WorldTransformParams;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD1.w = u_xlat0.x;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat1.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    vs_TEXCOORD1.x = u_xlat1.z;
					    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
					    u_xlat3.xyz = u_xlat2.yzx * u_xlat1.yzx + (-u_xlat3.xyz);
					    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
					    vs_TEXCOORD1.y = u_xlat3.x;
					    vs_TEXCOORD1.z = u_xlat2.x;
					    vs_TEXCOORD2.x = u_xlat1.x;
					    vs_TEXCOORD3.x = u_xlat1.y;
					    vs_TEXCOORD2.w = u_xlat0.y;
					    vs_TEXCOORD3.w = u_xlat0.z;
					    vs_TEXCOORD2.y = u_xlat3.y;
					    vs_TEXCOORD3.y = u_xlat3.z;
					    vs_TEXCOORD2.z = u_xlat2.y;
					    vs_TEXCOORD3.z = u_xlat2.z;
					    u_xlat0.x = u_xlat2.y * u_xlat2.y;
					    u_xlat0.x = u_xlat2.x * u_xlat2.x + (-u_xlat0.x);
					    u_xlat1 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat1);
					    u_xlat3.y = dot(unity_SHBg, u_xlat1);
					    u_xlat3.z = dot(unity_SHBb, u_xlat1);
					    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat3.xyz;
					    u_xlat2.w = 1.0;
					    u_xlat1.x = dot(unity_SHAr, u_xlat2);
					    u_xlat1.y = dot(unity_SHAg, u_xlat2);
					    u_xlat1.z = dot(unity_SHAb, u_xlat2);
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
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
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_3_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_4;
						vec4 unity_WorldTransformParams;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					float u_xlat16;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    u_xlat1.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    vs_TEXCOORD1.w = u_xlat1.x;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat2.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
					    vs_TEXCOORD1.x = u_xlat2.z;
					    u_xlat1.x = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat3.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat3.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat3.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat16 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat16 = inversesqrt(u_xlat16);
					    u_xlat3.xyz = vec3(u_xlat16) * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.zxy;
					    u_xlat4.xyz = u_xlat3.yzx * u_xlat2.yzx + (-u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat1.xxx * u_xlat4.xyz;
					    vs_TEXCOORD1.y = u_xlat4.x;
					    vs_TEXCOORD1.z = u_xlat3.x;
					    vs_TEXCOORD2.x = u_xlat2.x;
					    vs_TEXCOORD3.x = u_xlat2.y;
					    vs_TEXCOORD2.w = u_xlat1.y;
					    vs_TEXCOORD3.w = u_xlat1.z;
					    vs_TEXCOORD2.y = u_xlat4.y;
					    vs_TEXCOORD3.y = u_xlat4.z;
					    vs_TEXCOORD2.z = u_xlat3.y;
					    vs_TEXCOORD3.z = u_xlat3.z;
					    u_xlat1.x = u_xlat3.y * u_xlat3.y;
					    u_xlat1.x = u_xlat3.x * u_xlat3.x + (-u_xlat1.x);
					    u_xlat2 = u_xlat3.yzzx * u_xlat3.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat2);
					    u_xlat4.y = dot(unity_SHBg, u_xlat2);
					    u_xlat4.z = dot(unity_SHBb, u_xlat2);
					    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat4.xyz;
					    u_xlat3.w = 1.0;
					    u_xlat2.x = dot(unity_SHAr, u_xlat3);
					    u_xlat2.y = dot(unity_SHAg, u_xlat3);
					    u_xlat2.z = dot(unity_SHAb, u_xlat3);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD5.zw = u_xlat0.zw;
					    vs_TEXCOORD5.xy = u_xlat1.zz + u_xlat1.xw;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
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
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_1_0[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_1_6[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_2_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_4;
						vec4 unity_WorldTransformParams;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					float u_xlat18;
					float u_xlat19;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    u_xlat0.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat0.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat0.xyz;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    vs_TEXCOORD1.x = u_xlat0.z;
					    u_xlat18 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.zxy;
					    u_xlat2.xyz = u_xlat1.yzx * u_xlat0.yzx + (-u_xlat2.xyz);
					    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
					    vs_TEXCOORD1.y = u_xlat2.x;
					    u_xlat3.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat3.xyz;
					    vs_TEXCOORD1.w = u_xlat3.x;
					    vs_TEXCOORD1.z = u_xlat1.x;
					    vs_TEXCOORD2.x = u_xlat0.x;
					    vs_TEXCOORD3.x = u_xlat0.y;
					    vs_TEXCOORD2.w = u_xlat3.y;
					    vs_TEXCOORD2.y = u_xlat2.y;
					    vs_TEXCOORD3.y = u_xlat2.z;
					    vs_TEXCOORD2.z = u_xlat1.y;
					    vs_TEXCOORD3.w = u_xlat3.z;
					    vs_TEXCOORD3.z = u_xlat1.z;
					    u_xlat0.x = u_xlat1.y * u_xlat1.y;
					    u_xlat0.x = u_xlat1.x * u_xlat1.x + (-u_xlat0.x);
					    u_xlat2 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat2);
					    u_xlat4.y = dot(unity_SHBg, u_xlat2);
					    u_xlat4.z = dot(unity_SHBb, u_xlat2);
					    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat2.x = dot(unity_SHAr, u_xlat1);
					    u_xlat2.y = dot(unity_SHAg, u_xlat1);
					    u_xlat2.z = dot(unity_SHAb, u_xlat1);
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat2 = (-u_xlat3.yyyy) + unity_4LightPosY0;
					    u_xlat4 = u_xlat1.yyyy * u_xlat2;
					    u_xlat2 = u_xlat2 * u_xlat2;
					    u_xlat5 = (-u_xlat3.xxxx) + unity_4LightPosX0;
					    u_xlat3 = (-u_xlat3.zzzz) + unity_4LightPosZ0;
					    u_xlat4 = u_xlat5 * u_xlat1.xxxx + u_xlat4;
					    u_xlat1 = u_xlat3 * u_xlat1.zzzz + u_xlat4;
					    u_xlat2 = u_xlat5 * u_xlat5 + u_xlat2;
					    u_xlat2 = u_xlat3 * u_xlat3 + u_xlat2;
					    u_xlat2 = max(u_xlat2, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat3 = inversesqrt(u_xlat2);
					    u_xlat2 = u_xlat2 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat2 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat2;
					    u_xlat1 = u_xlat1 * u_xlat3;
					    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat1 = u_xlat2 * u_xlat1;
					    u_xlat2.xyz = u_xlat1.yyy * unity_LightColor[1].xyz;
					    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat1.xyz = unity_LightColor[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
					    u_xlat1.xyz = unity_LightColor[3].xyz * u_xlat1.www + u_xlat1.xyz;
					    vs_TEXCOORD4.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
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
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_1_0[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_1_6[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_2_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_4;
						vec4 unity_WorldTransformParams;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					float u_xlat18;
					float u_xlat19;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    u_xlat0.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat0.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat0.xyz;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    vs_TEXCOORD1.x = u_xlat0.z;
					    u_xlat18 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.zxy;
					    u_xlat2.xyz = u_xlat1.yzx * u_xlat0.yzx + (-u_xlat2.xyz);
					    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
					    vs_TEXCOORD1.y = u_xlat2.x;
					    u_xlat3.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat3.xyz;
					    vs_TEXCOORD1.w = u_xlat3.x;
					    vs_TEXCOORD1.z = u_xlat1.x;
					    vs_TEXCOORD2.x = u_xlat0.x;
					    vs_TEXCOORD3.x = u_xlat0.y;
					    vs_TEXCOORD2.w = u_xlat3.y;
					    vs_TEXCOORD2.y = u_xlat2.y;
					    vs_TEXCOORD3.y = u_xlat2.z;
					    vs_TEXCOORD2.z = u_xlat1.y;
					    vs_TEXCOORD3.w = u_xlat3.z;
					    vs_TEXCOORD3.z = u_xlat1.z;
					    u_xlat0.x = u_xlat1.y * u_xlat1.y;
					    u_xlat0.x = u_xlat1.x * u_xlat1.x + (-u_xlat0.x);
					    u_xlat2 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat2);
					    u_xlat4.y = dot(unity_SHBg, u_xlat2);
					    u_xlat4.z = dot(unity_SHBb, u_xlat2);
					    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat2.x = dot(unity_SHAr, u_xlat1);
					    u_xlat2.y = dot(unity_SHAg, u_xlat1);
					    u_xlat2.z = dot(unity_SHAb, u_xlat1);
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat2 = (-u_xlat3.yyyy) + unity_4LightPosY0;
					    u_xlat4 = u_xlat1.yyyy * u_xlat2;
					    u_xlat2 = u_xlat2 * u_xlat2;
					    u_xlat5 = (-u_xlat3.xxxx) + unity_4LightPosX0;
					    u_xlat3 = (-u_xlat3.zzzz) + unity_4LightPosZ0;
					    u_xlat4 = u_xlat5 * u_xlat1.xxxx + u_xlat4;
					    u_xlat1 = u_xlat3 * u_xlat1.zzzz + u_xlat4;
					    u_xlat2 = u_xlat5 * u_xlat5 + u_xlat2;
					    u_xlat2 = u_xlat3 * u_xlat3 + u_xlat2;
					    u_xlat2 = max(u_xlat2, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat3 = inversesqrt(u_xlat2);
					    u_xlat2 = u_xlat2 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat2 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat2;
					    u_xlat1 = u_xlat1 * u_xlat3;
					    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat1 = u_xlat2 * u_xlat1;
					    u_xlat2.xyz = u_xlat1.yyy * unity_LightColor[1].xyz;
					    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat1.xyz = unity_LightColor[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
					    u_xlat1.xyz = unity_LightColor[3].xyz * u_xlat1.www + u_xlat1.xyz;
					    vs_TEXCOORD4.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
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
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_6[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_3_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_4;
						vec4 unity_WorldTransformParams;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					float u_xlat22;
					float u_xlat23;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat1.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
					    vs_TEXCOORD1.x = u_xlat1.z;
					    u_xlat22 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat23 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat23 = inversesqrt(u_xlat23);
					    u_xlat2.xyz = vec3(u_xlat23) * u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
					    u_xlat3.xyz = u_xlat2.yzx * u_xlat1.yzx + (-u_xlat3.xyz);
					    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz;
					    vs_TEXCOORD1.y = u_xlat3.x;
					    u_xlat4.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat4.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
					    u_xlat4.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
					    u_xlat4.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat4.xyz;
					    vs_TEXCOORD1.w = u_xlat4.x;
					    vs_TEXCOORD1.z = u_xlat2.x;
					    vs_TEXCOORD2.x = u_xlat1.x;
					    vs_TEXCOORD3.x = u_xlat1.y;
					    vs_TEXCOORD2.w = u_xlat4.y;
					    vs_TEXCOORD2.y = u_xlat3.y;
					    vs_TEXCOORD3.y = u_xlat3.z;
					    vs_TEXCOORD2.z = u_xlat2.y;
					    vs_TEXCOORD3.w = u_xlat4.z;
					    vs_TEXCOORD3.z = u_xlat2.z;
					    u_xlat1.x = u_xlat2.y * u_xlat2.y;
					    u_xlat1.x = u_xlat2.x * u_xlat2.x + (-u_xlat1.x);
					    u_xlat3 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat5.x = dot(unity_SHBr, u_xlat3);
					    u_xlat5.y = dot(unity_SHBg, u_xlat3);
					    u_xlat5.z = dot(unity_SHBb, u_xlat3);
					    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat5.xyz;
					    u_xlat2.w = 1.0;
					    u_xlat3.x = dot(unity_SHAr, u_xlat2);
					    u_xlat3.y = dot(unity_SHAg, u_xlat2);
					    u_xlat3.z = dot(unity_SHAb, u_xlat2);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat3 = (-u_xlat4.yyyy) + unity_4LightPosY0;
					    u_xlat5 = u_xlat2.yyyy * u_xlat3;
					    u_xlat3 = u_xlat3 * u_xlat3;
					    u_xlat6 = (-u_xlat4.xxxx) + unity_4LightPosX0;
					    u_xlat4 = (-u_xlat4.zzzz) + unity_4LightPosZ0;
					    u_xlat5 = u_xlat6 * u_xlat2.xxxx + u_xlat5;
					    u_xlat2 = u_xlat4 * u_xlat2.zzzz + u_xlat5;
					    u_xlat3 = u_xlat6 * u_xlat6 + u_xlat3;
					    u_xlat3 = u_xlat4 * u_xlat4 + u_xlat3;
					    u_xlat3 = max(u_xlat3, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat4 = inversesqrt(u_xlat3);
					    u_xlat3 = u_xlat3 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat3 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat3;
					    u_xlat2 = u_xlat2 * u_xlat4;
					    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat2 = u_xlat3 * u_xlat2;
					    u_xlat3.xyz = u_xlat2.yyy * unity_LightColor[1].xyz;
					    u_xlat3.xyz = unity_LightColor[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
					    u_xlat2.xyz = unity_LightColor[2].xyz * u_xlat2.zzz + u_xlat3.xyz;
					    u_xlat2.xyz = unity_LightColor[3].xyz * u_xlat2.www + u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD5.zw = u_xlat0.zw;
					    vs_TEXCOORD5.xy = u_xlat1.zz + u_xlat1.xw;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" }
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
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_3_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_4;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityFog {
						vec4 unused_4_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out float vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z / _ProjectionParams.y;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.z;
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    vs_TEXCOORD6 = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD1.w = u_xlat0.x;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat1.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    vs_TEXCOORD1.x = u_xlat1.z;
					    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
					    u_xlat3.xyz = u_xlat2.yzx * u_xlat1.yzx + (-u_xlat3.xyz);
					    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
					    vs_TEXCOORD1.y = u_xlat3.x;
					    vs_TEXCOORD1.z = u_xlat2.x;
					    vs_TEXCOORD2.x = u_xlat1.x;
					    vs_TEXCOORD3.x = u_xlat1.y;
					    vs_TEXCOORD2.w = u_xlat0.y;
					    vs_TEXCOORD3.w = u_xlat0.z;
					    vs_TEXCOORD2.y = u_xlat3.y;
					    vs_TEXCOORD3.y = u_xlat3.z;
					    vs_TEXCOORD2.z = u_xlat2.y;
					    vs_TEXCOORD3.z = u_xlat2.z;
					    u_xlat0.x = u_xlat2.y * u_xlat2.y;
					    u_xlat0.x = u_xlat2.x * u_xlat2.x + (-u_xlat0.x);
					    u_xlat1 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat1);
					    u_xlat3.y = dot(unity_SHBg, u_xlat1);
					    u_xlat3.z = dot(unity_SHBb, u_xlat1);
					    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat3.xyz;
					    u_xlat2.w = 1.0;
					    u_xlat1.x = dot(unity_SHAr, u_xlat2);
					    u_xlat1.y = dot(unity_SHAg, u_xlat2);
					    u_xlat1.z = dot(unity_SHAb, u_xlat2);
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" }
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
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_1_0[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_2_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_4;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityFog {
						vec4 unused_3_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out float vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD6 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD1.w = u_xlat0.x;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat1.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    vs_TEXCOORD1.x = u_xlat1.z;
					    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
					    u_xlat3.xyz = u_xlat2.yzx * u_xlat1.yzx + (-u_xlat3.xyz);
					    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
					    vs_TEXCOORD1.y = u_xlat3.x;
					    vs_TEXCOORD1.z = u_xlat2.x;
					    vs_TEXCOORD2.x = u_xlat1.x;
					    vs_TEXCOORD3.x = u_xlat1.y;
					    vs_TEXCOORD2.w = u_xlat0.y;
					    vs_TEXCOORD3.w = u_xlat0.z;
					    vs_TEXCOORD2.y = u_xlat3.y;
					    vs_TEXCOORD3.y = u_xlat3.z;
					    vs_TEXCOORD2.z = u_xlat2.y;
					    vs_TEXCOORD3.z = u_xlat2.z;
					    u_xlat0.x = u_xlat2.y * u_xlat2.y;
					    u_xlat0.x = u_xlat2.x * u_xlat2.x + (-u_xlat0.x);
					    u_xlat1 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat1);
					    u_xlat3.y = dot(unity_SHBg, u_xlat1);
					    u_xlat3.z = dot(unity_SHBb, u_xlat1);
					    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat3.xyz;
					    u_xlat2.w = 1.0;
					    u_xlat1.x = dot(unity_SHAr, u_xlat2);
					    u_xlat1.y = dot(unity_SHAg, u_xlat2);
					    u_xlat1.z = dot(unity_SHAb, u_xlat2);
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" }
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
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_3_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_4;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityFog {
						vec4 unused_4_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out float vs_TEXCOORD6;
					out vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					float u_xlat16;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    u_xlat1.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    vs_TEXCOORD1.w = u_xlat1.x;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat2.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
					    vs_TEXCOORD1.x = u_xlat2.z;
					    u_xlat1.x = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat3.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat3.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat3.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat16 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat16 = inversesqrt(u_xlat16);
					    u_xlat3.xyz = vec3(u_xlat16) * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.zxy;
					    u_xlat4.xyz = u_xlat3.yzx * u_xlat2.yzx + (-u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat1.xxx * u_xlat4.xyz;
					    vs_TEXCOORD1.y = u_xlat4.x;
					    vs_TEXCOORD1.z = u_xlat3.x;
					    vs_TEXCOORD2.x = u_xlat2.x;
					    vs_TEXCOORD3.x = u_xlat2.y;
					    vs_TEXCOORD2.w = u_xlat1.y;
					    vs_TEXCOORD3.w = u_xlat1.z;
					    vs_TEXCOORD2.y = u_xlat4.y;
					    vs_TEXCOORD3.y = u_xlat4.z;
					    vs_TEXCOORD2.z = u_xlat3.y;
					    vs_TEXCOORD3.z = u_xlat3.z;
					    u_xlat1.x = u_xlat3.y * u_xlat3.y;
					    u_xlat1.x = u_xlat3.x * u_xlat3.x + (-u_xlat1.x);
					    u_xlat2 = u_xlat3.yzzx * u_xlat3.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat2);
					    u_xlat4.y = dot(unity_SHBg, u_xlat2);
					    u_xlat4.z = dot(unity_SHBb, u_xlat2);
					    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat4.xyz;
					    u_xlat3.w = 1.0;
					    u_xlat2.x = dot(unity_SHAr, u_xlat3);
					    u_xlat2.y = dot(unity_SHAg, u_xlat3);
					    u_xlat2.z = dot(unity_SHAb, u_xlat3);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD4.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.x = u_xlat0.z / _ProjectionParams.y;
					    u_xlat1.x = (-u_xlat1.x) + 1.0;
					    u_xlat1.x = u_xlat1.x * _ProjectionParams.z;
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    vs_TEXCOORD6 = u_xlat1.x * unity_FogParams.z + unity_FogParams.w;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD5.zw = u_xlat0.zw;
					    vs_TEXCOORD5.xy = u_xlat1.zz + u_xlat1.xw;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" "VERTEXLIGHT_ON" }
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
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_6[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_3_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_4;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityFog {
						vec4 unused_4_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out float vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					float u_xlat18;
					float u_xlat19;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    u_xlat0.x = u_xlat0.z / _ProjectionParams.y;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.z;
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    vs_TEXCOORD6 = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    u_xlat0.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat0.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat0.xyz;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    vs_TEXCOORD1.x = u_xlat0.z;
					    u_xlat18 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.zxy;
					    u_xlat2.xyz = u_xlat1.yzx * u_xlat0.yzx + (-u_xlat2.xyz);
					    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
					    vs_TEXCOORD1.y = u_xlat2.x;
					    u_xlat3.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat3.xyz;
					    vs_TEXCOORD1.w = u_xlat3.x;
					    vs_TEXCOORD1.z = u_xlat1.x;
					    vs_TEXCOORD2.x = u_xlat0.x;
					    vs_TEXCOORD3.x = u_xlat0.y;
					    vs_TEXCOORD2.w = u_xlat3.y;
					    vs_TEXCOORD2.y = u_xlat2.y;
					    vs_TEXCOORD3.y = u_xlat2.z;
					    vs_TEXCOORD2.z = u_xlat1.y;
					    vs_TEXCOORD3.w = u_xlat3.z;
					    vs_TEXCOORD3.z = u_xlat1.z;
					    u_xlat0.x = u_xlat1.y * u_xlat1.y;
					    u_xlat0.x = u_xlat1.x * u_xlat1.x + (-u_xlat0.x);
					    u_xlat2 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat2);
					    u_xlat4.y = dot(unity_SHBg, u_xlat2);
					    u_xlat4.z = dot(unity_SHBb, u_xlat2);
					    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat2.x = dot(unity_SHAr, u_xlat1);
					    u_xlat2.y = dot(unity_SHAg, u_xlat1);
					    u_xlat2.z = dot(unity_SHAb, u_xlat1);
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat2 = (-u_xlat3.yyyy) + unity_4LightPosY0;
					    u_xlat4 = u_xlat1.yyyy * u_xlat2;
					    u_xlat2 = u_xlat2 * u_xlat2;
					    u_xlat5 = (-u_xlat3.xxxx) + unity_4LightPosX0;
					    u_xlat3 = (-u_xlat3.zzzz) + unity_4LightPosZ0;
					    u_xlat4 = u_xlat5 * u_xlat1.xxxx + u_xlat4;
					    u_xlat1 = u_xlat3 * u_xlat1.zzzz + u_xlat4;
					    u_xlat2 = u_xlat5 * u_xlat5 + u_xlat2;
					    u_xlat2 = u_xlat3 * u_xlat3 + u_xlat2;
					    u_xlat2 = max(u_xlat2, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat3 = inversesqrt(u_xlat2);
					    u_xlat2 = u_xlat2 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat2 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat2;
					    u_xlat1 = u_xlat1 * u_xlat3;
					    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat1 = u_xlat2 * u_xlat1;
					    u_xlat2.xyz = u_xlat1.yyy * unity_LightColor[1].xyz;
					    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat1.xyz = unity_LightColor[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
					    u_xlat1.xyz = unity_LightColor[3].xyz * u_xlat1.www + u_xlat1.xyz;
					    vs_TEXCOORD4.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" "VERTEXLIGHT_ON" }
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
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_1_0[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_1_6[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_2_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_4;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityFog {
						vec4 unused_3_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out float vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					float u_xlat18;
					float u_xlat19;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD6 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    u_xlat0.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat0.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat0.xyz;
					    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
					    vs_TEXCOORD1.x = u_xlat0.z;
					    u_xlat18 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.zxy;
					    u_xlat2.xyz = u_xlat1.yzx * u_xlat0.yzx + (-u_xlat2.xyz);
					    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
					    vs_TEXCOORD1.y = u_xlat2.x;
					    u_xlat3.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat3.xyz;
					    vs_TEXCOORD1.w = u_xlat3.x;
					    vs_TEXCOORD1.z = u_xlat1.x;
					    vs_TEXCOORD2.x = u_xlat0.x;
					    vs_TEXCOORD3.x = u_xlat0.y;
					    vs_TEXCOORD2.w = u_xlat3.y;
					    vs_TEXCOORD2.y = u_xlat2.y;
					    vs_TEXCOORD3.y = u_xlat2.z;
					    vs_TEXCOORD2.z = u_xlat1.y;
					    vs_TEXCOORD3.w = u_xlat3.z;
					    vs_TEXCOORD3.z = u_xlat1.z;
					    u_xlat0.x = u_xlat1.y * u_xlat1.y;
					    u_xlat0.x = u_xlat1.x * u_xlat1.x + (-u_xlat0.x);
					    u_xlat2 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat2);
					    u_xlat4.y = dot(unity_SHBg, u_xlat2);
					    u_xlat4.z = dot(unity_SHBb, u_xlat2);
					    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat2.x = dot(unity_SHAr, u_xlat1);
					    u_xlat2.y = dot(unity_SHAg, u_xlat1);
					    u_xlat2.z = dot(unity_SHAb, u_xlat1);
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat2 = (-u_xlat3.yyyy) + unity_4LightPosY0;
					    u_xlat4 = u_xlat1.yyyy * u_xlat2;
					    u_xlat2 = u_xlat2 * u_xlat2;
					    u_xlat5 = (-u_xlat3.xxxx) + unity_4LightPosX0;
					    u_xlat3 = (-u_xlat3.zzzz) + unity_4LightPosZ0;
					    u_xlat4 = u_xlat5 * u_xlat1.xxxx + u_xlat4;
					    u_xlat1 = u_xlat3 * u_xlat1.zzzz + u_xlat4;
					    u_xlat2 = u_xlat5 * u_xlat5 + u_xlat2;
					    u_xlat2 = u_xlat3 * u_xlat3 + u_xlat2;
					    u_xlat2 = max(u_xlat2, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat3 = inversesqrt(u_xlat2);
					    u_xlat2 = u_xlat2 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat2 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat2;
					    u_xlat1 = u_xlat1 * u_xlat3;
					    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat1 = u_xlat2 * u_xlat1;
					    u_xlat2.xyz = u_xlat1.yyy * unity_LightColor[1].xyz;
					    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat1.xyz = unity_LightColor[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
					    u_xlat1.xyz = unity_LightColor[3].xyz * u_xlat1.www + u_xlat1.xyz;
					    vs_TEXCOORD4.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" "VERTEXLIGHT_ON" }
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
						vec4 unused_0_0[8];
						vec4 _MainTex_ST;
						vec4 _BumpMap_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_2_6[31];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unity_SHBr;
						vec4 unity_SHBg;
						vec4 unity_SHBb;
						vec4 unity_SHC;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_3_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_4;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityFog {
						vec4 unused_4_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out float vs_TEXCOORD6;
					out vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					float u_xlat22;
					float u_xlat23;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat1.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat22 = inversesqrt(u_xlat22);
					    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
					    vs_TEXCOORD1.x = u_xlat1.z;
					    u_xlat22 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat23 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat23 = inversesqrt(u_xlat23);
					    u_xlat2.xyz = vec3(u_xlat23) * u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.zxy;
					    u_xlat3.xyz = u_xlat2.yzx * u_xlat1.yzx + (-u_xlat3.xyz);
					    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz;
					    vs_TEXCOORD1.y = u_xlat3.x;
					    u_xlat4.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat4.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
					    u_xlat4.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
					    u_xlat4.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat4.xyz;
					    vs_TEXCOORD1.w = u_xlat4.x;
					    vs_TEXCOORD1.z = u_xlat2.x;
					    vs_TEXCOORD2.x = u_xlat1.x;
					    vs_TEXCOORD3.x = u_xlat1.y;
					    vs_TEXCOORD2.w = u_xlat4.y;
					    vs_TEXCOORD2.y = u_xlat3.y;
					    vs_TEXCOORD3.y = u_xlat3.z;
					    vs_TEXCOORD2.z = u_xlat2.y;
					    vs_TEXCOORD3.w = u_xlat4.z;
					    vs_TEXCOORD3.z = u_xlat2.z;
					    u_xlat1.x = u_xlat2.y * u_xlat2.y;
					    u_xlat1.x = u_xlat2.x * u_xlat2.x + (-u_xlat1.x);
					    u_xlat3 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat5.x = dot(unity_SHBr, u_xlat3);
					    u_xlat5.y = dot(unity_SHBg, u_xlat3);
					    u_xlat5.z = dot(unity_SHBb, u_xlat3);
					    u_xlat1.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat5.xyz;
					    u_xlat2.w = 1.0;
					    u_xlat3.x = dot(unity_SHAr, u_xlat2);
					    u_xlat3.y = dot(unity_SHAg, u_xlat2);
					    u_xlat3.z = dot(unity_SHAb, u_xlat2);
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat3 = (-u_xlat4.yyyy) + unity_4LightPosY0;
					    u_xlat5 = u_xlat2.yyyy * u_xlat3;
					    u_xlat3 = u_xlat3 * u_xlat3;
					    u_xlat6 = (-u_xlat4.xxxx) + unity_4LightPosX0;
					    u_xlat4 = (-u_xlat4.zzzz) + unity_4LightPosZ0;
					    u_xlat5 = u_xlat6 * u_xlat2.xxxx + u_xlat5;
					    u_xlat2 = u_xlat4 * u_xlat2.zzzz + u_xlat5;
					    u_xlat3 = u_xlat6 * u_xlat6 + u_xlat3;
					    u_xlat3 = u_xlat4 * u_xlat4 + u_xlat3;
					    u_xlat3 = max(u_xlat3, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat4 = inversesqrt(u_xlat3);
					    u_xlat3 = u_xlat3 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat3 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat3;
					    u_xlat2 = u_xlat2 * u_xlat4;
					    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat2 = u_xlat3 * u_xlat2;
					    u_xlat3.xyz = u_xlat2.yyy * unity_LightColor[1].xyz;
					    u_xlat3.xyz = unity_LightColor[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
					    u_xlat2.xyz = unity_LightColor[2].xyz * u_xlat2.zzz + u_xlat3.xyz;
					    u_xlat2.xyz = unity_LightColor[3].xyz * u_xlat2.www + u_xlat2.xyz;
					    vs_TEXCOORD4.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.x = u_xlat0.z / _ProjectionParams.y;
					    u_xlat1.x = (-u_xlat1.x) + 1.0;
					    u_xlat1.x = u_xlat1.x * _ProjectionParams.z;
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    vs_TEXCOORD6 = u_xlat1.x * unity_FogParams.z + unity_FogParams.w;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD5.zw = u_xlat0.zw;
					    vs_TEXCOORD5.xy = u_xlat1.zz + u_xlat1.xw;
					    return;
					}"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" }
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
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _Color;
						float _WrapAmount;
						vec4 _RimColor;
						float _RimPower;
						float _Brightness;
						vec4 unused_0_8[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[44];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD1.w;
					    u_xlat0.y = vs_TEXCOORD2.w;
					    u_xlat0.z = vs_TEXCOORD3.w;
					    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat1.xy = u_xlat1.wy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat12 = min(u_xlat12, 1.0);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat1.z = sqrt(u_xlat12);
					    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD2.xyz, u_xlat1.xyz);
					    u_xlat2.z = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _RimPower;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.xzw = u_xlat0.xxx * _RimColor.xyz;
					    u_xlat1.x = (-_WrapAmount) + 1.0;
					    u_xlat4 = u_xlat4 * _WrapAmount + u_xlat1.x;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat2.xyz = u_xlat1.xyz * vec3(vec3(_Brightness, _Brightness, _Brightness));
					    u_xlat3.xyz = u_xlat2.xyz * _LightColor0.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vs_TEXCOORD4.xyz;
					    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat0.xzw;
					    u_xlat1.xyz = u_xlat0.xyz + u_xlat0.xyz;
					    u_xlat2.w = 0.0;
					    SV_Target0 = u_xlat1 + u_xlat2;
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					Keywords { "DIRECTIONAL" }
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
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _Color;
						float _WrapAmount;
						vec4 _RimColor;
						float _RimPower;
						float _Brightness;
						vec4 unused_0_8[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[44];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD1.w;
					    u_xlat0.y = vs_TEXCOORD2.w;
					    u_xlat0.z = vs_TEXCOORD3.w;
					    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat1.xy = u_xlat1.wy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat12 = min(u_xlat12, 1.0);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat1.z = sqrt(u_xlat12);
					    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD2.xyz, u_xlat1.xyz);
					    u_xlat2.z = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _RimPower;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.xzw = u_xlat0.xxx * _RimColor.xyz;
					    u_xlat1.x = (-_WrapAmount) + 1.0;
					    u_xlat4 = u_xlat4 * _WrapAmount + u_xlat1.x;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat2.xyz = u_xlat1.xyz * vec3(vec3(_Brightness, _Brightness, _Brightness));
					    u_xlat3.xyz = u_xlat2.xyz * _LightColor0.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vs_TEXCOORD4.xyz;
					    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat0.xzw;
					    u_xlat1.xyz = u_xlat0.xyz + u_xlat0.xyz;
					    u_xlat2.w = 0.0;
					    SV_Target0 = u_xlat1 + u_xlat2;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
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
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _Color;
						float _WrapAmount;
						vec4 _RimColor;
						float _RimPower;
						float _Brightness;
						vec4 unused_0_8[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[44];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					uniform  sampler2D _ShadowMapTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  vec4 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					float u_xlat4;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD1.w;
					    u_xlat0.y = vs_TEXCOORD2.w;
					    u_xlat0.z = vs_TEXCOORD3.w;
					    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat1.xy = u_xlat1.wy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat12 = min(u_xlat12, 1.0);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat1.z = sqrt(u_xlat12);
					    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD2.xyz, u_xlat1.xyz);
					    u_xlat2.z = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _RimPower;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.xzw = u_xlat0.xxx * _RimColor.xyz;
					    u_xlat1.x = (-_WrapAmount) + 1.0;
					    u_xlat4 = u_xlat4 * _WrapAmount + u_xlat1.x;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat2.xyz = u_xlat1.xyz * vec3(vec3(_Brightness, _Brightness, _Brightness));
					    u_xlat3.xyz = u_xlat2.xyz * _LightColor0.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vs_TEXCOORD4.xyz;
					    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat0.xzw;
					    u_xlat3.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
					    u_xlat3 = texture(_ShadowMapTexture, u_xlat3.xy);
					    u_xlat12 = u_xlat3.x + u_xlat3.x;
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat2.w = 0.0;
					    SV_Target0 = u_xlat1 + u_xlat2;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" }
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
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _Color;
						float _WrapAmount;
						vec4 _RimColor;
						float _RimPower;
						float _Brightness;
						vec4 unused_0_8[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[44];
					};
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unused_3_1;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  float vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD1.w;
					    u_xlat0.y = vs_TEXCOORD2.w;
					    u_xlat0.z = vs_TEXCOORD3.w;
					    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat1.xy = u_xlat1.wy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat12 = min(u_xlat12, 1.0);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat1.z = sqrt(u_xlat12);
					    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD2.xyz, u_xlat1.xyz);
					    u_xlat2.z = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat4 = u_xlat4 * _WrapAmount + (-_WrapAmount);
					    u_xlat4 = u_xlat4 + 1.0;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _RimPower;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.xzw = u_xlat0.xxx * _RimColor.xyz;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat2.xyz = u_xlat1.xyz * vec3(vec3(_Brightness, _Brightness, _Brightness));
					    u_xlat3.xyz = u_xlat2.xyz * _LightColor0.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vs_TEXCOORD4.xyz;
					    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat0.xzw;
					    u_xlat1.xyz = u_xlat0.xyz + u_xlat0.xyz;
					    u_xlat2.w = 0.0;
					    u_xlat0 = u_xlat1 + u_xlat2;
					    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
					    SV_Target0.w = u_xlat0.w;
					    u_xlat12 = vs_TEXCOORD6;
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat12) * u_xlat0.xyz + unity_FogColor.xyz;
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					Keywords { "DIRECTIONAL" "FOG_LINEAR" }
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
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _Color;
						float _WrapAmount;
						vec4 _RimColor;
						float _RimPower;
						float _Brightness;
						vec4 unused_0_8[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[44];
					};
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unused_3_1;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  float vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD1.w;
					    u_xlat0.y = vs_TEXCOORD2.w;
					    u_xlat0.z = vs_TEXCOORD3.w;
					    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat1.xy = u_xlat1.wy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat12 = min(u_xlat12, 1.0);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat1.z = sqrt(u_xlat12);
					    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD2.xyz, u_xlat1.xyz);
					    u_xlat2.z = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat4 = u_xlat4 * _WrapAmount + (-_WrapAmount);
					    u_xlat4 = u_xlat4 + 1.0;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _RimPower;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.xzw = u_xlat0.xxx * _RimColor.xyz;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat2.xyz = u_xlat1.xyz * vec3(vec3(_Brightness, _Brightness, _Brightness));
					    u_xlat3.xyz = u_xlat2.xyz * _LightColor0.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vs_TEXCOORD4.xyz;
					    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat0.xzw;
					    u_xlat1.xyz = u_xlat0.xyz + u_xlat0.xyz;
					    u_xlat2.w = 0.0;
					    u_xlat0 = u_xlat1 + u_xlat2;
					    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
					    SV_Target0.w = u_xlat0.w;
					    u_xlat12 = vs_TEXCOORD6;
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat12) * u_xlat0.xyz + unity_FogColor.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "FOG_LINEAR" }
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
						vec4 _LightColor0;
						vec4 unused_0_2;
						vec4 _Color;
						float _WrapAmount;
						vec4 _RimColor;
						float _RimPower;
						float _Brightness;
						vec4 unused_0_8[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[44];
					};
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unused_3_1;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _BumpMap;
					uniform  sampler2D _ShadowMapTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					in  float vs_TEXCOORD6;
					in  vec4 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					float u_xlat4;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = vs_TEXCOORD1.w;
					    u_xlat0.y = vs_TEXCOORD2.w;
					    u_xlat0.z = vs_TEXCOORD3.w;
					    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1 = texture(_BumpMap, vs_TEXCOORD0.zw);
					    u_xlat1.xy = u_xlat1.wy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat12 = min(u_xlat12, 1.0);
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat1.z = sqrt(u_xlat12);
					    u_xlat2.x = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
					    u_xlat2.y = dot(vs_TEXCOORD2.xyz, u_xlat1.xyz);
					    u_xlat2.z = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat4 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat4 = u_xlat4 * _WrapAmount + (-_WrapAmount);
					    u_xlat4 = u_xlat4 + 1.0;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _RimPower;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat0.xzw = u_xlat0.xxx * _RimColor.xyz;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1 = u_xlat1 * _Color;
					    u_xlat2.xyz = u_xlat1.xyz * vec3(vec3(_Brightness, _Brightness, _Brightness));
					    u_xlat3.xyz = u_xlat2.xyz * _LightColor0.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vs_TEXCOORD4.xyz;
					    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + u_xlat0.xzw;
					    u_xlat3.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
					    u_xlat3 = texture(_ShadowMapTexture, u_xlat3.xy);
					    u_xlat12 = u_xlat3.x + u_xlat3.x;
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat2.w = 0.0;
					    u_xlat0 = u_xlat1 + u_xlat2;
					    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
					    SV_Target0.w = u_xlat0.w;
					    u_xlat12 = vs_TEXCOORD6;
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat12) * u_xlat0.xyz + unity_FogColor.xyz;
					    return;
					}"
				}
			}
		}
		Pass {
			Name "META"
			Tags { "LIGHTMODE" = "Meta" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			ZClip Off
			Cull Off
			GpuProgramID 91281
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
						vec4 unused_0_0[9];
						vec4 _MainTex_ST;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_4;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityLightmaps {
						vec4 unity_LightmapST;
						vec4 unity_DynamicLightmapST;
					};
					layout(std140) uniform UnityMetaPass {
						bvec4 unity_MetaVertexControl;
						vec4 unused_3_1;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_TEXCOORD1;
					in  vec4 in_TEXCOORD2;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					float u_xlat9;
					bool u_xlatb9;
					void main()
					{
					    u_xlatb0 = 0.0<in_POSITION0.z;
					    u_xlat0.z = u_xlatb0 ? 9.99999975e-05 : float(0.0);
					    u_xlat0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    u_xlat0.xyz = (unity_MetaVertexControl.x) ? u_xlat0.xyz : in_POSITION0.xyz;
					    u_xlatb9 = 0.0<u_xlat0.z;
					    u_xlat1.z = u_xlatb9 ? 9.99999975e-05 : float(0.0);
					    u_xlat1.xy = in_TEXCOORD2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
					    u_xlat0.xyz = (unity_MetaVertexControl.y) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1 = u_xlat0.yyyy * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = glstate_matrix_mvp[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = u_xlat0 + glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat1.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat2.xyz);
					    u_xlat9 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
					    vs_TEXCOORD1.y = u_xlat2.x;
					    vs_TEXCOORD1.x = u_xlat1.z;
					    vs_TEXCOORD1.z = u_xlat0.y;
					    vs_TEXCOORD2.x = u_xlat1.x;
					    vs_TEXCOORD3.x = u_xlat1.y;
					    vs_TEXCOORD2.z = u_xlat0.z;
					    vs_TEXCOORD3.z = u_xlat0.x;
					    vs_TEXCOORD2.y = u_xlat2.y;
					    vs_TEXCOORD3.y = u_xlat2.z;
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
						vec4 unused_0_0[9];
						vec4 _MainTex_ST;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_4;
						vec4 unity_WorldTransformParams;
					};
					layout(std140) uniform UnityLightmaps {
						vec4 unity_LightmapST;
						vec4 unity_DynamicLightmapST;
					};
					layout(std140) uniform UnityMetaPass {
						bvec4 unity_MetaVertexControl;
						vec4 unused_3_1;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_TEXCOORD1;
					in  vec4 in_TEXCOORD2;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					float u_xlat9;
					bool u_xlatb9;
					void main()
					{
					    u_xlatb0 = 0.0<in_POSITION0.z;
					    u_xlat0.z = u_xlatb0 ? 9.99999975e-05 : float(0.0);
					    u_xlat0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    u_xlat0.xyz = (unity_MetaVertexControl.x) ? u_xlat0.xyz : in_POSITION0.xyz;
					    u_xlatb9 = 0.0<u_xlat0.z;
					    u_xlat1.z = u_xlatb9 ? 9.99999975e-05 : float(0.0);
					    u_xlat1.xy = in_TEXCOORD2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
					    u_xlat0.xyz = (unity_MetaVertexControl.y) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1 = u_xlat0.yyyy * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = glstate_matrix_mvp[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = u_xlat0 + glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat1.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat2.xyz);
					    u_xlat9 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
					    vs_TEXCOORD1.y = u_xlat2.x;
					    vs_TEXCOORD1.x = u_xlat1.z;
					    vs_TEXCOORD1.z = u_xlat0.y;
					    vs_TEXCOORD2.x = u_xlat1.x;
					    vs_TEXCOORD3.x = u_xlat1.y;
					    vs_TEXCOORD2.z = u_xlat0.z;
					    vs_TEXCOORD3.z = u_xlat0.x;
					    vs_TEXCOORD2.y = u_xlat2.y;
					    vs_TEXCOORD3.y = u_xlat2.z;
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
						vec4 unused_0_0[4];
						vec4 _Color;
						vec4 unused_0_2[2];
						float _Brightness;
						float unity_OneOverOutputBoost;
						float unity_MaxOutputValue;
						vec4 unused_0_6[2];
					};
					layout(std140) uniform UnityMetaPass {
						vec4 unused_1_0;
						bvec4 unity_MetaFragmentControl;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Brightness, _Brightness, _Brightness));
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat3 = unity_OneOverOutputBoost;
					    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat3);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = min(u_xlat0.xyz, vec3(vec3(unity_MaxOutputValue, unity_MaxOutputValue, unity_MaxOutputValue)));
					    u_xlat0.w = 1.0;
					    u_xlat0 = (unity_MetaFragmentControl.x) ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
					    SV_Target0 = (unity_MetaFragmentControl.y) ? vec4(0.0, 0.0, 0.0, 0.0235294122) : u_xlat0;
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
						vec4 unused_0_0[4];
						vec4 _Color;
						vec4 unused_0_2[2];
						float _Brightness;
						float unity_OneOverOutputBoost;
						float unity_MaxOutputValue;
						vec4 unused_0_6[2];
					};
					layout(std140) uniform UnityMetaPass {
						vec4 unused_1_0;
						bvec4 unity_MetaFragmentControl;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Brightness, _Brightness, _Brightness));
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat3 = unity_OneOverOutputBoost;
					    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat3);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = min(u_xlat0.xyz, vec3(vec3(unity_MaxOutputValue, unity_MaxOutputValue, unity_MaxOutputValue)));
					    u_xlat0.w = 1.0;
					    u_xlat0 = (unity_MetaFragmentControl.x) ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
					    SV_Target0 = (unity_MetaFragmentControl.y) ? vec4(0.0, 0.0, 0.0, 0.0235294122) : u_xlat0;
					    return;
					}"
				}
			}
		}
		Pass {
			Name "SHADOWCASTER"
			Tags { "LIGHTMODE" = "SHADOWCASTER" "QUEUE" = "Transparent" "RenderType" = "Transparent" "SHADOWSUPPORT" = "true" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			ZClip Off
			GpuProgramID 151236
			Program "vp" {
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_DEPTH" }
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
						vec4 unused_0_0[4];
						vec4 _MainTex_ST;
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[44];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_2_0[5];
						vec4 unity_LightShadowBias;
						vec4 unused_2_2[20];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_3_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_4[2];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_4_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_4_2;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					bool u_xlatb2;
					float u_xlat6;
					float u_xlat9;
					void main()
					{
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + unity_ObjectToWorld[3].xyz;
					    u_xlat1.xyz = (-u_xlat0.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
					    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
					    u_xlat9 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
					    u_xlat9 = sqrt(u_xlat9);
					    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
					    u_xlat0.xyz = (-u_xlat2.xyz) * vec3(u_xlat9) + u_xlat0.xyz;
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    u_xlat0 = u_xlat0 + unity_MatrixVP[3];
					    u_xlat1 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlatb2 = unity_LightShadowBias.z!=0.0;
					    u_xlat0 = (bool(u_xlatb2)) ? u_xlat0 : u_xlat1;
					    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
					    u_xlat1.x = min(u_xlat1.x, 0.0);
					    u_xlat1.x = max(u_xlat1.x, -1.0);
					    u_xlat6 = u_xlat0.z + u_xlat1.x;
					    u_xlat1.x = min(u_xlat0.w, u_xlat6);
					    gl_Position.xyw = u_xlat0.xyw;
					    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
					    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_CUBE" }
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
						vec4 unused_0_0[4];
						vec4 _MainTex_ST;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_1_0;
						vec4 _LightPositionRange;
						vec4 unused_1_2[43];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_2_1[8];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_3[6];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec3 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD0.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + glstate_matrix_mvp[3];
					    return;
					}"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_DEPTH" }
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
						vec4 _Color;
						float _Cutoff;
						vec4 unused_0_3;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler3D _DitherMaskLOD;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					float u_xlat2;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat0.x = u_xlat0.w * _Color.w + (-_Cutoff);
					    u_xlat2 = u_xlat0.w * _Color.w;
					    u_xlat1.z = u_xlat2 * 0.9375;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat1.xy = hlslcc_FragCoord.xy * vec2(0.25, 0.25);
					    u_xlat0 = texture(_DitherMaskLOD, u_xlat1.xyz);
					    u_xlat0.x = u_xlat0.w + -0.00999999978;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SHADOWS_CUBE" }
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
						vec4 _Color;
						float _Cutoff;
						vec4 unused_0_3;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_1_0;
						vec4 _LightPositionRange;
						vec4 unused_1_2[43];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_2_0[5];
						vec4 unity_LightShadowBias;
						vec4 unused_2_2[20];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler3D _DitherMaskLOD;
					in  vec3 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					float u_xlat2;
					void main()
					{
					vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat0.x = u_xlat0.w * _Color.w + (-_Cutoff);
					    u_xlat2 = u_xlat0.w * _Color.w;
					    u_xlat1.z = u_xlat2 * 0.9375;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat1.xy = hlslcc_FragCoord.xy * vec2(0.25, 0.25);
					    u_xlat0 = texture(_DitherMaskLOD, u_xlat1.xyz);
					    u_xlat0.x = u_xlat0.w + -0.00999999978;
					    u_xlatb0 = u_xlat0.x<0.0;
					    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard;}
					    u_xlat0.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x + unity_LightShadowBias.x;
					    SV_Target0 = u_xlat0.xxxx * _LightPositionRange.wwww;
					    return;
					}"
				}
			}
		}
	}
}