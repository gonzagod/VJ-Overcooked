Shader "Custom/TransitionTexture" {
	Properties {
		_Texture1 ("Starting Texture (RGB)", 2D) = "white" {}
		_Texture2 ("Ending Texture (RGB)", 2D) = "white" {}
		Prop ("Prop", Range(0, 1)) = 0
		_Color ("Color", Vector) = (1,1,1,1)
	}
	SubShader {
		LOD 200
		Tags { "RenderType" = "Opaque" }
		Pass {
			Name "FORWARD"
			LOD 200
			Tags { "LIGHTMODE" = "ForwardBase" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
			ZClip Off
			GpuProgramID 15785
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
						vec4 unused_0_0[6];
						vec4 _Texture1_ST;
						vec4 _Texture2_ST;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_1_0[41];
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
						vec4 unused_2_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture1_ST.xy + _Texture1_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Texture2_ST.xy + _Texture2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat6 = u_xlat0.y * u_xlat0.y;
					    u_xlat6 = u_xlat0.x * u_xlat0.x + (-u_xlat6);
					    u_xlat1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat0.x = dot(unity_SHBr, u_xlat1);
					    u_xlat0.y = dot(unity_SHBg, u_xlat1);
					    u_xlat0.z = dot(unity_SHBb, u_xlat1);
					    vs_TEXCOORD3.xyz = unity_SHC.xyz * vec3(u_xlat6) + u_xlat0.xyz;
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
						vec4 unused_0_0[6];
						vec4 _Texture1_ST;
						vec4 _Texture2_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0[41];
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
						vec4 unused_3_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture1_ST.xy + _Texture1_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Texture2_ST.xy + _Texture2_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat2.xyz;
					    vs_TEXCOORD2.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat2.xyz;
					    u_xlat10 = u_xlat1.y * u_xlat1.y;
					    u_xlat10 = u_xlat1.x * u_xlat1.x + (-u_xlat10);
					    u_xlat2 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat1.x = dot(unity_SHBr, u_xlat2);
					    u_xlat1.y = dot(unity_SHBg, u_xlat2);
					    u_xlat1.z = dot(unity_SHBb, u_xlat2);
					    vs_TEXCOORD3.xyz = unity_SHC.xyz * vec3(u_xlat10) + u_xlat1.xyz;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD4.zw = u_xlat0.zw;
					    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
						vec4 unused_0_0[6];
						vec4 _Texture1_ST;
						vec4 _Texture2_ST;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_1_0[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_1_6[34];
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
						vec4 unused_2_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat15;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture1_ST.xy + _Texture1_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Texture2_ST.xy + _Texture2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz;
					    u_xlat2 = (-u_xlat1.xxxx) + unity_4LightPosX0;
					    u_xlat3 = (-u_xlat1.yyyy) + unity_4LightPosY0;
					    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
					    u_xlat4 = u_xlat0.yyyy * u_xlat3;
					    u_xlat3 = u_xlat3 * u_xlat3;
					    u_xlat3 = u_xlat2 * u_xlat2 + u_xlat3;
					    u_xlat2 = u_xlat2 * u_xlat0.xxxx + u_xlat4;
					    u_xlat2 = u_xlat1 * u_xlat0.zzzz + u_xlat2;
					    u_xlat1 = u_xlat1 * u_xlat1 + u_xlat3;
					    u_xlat1 = max(u_xlat1, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat3 = inversesqrt(u_xlat1);
					    u_xlat1 = u_xlat1 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
					    u_xlat2 = u_xlat2 * u_xlat3;
					    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat1 = u_xlat1 * u_xlat2;
					    u_xlat2.xyz = u_xlat1.yyy * unity_LightColor[1].xyz;
					    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat1.xyz = unity_LightColor[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
					    u_xlat1.xyz = unity_LightColor[3].xyz * u_xlat1.www + u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat2.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    u_xlat15 = u_xlat0.y * u_xlat0.y;
					    u_xlat15 = u_xlat0.x * u_xlat0.x + (-u_xlat15);
					    u_xlat3 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat0.x = dot(unity_SHBr, u_xlat3);
					    u_xlat0.y = dot(unity_SHBg, u_xlat3);
					    u_xlat0.z = dot(unity_SHBb, u_xlat3);
					    u_xlat0.xyz = unity_SHC.xyz * vec3(u_xlat15) + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
						vec4 unused_0_0[6];
						vec4 _Texture1_ST;
						vec4 _Texture2_ST;
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
						vec4 unused_2_6[34];
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
						vec4 unused_3_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					float u_xlat19;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture1_ST.xy + _Texture1_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Texture2_ST.xy + _Texture2_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat2.xyz;
					    vs_TEXCOORD2.xyz = u_xlat2.xyz;
					    u_xlat3 = (-u_xlat2.xxxx) + unity_4LightPosX0;
					    u_xlat4 = (-u_xlat2.yyyy) + unity_4LightPosY0;
					    u_xlat2 = (-u_xlat2.zzzz) + unity_4LightPosZ0;
					    u_xlat5 = u_xlat1.yyyy * u_xlat4;
					    u_xlat4 = u_xlat4 * u_xlat4;
					    u_xlat4 = u_xlat3 * u_xlat3 + u_xlat4;
					    u_xlat3 = u_xlat3 * u_xlat1.xxxx + u_xlat5;
					    u_xlat3 = u_xlat2 * u_xlat1.zzzz + u_xlat3;
					    u_xlat2 = u_xlat2 * u_xlat2 + u_xlat4;
					    u_xlat2 = max(u_xlat2, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat4 = inversesqrt(u_xlat2);
					    u_xlat2 = u_xlat2 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat2 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat2;
					    u_xlat3 = u_xlat3 * u_xlat4;
					    u_xlat3 = max(u_xlat3, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat2 = u_xlat2 * u_xlat3;
					    u_xlat3.xyz = u_xlat2.yyy * unity_LightColor[1].xyz;
					    u_xlat3.xyz = unity_LightColor[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
					    u_xlat2.xyz = unity_LightColor[2].xyz * u_xlat2.zzz + u_xlat3.xyz;
					    u_xlat2.xyz = unity_LightColor[3].xyz * u_xlat2.www + u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat3.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    u_xlat19 = u_xlat1.y * u_xlat1.y;
					    u_xlat19 = u_xlat1.x * u_xlat1.x + (-u_xlat19);
					    u_xlat4 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat1.x = dot(unity_SHBr, u_xlat4);
					    u_xlat1.y = dot(unity_SHBg, u_xlat4);
					    u_xlat1.z = dot(unity_SHBb, u_xlat4);
					    u_xlat1.xyz = unity_SHC.xyz * vec3(u_xlat19) + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz * u_xlat3.xyz + u_xlat1.xyz;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD4.zw = u_xlat0.zw;
					    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
						vec4 unused_0_0[6];
						vec4 _Texture1_ST;
						vec4 _Texture2_ST;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_1_0[41];
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
						vec4 unused_2_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out float vs_TEXCOORD5;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD5 = u_xlat0.z;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture1_ST.xy + _Texture1_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Texture2_ST.xy + _Texture2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat6 = u_xlat0.y * u_xlat0.y;
					    u_xlat6 = u_xlat0.x * u_xlat0.x + (-u_xlat6);
					    u_xlat1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat0.x = dot(unity_SHBr, u_xlat1);
					    u_xlat0.y = dot(unity_SHBg, u_xlat1);
					    u_xlat0.z = dot(unity_SHBb, u_xlat1);
					    vs_TEXCOORD3.xyz = unity_SHC.xyz * vec3(u_xlat6) + u_xlat0.xyz;
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
						vec4 unused_0_0[6];
						vec4 _Texture1_ST;
						vec4 _Texture2_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_2_0[41];
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
						vec4 unused_3_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out float vs_TEXCOORD5;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture1_ST.xy + _Texture1_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Texture2_ST.xy + _Texture2_ST.zw;
					    vs_TEXCOORD5 = u_xlat0.z;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat2.xyz;
					    vs_TEXCOORD2.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat2.xyz;
					    u_xlat10 = u_xlat1.y * u_xlat1.y;
					    u_xlat10 = u_xlat1.x * u_xlat1.x + (-u_xlat10);
					    u_xlat2 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat1.x = dot(unity_SHBr, u_xlat2);
					    u_xlat1.y = dot(unity_SHBg, u_xlat2);
					    u_xlat1.z = dot(unity_SHBb, u_xlat2);
					    vs_TEXCOORD3.xyz = unity_SHC.xyz * vec3(u_xlat10) + u_xlat1.xyz;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD4.zw = u_xlat0.zw;
					    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
						vec4 unused_0_0[6];
						vec4 _Texture1_ST;
						vec4 _Texture2_ST;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_1_0[2];
						vec4 unity_4LightPosX0;
						vec4 unity_4LightPosY0;
						vec4 unity_4LightPosZ0;
						vec4 unity_4LightAtten0;
						vec4 unity_LightColor[8];
						vec4 unused_1_6[34];
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
						vec4 unused_2_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out float vs_TEXCOORD5;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat15;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD5 = u_xlat0.z;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture1_ST.xy + _Texture1_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Texture2_ST.xy + _Texture2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = u_xlat1.xyz;
					    u_xlat2 = (-u_xlat1.xxxx) + unity_4LightPosX0;
					    u_xlat3 = (-u_xlat1.yyyy) + unity_4LightPosY0;
					    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
					    u_xlat4 = u_xlat0.yyyy * u_xlat3;
					    u_xlat3 = u_xlat3 * u_xlat3;
					    u_xlat3 = u_xlat2 * u_xlat2 + u_xlat3;
					    u_xlat2 = u_xlat2 * u_xlat0.xxxx + u_xlat4;
					    u_xlat2 = u_xlat1 * u_xlat0.zzzz + u_xlat2;
					    u_xlat1 = u_xlat1 * u_xlat1 + u_xlat3;
					    u_xlat1 = max(u_xlat1, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat3 = inversesqrt(u_xlat1);
					    u_xlat1 = u_xlat1 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
					    u_xlat2 = u_xlat2 * u_xlat3;
					    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat1 = u_xlat1 * u_xlat2;
					    u_xlat2.xyz = u_xlat1.yyy * unity_LightColor[1].xyz;
					    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat1.xyz = unity_LightColor[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
					    u_xlat1.xyz = unity_LightColor[3].xyz * u_xlat1.www + u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat2.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    u_xlat15 = u_xlat0.y * u_xlat0.y;
					    u_xlat15 = u_xlat0.x * u_xlat0.x + (-u_xlat15);
					    u_xlat3 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat0.x = dot(unity_SHBr, u_xlat3);
					    u_xlat0.y = dot(unity_SHBg, u_xlat3);
					    u_xlat0.z = dot(unity_SHBb, u_xlat3);
					    u_xlat0.xyz = unity_SHC.xyz * vec3(u_xlat15) + u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
						vec4 unused_0_0[6];
						vec4 _Texture1_ST;
						vec4 _Texture2_ST;
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
						vec4 unused_2_6[34];
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
						vec4 unused_3_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out float vs_TEXCOORD5;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					float u_xlat19;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture1_ST.xy + _Texture1_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Texture2_ST.xy + _Texture2_ST.zw;
					    vs_TEXCOORD5 = u_xlat0.z;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz;
					    u_xlat2.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat2.xyz;
					    vs_TEXCOORD2.xyz = u_xlat2.xyz;
					    u_xlat3 = (-u_xlat2.xxxx) + unity_4LightPosX0;
					    u_xlat4 = (-u_xlat2.yyyy) + unity_4LightPosY0;
					    u_xlat2 = (-u_xlat2.zzzz) + unity_4LightPosZ0;
					    u_xlat5 = u_xlat1.yyyy * u_xlat4;
					    u_xlat4 = u_xlat4 * u_xlat4;
					    u_xlat4 = u_xlat3 * u_xlat3 + u_xlat4;
					    u_xlat3 = u_xlat3 * u_xlat1.xxxx + u_xlat5;
					    u_xlat3 = u_xlat2 * u_xlat1.zzzz + u_xlat3;
					    u_xlat2 = u_xlat2 * u_xlat2 + u_xlat4;
					    u_xlat2 = max(u_xlat2, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat4 = inversesqrt(u_xlat2);
					    u_xlat2 = u_xlat2 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat2 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat2;
					    u_xlat3 = u_xlat3 * u_xlat4;
					    u_xlat3 = max(u_xlat3, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat2 = u_xlat2 * u_xlat3;
					    u_xlat3.xyz = u_xlat2.yyy * unity_LightColor[1].xyz;
					    u_xlat3.xyz = unity_LightColor[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
					    u_xlat2.xyz = unity_LightColor[2].xyz * u_xlat2.zzz + u_xlat3.xyz;
					    u_xlat2.xyz = unity_LightColor[3].xyz * u_xlat2.www + u_xlat2.xyz;
					    u_xlat3.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat3.xyz = u_xlat2.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    u_xlat19 = u_xlat1.y * u_xlat1.y;
					    u_xlat19 = u_xlat1.x * u_xlat1.x + (-u_xlat19);
					    u_xlat4 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat1.x = dot(unity_SHBr, u_xlat4);
					    u_xlat1.y = dot(unity_SHBg, u_xlat4);
					    u_xlat1.z = dot(unity_SHBb, u_xlat4);
					    u_xlat1.xyz = unity_SHC.xyz * vec3(u_xlat19) + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = u_xlat2.xyz * u_xlat3.xyz + u_xlat1.xyz;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD4.zw = u_xlat0.zw;
					    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
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
						float Prop;
						vec4 unused_0_5[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[37];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unused_2_5[4];
					};
					layout(std140) uniform UnityReflectionProbes {
						vec4 unity_SpecCube0_BoxMax;
						vec4 unity_SpecCube0_BoxMin;
						vec4 unity_SpecCube0_ProbePosition;
						vec4 unity_SpecCube0_HDR;
						vec4 unity_SpecCube1_BoxMax;
						vec4 unity_SpecCube1_BoxMin;
						vec4 unity_SpecCube1_ProbePosition;
						vec4 unity_SpecCube1_HDR;
					};
					layout(std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					uniform  sampler2D _Texture1;
					uniform  sampler2D _Texture2;
					uniform  samplerCube unity_SpecCube0;
					uniform  samplerCube unity_SpecCube1;
					uniform  sampler3D unity_ProbeVolumeSH;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					bvec3 u_xlatb8;
					vec3 u_xlat9;
					bvec3 u_xlatb10;
					vec3 u_xlat11;
					float u_xlat12;
					float u_xlat22;
					float u_xlat23;
					float u_xlat33;
					float u_xlat34;
					bool u_xlatb34;
					float u_xlat35;
					bool u_xlatb35;
					float u_xlat36;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat33 = inversesqrt(u_xlat33);
					    u_xlat1.xyz = vec3(u_xlat33) * u_xlat0.xyz;
					    u_xlat2 = texture(_Texture1, vs_TEXCOORD0.xy);
					    u_xlat2.xyz = u_xlat2.xyz * _Color.xyz;
					    u_xlat3 = texture(_Texture2, vs_TEXCOORD0.zw);
					    u_xlat3.xyz = u_xlat3.xyz * _Color.xyz;
					    u_xlat34 = (-Prop) + 1.0;
					    u_xlat3.xyz = u_xlat3.xyz * vec3(Prop);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat34) + u_xlat3.xyz;
					    u_xlat34 = dot((-u_xlat1.xyz), vs_TEXCOORD1.xyz);
					    u_xlat34 = u_xlat34 + u_xlat34;
					    u_xlat3.xyz = vs_TEXCOORD1.xyz * (-vec3(u_xlat34)) + (-u_xlat1.xyz);
					    u_xlatb34 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb34){
					        u_xlatb34 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat4.xyz = vs_TEXCOORD2.yyy * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat4.xyz;
					        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat4.xyz;
					        u_xlat4.xyz = u_xlat4.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat4.xyz = (bool(u_xlatb34)) ? u_xlat4.xyz : vs_TEXCOORD2.xyz;
					        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat34 = u_xlat4.y * 0.25;
					        u_xlat35 = unity_ProbeVolumeParams.z * 0.5;
					        u_xlat36 = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
					        u_xlat34 = max(u_xlat34, u_xlat35);
					        u_xlat4.x = min(u_xlat36, u_xlat34);
					        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
					        u_xlat6.xyz = u_xlat4.xzw + vec3(0.25, 0.0, 0.0);
					        u_xlat6 = texture(unity_ProbeVolumeSH, u_xlat6.xyz);
					        u_xlat4.xyz = u_xlat4.xzw + vec3(0.5, 0.0, 0.0);
					        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xyz);
					        u_xlat7.xyz = vs_TEXCOORD1.xyz;
					        u_xlat7.w = 1.0;
					        u_xlat5.x = dot(u_xlat5, u_xlat7);
					        u_xlat5.y = dot(u_xlat6, u_xlat7);
					        u_xlat5.z = dot(u_xlat4, u_xlat7);
					    } else {
					        u_xlat4.xyz = vs_TEXCOORD1.xyz;
					        u_xlat4.w = 1.0;
					        u_xlat5.x = dot(unity_SHAr, u_xlat4);
					        u_xlat5.y = dot(unity_SHAg, u_xlat4);
					        u_xlat5.z = dot(unity_SHAb, u_xlat4);
					    }
					    u_xlat4.xyz = u_xlat5.xyz + vs_TEXCOORD3.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlatb34 = 0.0<unity_SpecCube0_ProbePosition.w;
					    if(u_xlatb34){
					        u_xlat34 = dot(u_xlat3.xyz, u_xlat3.xyz);
					        u_xlat34 = inversesqrt(u_xlat34);
					        u_xlat5.xyz = vec3(u_xlat34) * u_xlat3.xyz;
					        u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMax.xyz;
					        u_xlat6.xyz = u_xlat6.xyz / u_xlat5.xyz;
					        u_xlat7.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMin.xyz;
					        u_xlat7.xyz = u_xlat7.xyz / u_xlat5.xyz;
					        u_xlatb8.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5.xyzx).xyz;
					        {
					            vec4 hlslcc_movcTemp = u_xlat6;
					            hlslcc_movcTemp.x = (u_xlatb8.x) ? u_xlat6.x : u_xlat7.x;
					            hlslcc_movcTemp.y = (u_xlatb8.y) ? u_xlat6.y : u_xlat7.y;
					            hlslcc_movcTemp.z = (u_xlatb8.z) ? u_xlat6.z : u_xlat7.z;
					            u_xlat6 = hlslcc_movcTemp;
					        }
					        u_xlat34 = min(u_xlat6.y, u_xlat6.x);
					        u_xlat34 = min(u_xlat6.z, u_xlat34);
					        u_xlat6.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube0_ProbePosition.xyz);
					        u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat34) + u_xlat6.xyz;
					    } else {
					        u_xlat5.xyz = u_xlat3.xyz;
					    }
					    u_xlat5 = textureLod(unity_SpecCube0, u_xlat5.xyz, 6.0);
					    u_xlatb34 = unity_SpecCube0_HDR.w==1.0;
					    u_xlat34 = (u_xlatb34) ? u_xlat5.w : 1.0;
					    u_xlat34 = u_xlat34 * unity_SpecCube0_HDR.x;
					    u_xlat6.xyz = u_xlat5.xyz * vec3(u_xlat34);
					    u_xlatb35 = unity_SpecCube0_BoxMin.w<0.999989986;
					    if(u_xlatb35){
					        u_xlatb35 = 0.0<unity_SpecCube1_ProbePosition.w;
					        if(u_xlatb35){
					            u_xlat35 = dot(u_xlat3.xyz, u_xlat3.xyz);
					            u_xlat35 = inversesqrt(u_xlat35);
					            u_xlat7.xyz = vec3(u_xlat35) * u_xlat3.xyz;
					            u_xlat8.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMax.xyz;
					            u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
					            u_xlat9.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMin.xyz;
					            u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
					            u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
					            {
					                vec3 hlslcc_movcTemp = u_xlat8;
					                hlslcc_movcTemp.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
					                hlslcc_movcTemp.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
					                hlslcc_movcTemp.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
					                u_xlat8 = hlslcc_movcTemp;
					            }
					            u_xlat35 = min(u_xlat8.y, u_xlat8.x);
					            u_xlat35 = min(u_xlat8.z, u_xlat35);
					            u_xlat8.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube1_ProbePosition.xyz);
					            u_xlat3.xyz = u_xlat7.xyz * vec3(u_xlat35) + u_xlat8.xyz;
					        }
					        u_xlat3 = textureLod(unity_SpecCube1, u_xlat3.xyz, 6.0);
					        u_xlatb35 = unity_SpecCube1_HDR.w==1.0;
					        u_xlat35 = (u_xlatb35) ? u_xlat3.w : 1.0;
					        u_xlat35 = u_xlat35 * unity_SpecCube1_HDR.x;
					        u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat35);
					        u_xlat5.xyz = vec3(u_xlat34) * u_xlat5.xyz + (-u_xlat3.xyz);
					        u_xlat6.xyz = unity_SpecCube0_BoxMin.www * u_xlat5.xyz + u_xlat3.xyz;
					    }
					    u_xlat34 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
					    u_xlat34 = inversesqrt(u_xlat34);
					    u_xlat3.xyz = vec3(u_xlat34) * vs_TEXCOORD1.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.779083729, 0.779083729, 0.779083729);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat33) + _WorldSpaceLightPos0.xyz;
					    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat33 = max(u_xlat33, 0.00100000005);
					    u_xlat33 = inversesqrt(u_xlat33);
					    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz;
					    u_xlat33 = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat11.x = dot(u_xlat0.xx, u_xlat0.xx);
					    u_xlat11.x = u_xlat11.x + -0.5;
					    u_xlat22 = (-u_xlat1.x) + 1.0;
					    u_xlat12 = u_xlat22 * u_xlat22;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat22 = u_xlat22 * u_xlat12;
					    u_xlat22 = u_xlat11.x * u_xlat22 + 1.0;
					    u_xlat12 = -abs(u_xlat33) + 1.0;
					    u_xlat23 = u_xlat12 * u_xlat12;
					    u_xlat23 = u_xlat23 * u_xlat23;
					    u_xlat12 = u_xlat12 * u_xlat23;
					    u_xlat11.x = u_xlat11.x * u_xlat12 + 1.0;
					    u_xlat11.x = u_xlat11.x * u_xlat22;
					    u_xlat22 = abs(u_xlat33) + u_xlat1.x;
					    u_xlat22 = u_xlat22 + 9.99999975e-06;
					    u_xlat22 = 0.5 / u_xlat22;
					    u_xlat22 = u_xlat22 * 0.999999881;
					    u_xlat22 = max(u_xlat22, 9.99999975e-05);
					    u_xlat11.y = sqrt(u_xlat22);
					    u_xlat11.xy = u_xlat1.xx * u_xlat11.xy;
					    u_xlat1.xzw = _LightColor0.xyz * u_xlat11.xxx + u_xlat4.xyz;
					    u_xlat11.xyz = u_xlat11.yyy * _LightColor0.xyz;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat35 = u_xlat0.x * u_xlat0.x;
					    u_xlat35 = u_xlat35 * u_xlat35;
					    u_xlat0.x = u_xlat0.x * u_xlat35;
					    u_xlat0.x = u_xlat0.x * 0.779083729 + 0.220916301;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat11.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat1.xzw + u_xlat0.xyz;
					    u_xlat1.xzw = u_xlat6.xyz * vec3(0.720000029, 0.720000029, 0.720000029);
					    u_xlat33 = u_xlat12 * -2.98023224e-08 + 0.220916301;
					    SV_Target0.xyz = u_xlat1.xzw * vec3(u_xlat33) + u_xlat0.xyz;
					    SV_Target0.w = 1.0;
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
						float Prop;
						vec4 unused_0_5[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[37];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unused_2_5[4];
					};
					layout(std140) uniform UnityReflectionProbes {
						vec4 unity_SpecCube0_BoxMax;
						vec4 unity_SpecCube0_BoxMin;
						vec4 unity_SpecCube0_ProbePosition;
						vec4 unity_SpecCube0_HDR;
						vec4 unity_SpecCube1_BoxMax;
						vec4 unity_SpecCube1_BoxMin;
						vec4 unity_SpecCube1_ProbePosition;
						vec4 unity_SpecCube1_HDR;
					};
					layout(std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					uniform  sampler2D _Texture1;
					uniform  sampler2D _Texture2;
					uniform  sampler2D _ShadowMapTexture;
					uniform  samplerCube unity_SpecCube0;
					uniform  samplerCube unity_SpecCube1;
					uniform  sampler3D unity_ProbeVolumeSH;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec4 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					bvec3 u_xlatb9;
					vec3 u_xlat10;
					bvec3 u_xlatb11;
					vec3 u_xlat12;
					float u_xlat13;
					vec3 u_xlat15;
					float u_xlat24;
					float u_xlat25;
					float u_xlat36;
					float u_xlat37;
					bool u_xlatb37;
					float u_xlat38;
					bool u_xlatb38;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat36 = inversesqrt(u_xlat36);
					    u_xlat1.xyz = vec3(u_xlat36) * u_xlat0.xyz;
					    u_xlat2 = texture(_Texture1, vs_TEXCOORD0.xy);
					    u_xlat2.xyz = u_xlat2.xyz * _Color.xyz;
					    u_xlat3 = texture(_Texture2, vs_TEXCOORD0.zw);
					    u_xlat3.xyz = u_xlat3.xyz * _Color.xyz;
					    u_xlat37 = (-Prop) + 1.0;
					    u_xlat3.xyz = u_xlat3.xyz * vec3(Prop);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat37) + u_xlat3.xyz;
					    u_xlat3.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
					    u_xlat3 = texture(_ShadowMapTexture, u_xlat3.xy);
					    u_xlat37 = dot((-u_xlat1.xyz), vs_TEXCOORD1.xyz);
					    u_xlat37 = u_xlat37 + u_xlat37;
					    u_xlat15.xyz = vs_TEXCOORD1.xyz * (-vec3(u_xlat37)) + (-u_xlat1.xyz);
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz;
					    u_xlatb37 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb37){
					        u_xlatb37 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat5.xyz = vs_TEXCOORD2.yyy * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat5.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat5.xyz;
					        u_xlat5.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat5.xyz;
					        u_xlat5.xyz = u_xlat5.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat5.xyz = (bool(u_xlatb37)) ? u_xlat5.xyz : vs_TEXCOORD2.xyz;
					        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat37 = u_xlat5.y * 0.25;
					        u_xlat38 = unity_ProbeVolumeParams.z * 0.5;
					        u_xlat3.x = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
					        u_xlat37 = max(u_xlat37, u_xlat38);
					        u_xlat5.x = min(u_xlat3.x, u_xlat37);
					        u_xlat6 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
					        u_xlat7.xyz = u_xlat5.xzw + vec3(0.25, 0.0, 0.0);
					        u_xlat7 = texture(unity_ProbeVolumeSH, u_xlat7.xyz);
					        u_xlat5.xyz = u_xlat5.xzw + vec3(0.5, 0.0, 0.0);
					        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xyz);
					        u_xlat8.xyz = vs_TEXCOORD1.xyz;
					        u_xlat8.w = 1.0;
					        u_xlat6.x = dot(u_xlat6, u_xlat8);
					        u_xlat6.y = dot(u_xlat7, u_xlat8);
					        u_xlat6.z = dot(u_xlat5, u_xlat8);
					    } else {
					        u_xlat5.xyz = vs_TEXCOORD1.xyz;
					        u_xlat5.w = 1.0;
					        u_xlat6.x = dot(unity_SHAr, u_xlat5);
					        u_xlat6.y = dot(unity_SHAg, u_xlat5);
					        u_xlat6.z = dot(unity_SHAb, u_xlat5);
					    }
					    u_xlat5.xyz = u_xlat6.xyz + vs_TEXCOORD3.xyz;
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlatb37 = 0.0<unity_SpecCube0_ProbePosition.w;
					    if(u_xlatb37){
					        u_xlat37 = dot(u_xlat15.xyz, u_xlat15.xyz);
					        u_xlat37 = inversesqrt(u_xlat37);
					        u_xlat6.xyz = vec3(u_xlat37) * u_xlat15.xyz;
					        u_xlat7.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMax.xyz;
					        u_xlat7.xyz = u_xlat7.xyz / u_xlat6.xyz;
					        u_xlat8.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMin.xyz;
					        u_xlat8.xyz = u_xlat8.xyz / u_xlat6.xyz;
					        u_xlatb9.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat6.xyzx).xyz;
					        {
					            vec4 hlslcc_movcTemp = u_xlat7;
					            hlslcc_movcTemp.x = (u_xlatb9.x) ? u_xlat7.x : u_xlat8.x;
					            hlslcc_movcTemp.y = (u_xlatb9.y) ? u_xlat7.y : u_xlat8.y;
					            hlslcc_movcTemp.z = (u_xlatb9.z) ? u_xlat7.z : u_xlat8.z;
					            u_xlat7 = hlslcc_movcTemp;
					        }
					        u_xlat37 = min(u_xlat7.y, u_xlat7.x);
					        u_xlat37 = min(u_xlat7.z, u_xlat37);
					        u_xlat7.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube0_ProbePosition.xyz);
					        u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat37) + u_xlat7.xyz;
					    } else {
					        u_xlat6.xyz = u_xlat15.xyz;
					    }
					    u_xlat6 = textureLod(unity_SpecCube0, u_xlat6.xyz, 6.0);
					    u_xlatb37 = unity_SpecCube0_HDR.w==1.0;
					    u_xlat37 = (u_xlatb37) ? u_xlat6.w : 1.0;
					    u_xlat37 = u_xlat37 * unity_SpecCube0_HDR.x;
					    u_xlat7.xyz = u_xlat6.xyz * vec3(u_xlat37);
					    u_xlatb38 = unity_SpecCube0_BoxMin.w<0.999989986;
					    if(u_xlatb38){
					        u_xlatb38 = 0.0<unity_SpecCube1_ProbePosition.w;
					        if(u_xlatb38){
					            u_xlat38 = dot(u_xlat15.xyz, u_xlat15.xyz);
					            u_xlat38 = inversesqrt(u_xlat38);
					            u_xlat8.xyz = vec3(u_xlat38) * u_xlat15.xyz;
					            u_xlat9.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMax.xyz;
					            u_xlat9.xyz = u_xlat9.xyz / u_xlat8.xyz;
					            u_xlat10.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMin.xyz;
					            u_xlat10.xyz = u_xlat10.xyz / u_xlat8.xyz;
					            u_xlatb11.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat8.xyzx).xyz;
					            {
					                vec3 hlslcc_movcTemp = u_xlat9;
					                hlslcc_movcTemp.x = (u_xlatb11.x) ? u_xlat9.x : u_xlat10.x;
					                hlslcc_movcTemp.y = (u_xlatb11.y) ? u_xlat9.y : u_xlat10.y;
					                hlslcc_movcTemp.z = (u_xlatb11.z) ? u_xlat9.z : u_xlat10.z;
					                u_xlat9 = hlslcc_movcTemp;
					            }
					            u_xlat38 = min(u_xlat9.y, u_xlat9.x);
					            u_xlat38 = min(u_xlat9.z, u_xlat38);
					            u_xlat9.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube1_ProbePosition.xyz);
					            u_xlat15.xyz = u_xlat8.xyz * vec3(u_xlat38) + u_xlat9.xyz;
					        }
					        u_xlat3 = textureLod(unity_SpecCube1, u_xlat15.xyz, 6.0);
					        u_xlatb38 = unity_SpecCube1_HDR.w==1.0;
					        u_xlat38 = (u_xlatb38) ? u_xlat3.w : 1.0;
					        u_xlat38 = u_xlat38 * unity_SpecCube1_HDR.x;
					        u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat38);
					        u_xlat6.xyz = vec3(u_xlat37) * u_xlat6.xyz + (-u_xlat3.xyz);
					        u_xlat7.xyz = unity_SpecCube0_BoxMin.www * u_xlat6.xyz + u_xlat3.xyz;
					    }
					    u_xlat37 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
					    u_xlat37 = inversesqrt(u_xlat37);
					    u_xlat3.xyz = vec3(u_xlat37) * vs_TEXCOORD1.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.779083729, 0.779083729, 0.779083729);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat36) + _WorldSpaceLightPos0.xyz;
					    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat36 = max(u_xlat36, 0.00100000005);
					    u_xlat36 = inversesqrt(u_xlat36);
					    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
					    u_xlat36 = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat12.x = dot(u_xlat0.xx, u_xlat0.xx);
					    u_xlat12.x = u_xlat12.x + -0.5;
					    u_xlat24 = (-u_xlat1.x) + 1.0;
					    u_xlat13 = u_xlat24 * u_xlat24;
					    u_xlat13 = u_xlat13 * u_xlat13;
					    u_xlat24 = u_xlat24 * u_xlat13;
					    u_xlat24 = u_xlat12.x * u_xlat24 + 1.0;
					    u_xlat13 = -abs(u_xlat36) + 1.0;
					    u_xlat25 = u_xlat13 * u_xlat13;
					    u_xlat25 = u_xlat25 * u_xlat25;
					    u_xlat13 = u_xlat13 * u_xlat25;
					    u_xlat12.x = u_xlat12.x * u_xlat13 + 1.0;
					    u_xlat12.x = u_xlat12.x * u_xlat24;
					    u_xlat24 = abs(u_xlat36) + u_xlat1.x;
					    u_xlat24 = u_xlat24 + 9.99999975e-06;
					    u_xlat24 = 0.5 / u_xlat24;
					    u_xlat24 = u_xlat24 * 0.999999881;
					    u_xlat24 = max(u_xlat24, 9.99999975e-05);
					    u_xlat12.y = sqrt(u_xlat24);
					    u_xlat12.xy = u_xlat1.xx * u_xlat12.xy;
					    u_xlat1.xzw = u_xlat4.xyz * u_xlat12.xxx + u_xlat5.xyz;
					    u_xlat12.xyz = u_xlat4.xyz * u_xlat12.yyy;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat38 = u_xlat0.x * u_xlat0.x;
					    u_xlat38 = u_xlat38 * u_xlat38;
					    u_xlat0.x = u_xlat0.x * u_xlat38;
					    u_xlat0.x = u_xlat0.x * 0.779083729 + 0.220916301;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat12.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat1.xzw + u_xlat0.xyz;
					    u_xlat1.xzw = u_xlat7.xyz * vec3(0.720000029, 0.720000029, 0.720000029);
					    u_xlat36 = u_xlat13 * -2.98023224e-08 + 0.220916301;
					    SV_Target0.xyz = u_xlat1.xzw * vec3(u_xlat36) + u_xlat0.xyz;
					    SV_Target0.w = 1.0;
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
						float Prop;
						vec4 unused_0_5[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 unused_1_3[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[37];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unused_2_5[4];
					};
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unity_FogParams;
					};
					layout(std140) uniform UnityReflectionProbes {
						vec4 unity_SpecCube0_BoxMax;
						vec4 unity_SpecCube0_BoxMin;
						vec4 unity_SpecCube0_ProbePosition;
						vec4 unity_SpecCube0_HDR;
						vec4 unity_SpecCube1_BoxMax;
						vec4 unity_SpecCube1_BoxMin;
						vec4 unity_SpecCube1_ProbePosition;
						vec4 unity_SpecCube1_HDR;
					};
					layout(std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					uniform  sampler2D _Texture1;
					uniform  sampler2D _Texture2;
					uniform  samplerCube unity_SpecCube0;
					uniform  samplerCube unity_SpecCube1;
					uniform  sampler3D unity_ProbeVolumeSH;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  float vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec3 u_xlat8;
					bvec3 u_xlatb8;
					vec3 u_xlat9;
					bvec3 u_xlatb10;
					vec3 u_xlat11;
					float u_xlat12;
					float u_xlat22;
					float u_xlat23;
					float u_xlat33;
					float u_xlat34;
					bool u_xlatb34;
					float u_xlat35;
					bool u_xlatb35;
					float u_xlat36;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat33 = inversesqrt(u_xlat33);
					    u_xlat1.xyz = vec3(u_xlat33) * u_xlat0.xyz;
					    u_xlat2 = texture(_Texture1, vs_TEXCOORD0.xy);
					    u_xlat2.xyz = u_xlat2.xyz * _Color.xyz;
					    u_xlat3 = texture(_Texture2, vs_TEXCOORD0.zw);
					    u_xlat3.xyz = u_xlat3.xyz * _Color.xyz;
					    u_xlat34 = (-Prop) + 1.0;
					    u_xlat3.xyz = u_xlat3.xyz * vec3(Prop);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat34) + u_xlat3.xyz;
					    u_xlat34 = dot((-u_xlat1.xyz), vs_TEXCOORD1.xyz);
					    u_xlat34 = u_xlat34 + u_xlat34;
					    u_xlat3.xyz = vs_TEXCOORD1.xyz * (-vec3(u_xlat34)) + (-u_xlat1.xyz);
					    u_xlatb34 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb34){
					        u_xlatb34 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat4.xyz = vs_TEXCOORD2.yyy * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat4.xyz;
					        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat4.xyz;
					        u_xlat4.xyz = u_xlat4.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat4.xyz = (bool(u_xlatb34)) ? u_xlat4.xyz : vs_TEXCOORD2.xyz;
					        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat34 = u_xlat4.y * 0.25;
					        u_xlat35 = unity_ProbeVolumeParams.z * 0.5;
					        u_xlat36 = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
					        u_xlat34 = max(u_xlat34, u_xlat35);
					        u_xlat4.x = min(u_xlat36, u_xlat34);
					        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
					        u_xlat6.xyz = u_xlat4.xzw + vec3(0.25, 0.0, 0.0);
					        u_xlat6 = texture(unity_ProbeVolumeSH, u_xlat6.xyz);
					        u_xlat4.xyz = u_xlat4.xzw + vec3(0.5, 0.0, 0.0);
					        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xyz);
					        u_xlat7.xyz = vs_TEXCOORD1.xyz;
					        u_xlat7.w = 1.0;
					        u_xlat5.x = dot(u_xlat5, u_xlat7);
					        u_xlat5.y = dot(u_xlat6, u_xlat7);
					        u_xlat5.z = dot(u_xlat4, u_xlat7);
					    } else {
					        u_xlat4.xyz = vs_TEXCOORD1.xyz;
					        u_xlat4.w = 1.0;
					        u_xlat5.x = dot(unity_SHAr, u_xlat4);
					        u_xlat5.y = dot(unity_SHAg, u_xlat4);
					        u_xlat5.z = dot(unity_SHAb, u_xlat4);
					    }
					    u_xlat4.xyz = u_xlat5.xyz + vs_TEXCOORD3.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlatb34 = 0.0<unity_SpecCube0_ProbePosition.w;
					    if(u_xlatb34){
					        u_xlat34 = dot(u_xlat3.xyz, u_xlat3.xyz);
					        u_xlat34 = inversesqrt(u_xlat34);
					        u_xlat5.xyz = vec3(u_xlat34) * u_xlat3.xyz;
					        u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMax.xyz;
					        u_xlat6.xyz = u_xlat6.xyz / u_xlat5.xyz;
					        u_xlat7.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMin.xyz;
					        u_xlat7.xyz = u_xlat7.xyz / u_xlat5.xyz;
					        u_xlatb8.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5.xyzx).xyz;
					        {
					            vec4 hlslcc_movcTemp = u_xlat6;
					            hlslcc_movcTemp.x = (u_xlatb8.x) ? u_xlat6.x : u_xlat7.x;
					            hlslcc_movcTemp.y = (u_xlatb8.y) ? u_xlat6.y : u_xlat7.y;
					            hlslcc_movcTemp.z = (u_xlatb8.z) ? u_xlat6.z : u_xlat7.z;
					            u_xlat6 = hlslcc_movcTemp;
					        }
					        u_xlat34 = min(u_xlat6.y, u_xlat6.x);
					        u_xlat34 = min(u_xlat6.z, u_xlat34);
					        u_xlat6.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube0_ProbePosition.xyz);
					        u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat34) + u_xlat6.xyz;
					    } else {
					        u_xlat5.xyz = u_xlat3.xyz;
					    }
					    u_xlat5 = textureLod(unity_SpecCube0, u_xlat5.xyz, 6.0);
					    u_xlatb34 = unity_SpecCube0_HDR.w==1.0;
					    u_xlat34 = (u_xlatb34) ? u_xlat5.w : 1.0;
					    u_xlat34 = u_xlat34 * unity_SpecCube0_HDR.x;
					    u_xlat6.xyz = u_xlat5.xyz * vec3(u_xlat34);
					    u_xlatb35 = unity_SpecCube0_BoxMin.w<0.999989986;
					    if(u_xlatb35){
					        u_xlatb35 = 0.0<unity_SpecCube1_ProbePosition.w;
					        if(u_xlatb35){
					            u_xlat35 = dot(u_xlat3.xyz, u_xlat3.xyz);
					            u_xlat35 = inversesqrt(u_xlat35);
					            u_xlat7.xyz = vec3(u_xlat35) * u_xlat3.xyz;
					            u_xlat8.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMax.xyz;
					            u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
					            u_xlat9.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMin.xyz;
					            u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
					            u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
					            {
					                vec3 hlslcc_movcTemp = u_xlat8;
					                hlslcc_movcTemp.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
					                hlslcc_movcTemp.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
					                hlslcc_movcTemp.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
					                u_xlat8 = hlslcc_movcTemp;
					            }
					            u_xlat35 = min(u_xlat8.y, u_xlat8.x);
					            u_xlat35 = min(u_xlat8.z, u_xlat35);
					            u_xlat8.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube1_ProbePosition.xyz);
					            u_xlat3.xyz = u_xlat7.xyz * vec3(u_xlat35) + u_xlat8.xyz;
					        }
					        u_xlat3 = textureLod(unity_SpecCube1, u_xlat3.xyz, 6.0);
					        u_xlatb35 = unity_SpecCube1_HDR.w==1.0;
					        u_xlat35 = (u_xlatb35) ? u_xlat3.w : 1.0;
					        u_xlat35 = u_xlat35 * unity_SpecCube1_HDR.x;
					        u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat35);
					        u_xlat5.xyz = vec3(u_xlat34) * u_xlat5.xyz + (-u_xlat3.xyz);
					        u_xlat6.xyz = unity_SpecCube0_BoxMin.www * u_xlat5.xyz + u_xlat3.xyz;
					    }
					    u_xlat34 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
					    u_xlat34 = inversesqrt(u_xlat34);
					    u_xlat3.xyz = vec3(u_xlat34) * vs_TEXCOORD1.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.779083729, 0.779083729, 0.779083729);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat33) + _WorldSpaceLightPos0.xyz;
					    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat33 = max(u_xlat33, 0.00100000005);
					    u_xlat33 = inversesqrt(u_xlat33);
					    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz;
					    u_xlat33 = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat11.x = dot(u_xlat0.xx, u_xlat0.xx);
					    u_xlat11.x = u_xlat11.x + -0.5;
					    u_xlat22 = (-u_xlat1.x) + 1.0;
					    u_xlat12 = u_xlat22 * u_xlat22;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat22 = u_xlat22 * u_xlat12;
					    u_xlat22 = u_xlat11.x * u_xlat22 + 1.0;
					    u_xlat12 = -abs(u_xlat33) + 1.0;
					    u_xlat23 = u_xlat12 * u_xlat12;
					    u_xlat23 = u_xlat23 * u_xlat23;
					    u_xlat12 = u_xlat12 * u_xlat23;
					    u_xlat11.x = u_xlat11.x * u_xlat12 + 1.0;
					    u_xlat11.x = u_xlat11.x * u_xlat22;
					    u_xlat22 = abs(u_xlat33) + u_xlat1.x;
					    u_xlat22 = u_xlat22 + 9.99999975e-06;
					    u_xlat22 = 0.5 / u_xlat22;
					    u_xlat22 = u_xlat22 * 0.999999881;
					    u_xlat22 = max(u_xlat22, 9.99999975e-05);
					    u_xlat11.y = sqrt(u_xlat22);
					    u_xlat11.xy = u_xlat1.xx * u_xlat11.xy;
					    u_xlat1.xzw = _LightColor0.xyz * u_xlat11.xxx + u_xlat4.xyz;
					    u_xlat11.xyz = u_xlat11.yyy * _LightColor0.xyz;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat35 = u_xlat0.x * u_xlat0.x;
					    u_xlat35 = u_xlat35 * u_xlat35;
					    u_xlat0.x = u_xlat0.x * u_xlat35;
					    u_xlat0.x = u_xlat0.x * 0.779083729 + 0.220916301;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat11.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat1.xzw + u_xlat0.xyz;
					    u_xlat1.xzw = u_xlat6.xyz * vec3(0.720000029, 0.720000029, 0.720000029);
					    u_xlat33 = u_xlat12 * -2.98023224e-08 + 0.220916301;
					    u_xlat0.xyz = u_xlat1.xzw * vec3(u_xlat33) + u_xlat0.xyz;
					    u_xlat33 = vs_TEXCOORD5 / _ProjectionParams.y;
					    u_xlat33 = (-u_xlat33) + 1.0;
					    u_xlat33 = u_xlat33 * _ProjectionParams.z;
					    u_xlat33 = max(u_xlat33, 0.0);
					    u_xlat33 = u_xlat33 * unity_FogParams.z + unity_FogParams.w;
					    u_xlat33 = clamp(u_xlat33, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
					    SV_Target0.xyz = vec3(u_xlat33) * u_xlat0.xyz + unity_FogColor.xyz;
					    SV_Target0.w = 1.0;
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
						float Prop;
						vec4 unused_0_5[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 unused_1_3[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[37];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unused_2_5[4];
					};
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unity_FogParams;
					};
					layout(std140) uniform UnityReflectionProbes {
						vec4 unity_SpecCube0_BoxMax;
						vec4 unity_SpecCube0_BoxMin;
						vec4 unity_SpecCube0_ProbePosition;
						vec4 unity_SpecCube0_HDR;
						vec4 unity_SpecCube1_BoxMax;
						vec4 unity_SpecCube1_BoxMin;
						vec4 unity_SpecCube1_ProbePosition;
						vec4 unity_SpecCube1_HDR;
					};
					layout(std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					uniform  sampler2D _Texture1;
					uniform  sampler2D _Texture2;
					uniform  sampler2D _ShadowMapTexture;
					uniform  samplerCube unity_SpecCube0;
					uniform  samplerCube unity_SpecCube1;
					uniform  sampler3D unity_ProbeVolumeSH;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  float vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec4 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec3 u_xlat9;
					bvec3 u_xlatb9;
					vec3 u_xlat10;
					bvec3 u_xlatb11;
					vec3 u_xlat12;
					float u_xlat13;
					vec3 u_xlat15;
					float u_xlat24;
					float u_xlat25;
					float u_xlat36;
					float u_xlat37;
					bool u_xlatb37;
					float u_xlat38;
					bool u_xlatb38;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat36 = inversesqrt(u_xlat36);
					    u_xlat1.xyz = vec3(u_xlat36) * u_xlat0.xyz;
					    u_xlat2 = texture(_Texture1, vs_TEXCOORD0.xy);
					    u_xlat2.xyz = u_xlat2.xyz * _Color.xyz;
					    u_xlat3 = texture(_Texture2, vs_TEXCOORD0.zw);
					    u_xlat3.xyz = u_xlat3.xyz * _Color.xyz;
					    u_xlat37 = (-Prop) + 1.0;
					    u_xlat3.xyz = u_xlat3.xyz * vec3(Prop);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat37) + u_xlat3.xyz;
					    u_xlat3.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
					    u_xlat3 = texture(_ShadowMapTexture, u_xlat3.xy);
					    u_xlat37 = dot((-u_xlat1.xyz), vs_TEXCOORD1.xyz);
					    u_xlat37 = u_xlat37 + u_xlat37;
					    u_xlat15.xyz = vs_TEXCOORD1.xyz * (-vec3(u_xlat37)) + (-u_xlat1.xyz);
					    u_xlat4.xyz = u_xlat3.xxx * _LightColor0.xyz;
					    u_xlatb37 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb37){
					        u_xlatb37 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat5.xyz = vs_TEXCOORD2.yyy * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat5.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat5.xyz;
					        u_xlat5.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat5.xyz;
					        u_xlat5.xyz = u_xlat5.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat5.xyz = (bool(u_xlatb37)) ? u_xlat5.xyz : vs_TEXCOORD2.xyz;
					        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat37 = u_xlat5.y * 0.25;
					        u_xlat38 = unity_ProbeVolumeParams.z * 0.5;
					        u_xlat3.x = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
					        u_xlat37 = max(u_xlat37, u_xlat38);
					        u_xlat5.x = min(u_xlat3.x, u_xlat37);
					        u_xlat6 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
					        u_xlat7.xyz = u_xlat5.xzw + vec3(0.25, 0.0, 0.0);
					        u_xlat7 = texture(unity_ProbeVolumeSH, u_xlat7.xyz);
					        u_xlat5.xyz = u_xlat5.xzw + vec3(0.5, 0.0, 0.0);
					        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xyz);
					        u_xlat8.xyz = vs_TEXCOORD1.xyz;
					        u_xlat8.w = 1.0;
					        u_xlat6.x = dot(u_xlat6, u_xlat8);
					        u_xlat6.y = dot(u_xlat7, u_xlat8);
					        u_xlat6.z = dot(u_xlat5, u_xlat8);
					    } else {
					        u_xlat5.xyz = vs_TEXCOORD1.xyz;
					        u_xlat5.w = 1.0;
					        u_xlat6.x = dot(unity_SHAr, u_xlat5);
					        u_xlat6.y = dot(unity_SHAg, u_xlat5);
					        u_xlat6.z = dot(unity_SHAb, u_xlat5);
					    }
					    u_xlat5.xyz = u_xlat6.xyz + vs_TEXCOORD3.xyz;
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat5.xyz = log2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat5.xyz = exp2(u_xlat5.xyz);
					    u_xlat5.xyz = u_xlat5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlatb37 = 0.0<unity_SpecCube0_ProbePosition.w;
					    if(u_xlatb37){
					        u_xlat37 = dot(u_xlat15.xyz, u_xlat15.xyz);
					        u_xlat37 = inversesqrt(u_xlat37);
					        u_xlat6.xyz = vec3(u_xlat37) * u_xlat15.xyz;
					        u_xlat7.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMax.xyz;
					        u_xlat7.xyz = u_xlat7.xyz / u_xlat6.xyz;
					        u_xlat8.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMin.xyz;
					        u_xlat8.xyz = u_xlat8.xyz / u_xlat6.xyz;
					        u_xlatb9.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat6.xyzx).xyz;
					        {
					            vec4 hlslcc_movcTemp = u_xlat7;
					            hlslcc_movcTemp.x = (u_xlatb9.x) ? u_xlat7.x : u_xlat8.x;
					            hlslcc_movcTemp.y = (u_xlatb9.y) ? u_xlat7.y : u_xlat8.y;
					            hlslcc_movcTemp.z = (u_xlatb9.z) ? u_xlat7.z : u_xlat8.z;
					            u_xlat7 = hlslcc_movcTemp;
					        }
					        u_xlat37 = min(u_xlat7.y, u_xlat7.x);
					        u_xlat37 = min(u_xlat7.z, u_xlat37);
					        u_xlat7.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube0_ProbePosition.xyz);
					        u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat37) + u_xlat7.xyz;
					    } else {
					        u_xlat6.xyz = u_xlat15.xyz;
					    }
					    u_xlat6 = textureLod(unity_SpecCube0, u_xlat6.xyz, 6.0);
					    u_xlatb37 = unity_SpecCube0_HDR.w==1.0;
					    u_xlat37 = (u_xlatb37) ? u_xlat6.w : 1.0;
					    u_xlat37 = u_xlat37 * unity_SpecCube0_HDR.x;
					    u_xlat7.xyz = u_xlat6.xyz * vec3(u_xlat37);
					    u_xlatb38 = unity_SpecCube0_BoxMin.w<0.999989986;
					    if(u_xlatb38){
					        u_xlatb38 = 0.0<unity_SpecCube1_ProbePosition.w;
					        if(u_xlatb38){
					            u_xlat38 = dot(u_xlat15.xyz, u_xlat15.xyz);
					            u_xlat38 = inversesqrt(u_xlat38);
					            u_xlat8.xyz = vec3(u_xlat38) * u_xlat15.xyz;
					            u_xlat9.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMax.xyz;
					            u_xlat9.xyz = u_xlat9.xyz / u_xlat8.xyz;
					            u_xlat10.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMin.xyz;
					            u_xlat10.xyz = u_xlat10.xyz / u_xlat8.xyz;
					            u_xlatb11.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat8.xyzx).xyz;
					            {
					                vec3 hlslcc_movcTemp = u_xlat9;
					                hlslcc_movcTemp.x = (u_xlatb11.x) ? u_xlat9.x : u_xlat10.x;
					                hlslcc_movcTemp.y = (u_xlatb11.y) ? u_xlat9.y : u_xlat10.y;
					                hlslcc_movcTemp.z = (u_xlatb11.z) ? u_xlat9.z : u_xlat10.z;
					                u_xlat9 = hlslcc_movcTemp;
					            }
					            u_xlat38 = min(u_xlat9.y, u_xlat9.x);
					            u_xlat38 = min(u_xlat9.z, u_xlat38);
					            u_xlat9.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube1_ProbePosition.xyz);
					            u_xlat15.xyz = u_xlat8.xyz * vec3(u_xlat38) + u_xlat9.xyz;
					        }
					        u_xlat3 = textureLod(unity_SpecCube1, u_xlat15.xyz, 6.0);
					        u_xlatb38 = unity_SpecCube1_HDR.w==1.0;
					        u_xlat38 = (u_xlatb38) ? u_xlat3.w : 1.0;
					        u_xlat38 = u_xlat38 * unity_SpecCube1_HDR.x;
					        u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat38);
					        u_xlat6.xyz = vec3(u_xlat37) * u_xlat6.xyz + (-u_xlat3.xyz);
					        u_xlat7.xyz = unity_SpecCube0_BoxMin.www * u_xlat6.xyz + u_xlat3.xyz;
					    }
					    u_xlat37 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
					    u_xlat37 = inversesqrt(u_xlat37);
					    u_xlat3.xyz = vec3(u_xlat37) * vs_TEXCOORD1.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.779083729, 0.779083729, 0.779083729);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat36) + _WorldSpaceLightPos0.xyz;
					    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat36 = max(u_xlat36, 0.00100000005);
					    u_xlat36 = inversesqrt(u_xlat36);
					    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
					    u_xlat36 = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat1.x = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat12.x = dot(u_xlat0.xx, u_xlat0.xx);
					    u_xlat12.x = u_xlat12.x + -0.5;
					    u_xlat24 = (-u_xlat1.x) + 1.0;
					    u_xlat13 = u_xlat24 * u_xlat24;
					    u_xlat13 = u_xlat13 * u_xlat13;
					    u_xlat24 = u_xlat24 * u_xlat13;
					    u_xlat24 = u_xlat12.x * u_xlat24 + 1.0;
					    u_xlat13 = -abs(u_xlat36) + 1.0;
					    u_xlat25 = u_xlat13 * u_xlat13;
					    u_xlat25 = u_xlat25 * u_xlat25;
					    u_xlat13 = u_xlat13 * u_xlat25;
					    u_xlat12.x = u_xlat12.x * u_xlat13 + 1.0;
					    u_xlat12.x = u_xlat12.x * u_xlat24;
					    u_xlat24 = abs(u_xlat36) + u_xlat1.x;
					    u_xlat24 = u_xlat24 + 9.99999975e-06;
					    u_xlat24 = 0.5 / u_xlat24;
					    u_xlat24 = u_xlat24 * 0.999999881;
					    u_xlat24 = max(u_xlat24, 9.99999975e-05);
					    u_xlat12.y = sqrt(u_xlat24);
					    u_xlat12.xy = u_xlat1.xx * u_xlat12.xy;
					    u_xlat1.xzw = u_xlat4.xyz * u_xlat12.xxx + u_xlat5.xyz;
					    u_xlat12.xyz = u_xlat4.xyz * u_xlat12.yyy;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat38 = u_xlat0.x * u_xlat0.x;
					    u_xlat38 = u_xlat38 * u_xlat38;
					    u_xlat0.x = u_xlat0.x * u_xlat38;
					    u_xlat0.x = u_xlat0.x * 0.779083729 + 0.220916301;
					    u_xlat0.xyz = u_xlat0.xxx * u_xlat12.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat1.xzw + u_xlat0.xyz;
					    u_xlat1.xzw = u_xlat7.xyz * vec3(0.720000029, 0.720000029, 0.720000029);
					    u_xlat36 = u_xlat13 * -2.98023224e-08 + 0.220916301;
					    u_xlat0.xyz = u_xlat1.xzw * vec3(u_xlat36) + u_xlat0.xyz;
					    u_xlat36 = vs_TEXCOORD5 / _ProjectionParams.y;
					    u_xlat36 = (-u_xlat36) + 1.0;
					    u_xlat36 = u_xlat36 * _ProjectionParams.z;
					    u_xlat36 = max(u_xlat36, 0.0);
					    u_xlat36 = u_xlat36 * unity_FogParams.z + unity_FogParams.w;
					    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
					    SV_Target0.xyz = vec3(u_xlat36) * u_xlat0.xyz + unity_FogColor.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
			}
		}
		Pass {
			Name "FORWARD"
			LOD 200
			Tags { "LIGHTMODE" = "ForwardAdd" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
			Blend One One, One One
			ZClip Off
			ZWrite Off
			GpuProgramID 123113
			Program "vp" {
				SubProgram "d3d11 " {
					Keywords { "POINT" }
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
						vec4 unused_0_0[10];
						vec4 _Texture1_ST;
						vec4 _Texture2_ST;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture1_ST.xy + _Texture1_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Texture2_ST.xy + _Texture2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    vs_TEXCOORD1.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
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
						vec4 unused_0_0[6];
						vec4 _Texture1_ST;
						vec4 _Texture2_ST;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture1_ST.xy + _Texture1_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Texture2_ST.xy + _Texture2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    vs_TEXCOORD1.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" }
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
						vec4 unused_0_0[10];
						vec4 _Texture1_ST;
						vec4 _Texture2_ST;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture1_ST.xy + _Texture1_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Texture2_ST.xy + _Texture2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    vs_TEXCOORD1.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" }
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
						vec4 unused_0_0[10];
						vec4 _Texture1_ST;
						vec4 _Texture2_ST;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture1_ST.xy + _Texture1_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Texture2_ST.xy + _Texture2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    vs_TEXCOORD1.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" }
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
						vec4 unused_0_0[10];
						vec4 _Texture1_ST;
						vec4 _Texture2_ST;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture1_ST.xy + _Texture1_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Texture2_ST.xy + _Texture2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    vs_TEXCOORD1.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "SHADOWS_DEPTH" }
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
						vec4 unused_0_0[10];
						vec4 _Texture1_ST;
						vec4 _Texture2_ST;
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_1_0[8];
						mat4x4 unity_WorldToShadow[4];
						vec4 unused_1_2[14];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_2_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture1_ST.xy + _Texture1_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Texture2_ST.xy + _Texture2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat1 = u_xlat0.yyyy * unity_WorldToShadow[1 / 4][1 % 4];
					    u_xlat1 = unity_WorldToShadow[0 / 4][0 % 4] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToShadow[2 / 4][2 % 4] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD3 = unity_WorldToShadow[3 / 4][3 % 4] * u_xlat0.wwww + u_xlat1;
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
						vec4 unused_0_0[6];
						vec4 _Texture1_ST;
						vec4 _Texture2_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_2_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat7;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture1_ST.xy + _Texture1_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Texture2_ST.xy + _Texture2_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat7 = inversesqrt(u_xlat7);
					    vs_TEXCOORD1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
					    u_xlat1.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD3.zw = u_xlat0.zw;
					    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
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
						vec4 unused_0_0[10];
						vec4 _Texture1_ST;
						vec4 _Texture2_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_2_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat7;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture1_ST.xy + _Texture1_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Texture2_ST.xy + _Texture2_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat7 = inversesqrt(u_xlat7);
					    vs_TEXCOORD1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
					    u_xlat1.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD3.zw = u_xlat0.zw;
					    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "SHADOWS_CUBE" }
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
						vec4 unused_0_0[10];
						vec4 _Texture1_ST;
						vec4 _Texture2_ST;
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
						mat4x4 unity_WorldToObject;
						vec4 unused_2_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture1_ST.xy + _Texture1_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Texture2_ST.xy + _Texture2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    vs_TEXCOORD1.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
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
						vec4 unused_0_0[10];
						vec4 _Texture1_ST;
						vec4 _Texture2_ST;
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
						mat4x4 unity_WorldToObject;
						vec4 unused_2_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture1_ST.xy + _Texture1_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Texture2_ST.xy + _Texture2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    vs_TEXCOORD1.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
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
						vec4 unused_0_0[14];
						vec4 _Texture1_ST;
						vec4 _Texture2_ST;
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_1_0[8];
						mat4x4 unity_WorldToShadow[4];
						vec4 unused_1_2[14];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_2_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture1_ST.xy + _Texture1_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Texture2_ST.xy + _Texture2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat1 = u_xlat0.yyyy * unity_WorldToShadow[1 / 4][1 % 4];
					    u_xlat1 = unity_WorldToShadow[0 / 4][0 % 4] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToShadow[2 / 4][2 % 4] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD3 = unity_WorldToShadow[3 / 4][3 % 4] * u_xlat0.wwww + u_xlat1;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
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
						vec4 unused_0_0[10];
						vec4 _Texture1_ST;
						vec4 _Texture2_ST;
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
						mat4x4 unity_WorldToObject;
						vec4 unused_2_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture1_ST.xy + _Texture1_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Texture2_ST.xy + _Texture2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    vs_TEXCOORD1.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
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
						vec4 unused_0_0[10];
						vec4 _Texture1_ST;
						vec4 _Texture2_ST;
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
						mat4x4 unity_WorldToObject;
						vec4 unused_2_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture1_ST.xy + _Texture1_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Texture2_ST.xy + _Texture2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    vs_TEXCOORD1.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "FOG_LINEAR" }
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
						vec4 unused_0_0[10];
						vec4 _Texture1_ST;
						vec4 _Texture2_ST;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out float vs_TEXCOORD4;
					out vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD4 = u_xlat0.z;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture1_ST.xy + _Texture1_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Texture2_ST.xy + _Texture2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    vs_TEXCOORD1.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
						vec4 unused_0_0[6];
						vec4 _Texture1_ST;
						vec4 _Texture2_ST;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out float vs_TEXCOORD4;
					out vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD4 = u_xlat0.z;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture1_ST.xy + _Texture1_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Texture2_ST.xy + _Texture2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    vs_TEXCOORD1.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "FOG_LINEAR" }
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
						vec4 unused_0_0[10];
						vec4 _Texture1_ST;
						vec4 _Texture2_ST;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out float vs_TEXCOORD4;
					out vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD4 = u_xlat0.z;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture1_ST.xy + _Texture1_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Texture2_ST.xy + _Texture2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    vs_TEXCOORD1.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "FOG_LINEAR" }
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
						vec4 unused_0_0[10];
						vec4 _Texture1_ST;
						vec4 _Texture2_ST;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out float vs_TEXCOORD4;
					out vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD4 = u_xlat0.z;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture1_ST.xy + _Texture1_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Texture2_ST.xy + _Texture2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    vs_TEXCOORD1.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" }
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
						vec4 unused_0_0[10];
						vec4 _Texture1_ST;
						vec4 _Texture2_ST;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out float vs_TEXCOORD4;
					out vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD4 = u_xlat0.z;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture1_ST.xy + _Texture1_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Texture2_ST.xy + _Texture2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    vs_TEXCOORD1.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" }
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
						vec4 unused_0_0[10];
						vec4 _Texture1_ST;
						vec4 _Texture2_ST;
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_1_0[8];
						mat4x4 unity_WorldToShadow[4];
						vec4 unused_1_2[14];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_2_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out float vs_TEXCOORD4;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD4 = u_xlat0.z;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture1_ST.xy + _Texture1_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Texture2_ST.xy + _Texture2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat1 = u_xlat0.yyyy * unity_WorldToShadow[1 / 4][1 % 4];
					    u_xlat1 = unity_WorldToShadow[0 / 4][0 % 4] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToShadow[2 / 4][2 % 4] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD3 = unity_WorldToShadow[3 / 4][3 % 4] * u_xlat0.wwww + u_xlat1;
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
						vec4 unused_0_0[6];
						vec4 _Texture1_ST;
						vec4 _Texture2_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_2_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out float vs_TEXCOORD4;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat7;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture1_ST.xy + _Texture1_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Texture2_ST.xy + _Texture2_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat7 = inversesqrt(u_xlat7);
					    vs_TEXCOORD1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
					    vs_TEXCOORD4 = u_xlat0.z;
					    u_xlat1.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD3.zw = u_xlat0.zw;
					    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" }
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
						vec4 unused_0_0[10];
						vec4 _Texture1_ST;
						vec4 _Texture2_ST;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_2_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out float vs_TEXCOORD4;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat7;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture1_ST.xy + _Texture1_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Texture2_ST.xy + _Texture2_ST.zw;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat7 = inversesqrt(u_xlat7);
					    vs_TEXCOORD1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
					    vs_TEXCOORD4 = u_xlat0.z;
					    u_xlat1.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD3.zw = u_xlat0.zw;
					    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" }
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
						vec4 unused_0_0[10];
						vec4 _Texture1_ST;
						vec4 _Texture2_ST;
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
						mat4x4 unity_WorldToObject;
						vec4 unused_2_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out float vs_TEXCOORD4;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD4 = u_xlat0.z;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture1_ST.xy + _Texture1_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Texture2_ST.xy + _Texture2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    vs_TEXCOORD1.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" }
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
						vec4 unused_0_0[10];
						vec4 _Texture1_ST;
						vec4 _Texture2_ST;
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
						mat4x4 unity_WorldToObject;
						vec4 unused_2_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out float vs_TEXCOORD4;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD4 = u_xlat0.z;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture1_ST.xy + _Texture1_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Texture2_ST.xy + _Texture2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    vs_TEXCOORD1.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "FOG_LINEAR" }
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
						vec4 unused_0_0[14];
						vec4 _Texture1_ST;
						vec4 _Texture2_ST;
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_1_0[8];
						mat4x4 unity_WorldToShadow[4];
						vec4 unused_1_2[14];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_2_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out float vs_TEXCOORD4;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD4 = u_xlat0.z;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture1_ST.xy + _Texture1_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Texture2_ST.xy + _Texture2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat1 = u_xlat0.yyyy * unity_WorldToShadow[1 / 4][1 % 4];
					    u_xlat1 = unity_WorldToShadow[0 / 4][0 % 4] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToShadow[2 / 4][2 % 4] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD3 = unity_WorldToShadow[3 / 4][3 % 4] * u_xlat0.wwww + u_xlat1;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" }
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
						vec4 unused_0_0[10];
						vec4 _Texture1_ST;
						vec4 _Texture2_ST;
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
						mat4x4 unity_WorldToObject;
						vec4 unused_2_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out float vs_TEXCOORD4;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD4 = u_xlat0.z;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture1_ST.xy + _Texture1_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Texture2_ST.xy + _Texture2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    vs_TEXCOORD1.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" }
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
						vec4 unused_0_0[10];
						vec4 _Texture1_ST;
						vec4 _Texture2_ST;
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
						mat4x4 unity_WorldToObject;
						vec4 unused_2_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out float vs_TEXCOORD4;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD4 = u_xlat0.z;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture1_ST.xy + _Texture1_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Texture2_ST.xy + _Texture2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat3 = inversesqrt(u_xlat3);
					    vs_TEXCOORD1.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD2.xyz = u_xlat0.xyz;
					    vs_TEXCOORD3.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
					    return;
					}"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					Keywords { "POINT" }
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
						mat4x4 unity_WorldToLight;
						vec4 _Color;
						float Prop;
						vec4 unused_0_6[2];
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
					uniform  sampler2D _Texture1;
					uniform  sampler2D _Texture2;
					uniform  sampler2D _LightTexture0;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat5;
					float u_xlat6;
					float u_xlat9;
					float u_xlat12;
					float u_xlat13;
					float u_xlat14;
					void main()
					{
					    u_xlat0 = texture(_Texture2, vs_TEXCOORD0.zw);
					    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(Prop);
					    u_xlat1 = texture(_Texture1, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
					    u_xlat12 = (-Prop) + 1.0;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat12) + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.779083729, 0.779083729, 0.779083729);
					    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat1.xyz;
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat12 = max(u_xlat12, 0.00100000005);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat3.xyz);
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    u_xlat1.w = dot(vec2(u_xlat12), vec2(u_xlat12));
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat14 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
					    u_xlat14 = inversesqrt(u_xlat14);
					    u_xlat3.xyz = vec3(u_xlat14) * vs_TEXCOORD1.xyz;
					    u_xlat1.x = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat5.x = dot(u_xlat3.xyz, u_xlat2.xyz);
					    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
					    u_xlat9 = -abs(u_xlat1.x) + 1.0;
					    u_xlat1.x = abs(u_xlat1.x) + u_xlat5.x;
					    u_xlat1.xw = u_xlat1.xw + vec2(9.99999975e-06, -0.5);
					    u_xlat1.x = 0.5 / u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * 0.999999881;
					    u_xlat1.x = max(u_xlat1.x, 9.99999975e-05);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat5.x * u_xlat1.x;
					    u_xlat2.x = u_xlat9 * u_xlat9;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x;
					    u_xlat9 = u_xlat9 * u_xlat2.x;
					    u_xlat9 = u_xlat1.w * u_xlat9 + 1.0;
					    u_xlat2.x = (-u_xlat5.x) + 1.0;
					    u_xlat6 = u_xlat2.x * u_xlat2.x;
					    u_xlat6 = u_xlat6 * u_xlat6;
					    u_xlat2.x = u_xlat2.x * u_xlat6;
					    u_xlat13 = u_xlat1.w * u_xlat2.x + 1.0;
					    u_xlat9 = u_xlat9 * u_xlat13;
					    u_xlat5.x = u_xlat5.x * u_xlat9;
					    u_xlat2.xyz = vs_TEXCOORD2.yyy * unity_WorldToLight[1].xyz;
					    u_xlat2.xyz = unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
					    u_xlat2.xyz = u_xlat2.xyz + unity_WorldToLight[3].xyz;
					    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat2 = texture(_LightTexture0, vec2(u_xlat9));
					    u_xlat2.xyz = u_xlat2.xxx * _LightColor0.xyz;
					    u_xlat5.xyz = u_xlat5.xxx * u_xlat2.xyz;
					    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
					    u_xlat1.x = u_xlat12 * u_xlat12;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat12 = u_xlat12 * u_xlat1.x;
					    u_xlat12 = u_xlat12 * 0.779083729 + 0.220916301;
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
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
						float Prop;
						vec4 unused_0_5[2];
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
					uniform  sampler2D _Texture1;
					uniform  sampler2D _Texture2;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat5;
					float u_xlat9;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = texture(_Texture2, vs_TEXCOORD0.zw);
					    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(Prop);
					    u_xlat1 = texture(_Texture1, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
					    u_xlat12 = (-Prop) + 1.0;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat12) + u_xlat0.xyz;
					    u_xlat12 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * vs_TEXCOORD1.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat12) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat3.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat5.x = -abs(u_xlat12) + 1.0;
					    u_xlat12 = abs(u_xlat12) + u_xlat1.x;
					    u_xlat12 = u_xlat12 + 9.99999975e-06;
					    u_xlat0.w = 0.5 / u_xlat12;
					    u_xlat0 = u_xlat0 * vec4(0.779083729, 0.779083729, 0.779083729, 0.999999881);
					    u_xlat12 = max(u_xlat0.w, 9.99999975e-05);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat1.x * u_xlat12;
					    u_xlat3.xyz = vec3(u_xlat12) * _LightColor0.xyz;
					    u_xlat12 = u_xlat5.x * u_xlat5.x;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat5.x * u_xlat12;
					    u_xlat5.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat5.x = max(u_xlat5.x, 0.00100000005);
					    u_xlat5.x = inversesqrt(u_xlat5.x);
					    u_xlat5.xyz = u_xlat5.xxx * u_xlat2.xyz;
					    u_xlat1.y = dot(_WorldSpaceLightPos0.xyz, u_xlat5.xyz);
					    u_xlat1.y = clamp(u_xlat1.y, 0.0, 1.0);
					    u_xlat9 = dot(u_xlat1.yy, u_xlat1.yy);
					    u_xlat9 = u_xlat9 + -0.5;
					    u_xlat12 = u_xlat9 * u_xlat12 + 1.0;
					    u_xlat5.xz = (-u_xlat1.yx) + vec2(1.0, 1.0);
					    u_xlat2.x = u_xlat5.z * u_xlat5.z;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x;
					    u_xlat13 = u_xlat5.z * u_xlat2.x;
					    u_xlat9 = u_xlat9 * u_xlat13 + 1.0;
					    u_xlat12 = u_xlat12 * u_xlat9;
					    u_xlat12 = u_xlat1.x * u_xlat12;
					    u_xlat1.xzw = vec3(u_xlat12) * _LightColor0.xyz;
					    u_xlat12 = u_xlat5.x * u_xlat5.x;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat5.x * u_xlat12;
					    u_xlat12 = u_xlat12 * 0.779083729 + 0.220916301;
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xzw + u_xlat2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" }
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
						mat4x4 unity_WorldToLight;
						vec4 _Color;
						float Prop;
						vec4 unused_0_6[2];
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
					uniform  sampler2D _Texture1;
					uniform  sampler2D _Texture2;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					float u_xlat7;
					float u_xlat12;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat16;
					float u_xlat17;
					void main()
					{
					    u_xlat0 = texture(_Texture2, vs_TEXCOORD0.zw);
					    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(Prop);
					    u_xlat1 = texture(_Texture1, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
					    u_xlat15 = (-Prop) + 1.0;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat15) + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.779083729, 0.779083729, 0.779083729);
					    u_xlat1 = vs_TEXCOORD2.yyyy * unity_WorldToLight[1];
					    u_xlat1 = unity_WorldToLight[0] * vs_TEXCOORD2.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToLight[2] * vs_TEXCOORD2.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_WorldToLight[3];
					    u_xlat2.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat2 = texture(_LightTexture0, u_xlat2.xy);
					    u_xlatb15 = 0.0<u_xlat1.z;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1 = texture(_LightTextureB0, u_xlat1.xx);
					    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
					    u_xlat15 = u_xlat2.w * u_xlat15;
					    u_xlat15 = u_xlat1.x * u_xlat15;
					    u_xlat1.xyz = vec3(u_xlat15) * _LightColor0.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
					    u_xlat3.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat15 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat4.xyz = u_xlat3.xyz * vec3(u_xlat15) + u_xlat2.xyz;
					    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz;
					    u_xlat15 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat15 = max(u_xlat15, 0.00100000005);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz;
					    u_xlat15 = dot(u_xlat3.xyz, u_xlat4.xyz);
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					    u_xlat16 = dot(vec2(u_xlat15), vec2(u_xlat15));
					    u_xlat15 = (-u_xlat15) + 1.0;
					    u_xlat16 = u_xlat16 + -0.5;
					    u_xlat17 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
					    u_xlat17 = inversesqrt(u_xlat17);
					    u_xlat4.xyz = vec3(u_xlat17) * vs_TEXCOORD1.xyz;
					    u_xlat2.x = dot(u_xlat4.xyz, u_xlat2.xyz);
					    u_xlat7 = dot(u_xlat4.xyz, u_xlat3.xyz);
					    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
					    u_xlat12 = -abs(u_xlat2.x) + 1.0;
					    u_xlat2.x = abs(u_xlat2.x) + u_xlat7;
					    u_xlat2.x = u_xlat2.x + 9.99999975e-06;
					    u_xlat2.x = 0.5 / u_xlat2.x;
					    u_xlat2.x = u_xlat2.x * 0.999999881;
					    u_xlat2.x = max(u_xlat2.x, 9.99999975e-05);
					    u_xlat2.x = sqrt(u_xlat2.x);
					    u_xlat2.x = u_xlat7 * u_xlat2.x;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xxx;
					    u_xlat2.x = u_xlat12 * u_xlat12;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x;
					    u_xlat2.x = u_xlat12 * u_xlat2.x;
					    u_xlat2.x = u_xlat16 * u_xlat2.x + 1.0;
					    u_xlat12 = (-u_xlat7) + 1.0;
					    u_xlat17 = u_xlat12 * u_xlat12;
					    u_xlat17 = u_xlat17 * u_xlat17;
					    u_xlat12 = u_xlat12 * u_xlat17;
					    u_xlat16 = u_xlat16 * u_xlat12 + 1.0;
					    u_xlat16 = u_xlat2.x * u_xlat16;
					    u_xlat16 = u_xlat7 * u_xlat16;
					    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
					    u_xlat16 = u_xlat15 * u_xlat15;
					    u_xlat16 = u_xlat16 * u_xlat16;
					    u_xlat15 = u_xlat15 * u_xlat16;
					    u_xlat15 = u_xlat15 * 0.779083729 + 0.220916301;
					    u_xlat2.xyz = vec3(u_xlat15) * u_xlat3.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz + u_xlat2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" }
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
						mat4x4 unity_WorldToLight;
						vec4 _Color;
						float Prop;
						vec4 unused_0_6[2];
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
					uniform  sampler2D _Texture1;
					uniform  sampler2D _Texture2;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat5;
					float u_xlat6;
					float u_xlat9;
					float u_xlat12;
					float u_xlat13;
					float u_xlat14;
					void main()
					{
					    u_xlat0 = texture(_Texture2, vs_TEXCOORD0.zw);
					    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(Prop);
					    u_xlat1 = texture(_Texture1, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
					    u_xlat12 = (-Prop) + 1.0;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat12) + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.779083729, 0.779083729, 0.779083729);
					    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat1.xyz;
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat12 = max(u_xlat12, 0.00100000005);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat3.xyz);
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    u_xlat1.w = dot(vec2(u_xlat12), vec2(u_xlat12));
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat14 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
					    u_xlat14 = inversesqrt(u_xlat14);
					    u_xlat3.xyz = vec3(u_xlat14) * vs_TEXCOORD1.xyz;
					    u_xlat1.x = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat5.x = dot(u_xlat3.xyz, u_xlat2.xyz);
					    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
					    u_xlat9 = -abs(u_xlat1.x) + 1.0;
					    u_xlat1.x = abs(u_xlat1.x) + u_xlat5.x;
					    u_xlat1.xw = u_xlat1.xw + vec2(9.99999975e-06, -0.5);
					    u_xlat1.x = 0.5 / u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * 0.999999881;
					    u_xlat1.x = max(u_xlat1.x, 9.99999975e-05);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat5.x * u_xlat1.x;
					    u_xlat2.x = u_xlat9 * u_xlat9;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x;
					    u_xlat9 = u_xlat9 * u_xlat2.x;
					    u_xlat9 = u_xlat1.w * u_xlat9 + 1.0;
					    u_xlat2.x = (-u_xlat5.x) + 1.0;
					    u_xlat6 = u_xlat2.x * u_xlat2.x;
					    u_xlat6 = u_xlat6 * u_xlat6;
					    u_xlat2.x = u_xlat2.x * u_xlat6;
					    u_xlat13 = u_xlat1.w * u_xlat2.x + 1.0;
					    u_xlat9 = u_xlat9 * u_xlat13;
					    u_xlat5.x = u_xlat5.x * u_xlat9;
					    u_xlat2.xyz = vs_TEXCOORD2.yyy * unity_WorldToLight[1].xyz;
					    u_xlat2.xyz = unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
					    u_xlat2.xyz = u_xlat2.xyz + unity_WorldToLight[3].xyz;
					    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat2 = texture(_LightTexture0, u_xlat2.xyz);
					    u_xlat3 = texture(_LightTextureB0, vec2(u_xlat9));
					    u_xlat9 = u_xlat2.w * u_xlat3.x;
					    u_xlat2.xyz = vec3(u_xlat9) * _LightColor0.xyz;
					    u_xlat5.xyz = u_xlat5.xxx * u_xlat2.xyz;
					    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
					    u_xlat1.x = u_xlat12 * u_xlat12;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat12 = u_xlat12 * u_xlat1.x;
					    u_xlat12 = u_xlat12 * 0.779083729 + 0.220916301;
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" }
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
						mat4x4 unity_WorldToLight;
						vec4 _Color;
						float Prop;
						vec4 unused_0_6[2];
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
					uniform  sampler2D _Texture1;
					uniform  sampler2D _Texture2;
					uniform  sampler2D _LightTexture0;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat5;
					float u_xlat6;
					float u_xlat9;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = texture(_Texture2, vs_TEXCOORD0.zw);
					    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(Prop);
					    u_xlat1 = texture(_Texture1, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
					    u_xlat12 = (-Prop) + 1.0;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat12) + u_xlat0.xyz;
					    u_xlat12 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * vs_TEXCOORD1.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat12) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat3.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat5.x = -abs(u_xlat12) + 1.0;
					    u_xlat12 = abs(u_xlat12) + u_xlat1.x;
					    u_xlat12 = u_xlat12 + 9.99999975e-06;
					    u_xlat0.w = 0.5 / u_xlat12;
					    u_xlat0 = u_xlat0 * vec4(0.779083729, 0.779083729, 0.779083729, 0.999999881);
					    u_xlat12 = max(u_xlat0.w, 9.99999975e-05);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat1.x * u_xlat12;
					    u_xlat9 = u_xlat5.x * u_xlat5.x;
					    u_xlat9 = u_xlat9 * u_xlat9;
					    u_xlat5.x = u_xlat5.x * u_xlat9;
					    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat9 = max(u_xlat9, 0.00100000005);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
					    u_xlat9 = dot(_WorldSpaceLightPos0.xyz, u_xlat2.xyz);
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat13 = dot(vec2(u_xlat9), vec2(u_xlat9));
					    u_xlat9 = (-u_xlat9) + 1.0;
					    u_xlat13 = u_xlat13 + -0.5;
					    u_xlat5.x = u_xlat13 * u_xlat5.x + 1.0;
					    u_xlat2.x = (-u_xlat1.x) + 1.0;
					    u_xlat6 = u_xlat2.x * u_xlat2.x;
					    u_xlat6 = u_xlat6 * u_xlat6;
					    u_xlat2.x = u_xlat2.x * u_xlat6;
					    u_xlat13 = u_xlat13 * u_xlat2.x + 1.0;
					    u_xlat5.x = u_xlat5.x * u_xlat13;
					    u_xlat1.x = u_xlat1.x * u_xlat5.x;
					    u_xlat5.xz = vs_TEXCOORD2.yy * unity_WorldToLight[1].xy;
					    u_xlat5.xz = unity_WorldToLight[0].xy * vs_TEXCOORD2.xx + u_xlat5.xz;
					    u_xlat5.xz = unity_WorldToLight[2].xy * vs_TEXCOORD2.zz + u_xlat5.xz;
					    u_xlat5.xz = u_xlat5.xz + unity_WorldToLight[3].xy;
					    u_xlat2 = texture(_LightTexture0, u_xlat5.xz);
					    u_xlat2.xyz = u_xlat2.www * _LightColor0.xyz;
					    u_xlat1.xyw = u_xlat1.xxx * u_xlat2.xyz;
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = u_xlat9 * u_xlat9;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat9 * u_xlat12;
					    u_xlat12 = u_xlat12 * 0.779083729 + 0.220916301;
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyw + u_xlat2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "SHADOWS_DEPTH" }
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
						mat4x4 unity_WorldToLight;
						vec4 _Color;
						float Prop;
						vec4 unused_0_6[2];
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
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _Texture1;
					uniform  sampler2D _Texture2;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					float u_xlat6;
					float u_xlat7;
					float u_xlat12;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat16;
					float u_xlat17;
					void main()
					{
					    u_xlat0 = texture(_Texture2, vs_TEXCOORD0.zw);
					    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(Prop);
					    u_xlat1 = texture(_Texture1, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
					    u_xlat15 = (-Prop) + 1.0;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat15) + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.779083729, 0.779083729, 0.779083729);
					    u_xlat1 = vs_TEXCOORD2.yyyy * unity_WorldToLight[1];
					    u_xlat1 = unity_WorldToLight[0] * vs_TEXCOORD2.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToLight[2] * vs_TEXCOORD2.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_WorldToLight[3];
					    u_xlat2.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat2 = texture(_LightTexture0, u_xlat2.xy);
					    u_xlatb15 = 0.0<u_xlat1.z;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1 = texture(_LightTextureB0, u_xlat1.xx);
					    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
					    u_xlat15 = u_xlat2.w * u_xlat15;
					    u_xlat15 = u_xlat1.x * u_xlat15;
					    u_xlat1.xyz = vs_TEXCOORD3.xyz / vs_TEXCOORD3.www;
					    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
					    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat6 = (-_LightShadowData.x) + 1.0;
					    u_xlat1.x = u_xlat1.x * u_xlat6 + _LightShadowData.x;
					    u_xlat15 = u_xlat15 * u_xlat1.x;
					    u_xlat1.xyz = vec3(u_xlat15) * _LightColor0.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
					    u_xlat3.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat15 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat4.xyz = u_xlat3.xyz * vec3(u_xlat15) + u_xlat2.xyz;
					    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz;
					    u_xlat15 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat15 = max(u_xlat15, 0.00100000005);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz;
					    u_xlat15 = dot(u_xlat3.xyz, u_xlat4.xyz);
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					    u_xlat16 = dot(vec2(u_xlat15), vec2(u_xlat15));
					    u_xlat15 = (-u_xlat15) + 1.0;
					    u_xlat16 = u_xlat16 + -0.5;
					    u_xlat17 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
					    u_xlat17 = inversesqrt(u_xlat17);
					    u_xlat4.xyz = vec3(u_xlat17) * vs_TEXCOORD1.xyz;
					    u_xlat2.x = dot(u_xlat4.xyz, u_xlat2.xyz);
					    u_xlat7 = dot(u_xlat4.xyz, u_xlat3.xyz);
					    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
					    u_xlat12 = -abs(u_xlat2.x) + 1.0;
					    u_xlat2.x = abs(u_xlat2.x) + u_xlat7;
					    u_xlat2.x = u_xlat2.x + 9.99999975e-06;
					    u_xlat2.x = 0.5 / u_xlat2.x;
					    u_xlat2.x = u_xlat2.x * 0.999999881;
					    u_xlat2.x = max(u_xlat2.x, 9.99999975e-05);
					    u_xlat2.x = sqrt(u_xlat2.x);
					    u_xlat2.x = u_xlat7 * u_xlat2.x;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xxx;
					    u_xlat2.x = u_xlat12 * u_xlat12;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x;
					    u_xlat2.x = u_xlat12 * u_xlat2.x;
					    u_xlat2.x = u_xlat16 * u_xlat2.x + 1.0;
					    u_xlat12 = (-u_xlat7) + 1.0;
					    u_xlat17 = u_xlat12 * u_xlat12;
					    u_xlat17 = u_xlat17 * u_xlat17;
					    u_xlat12 = u_xlat12 * u_xlat17;
					    u_xlat16 = u_xlat16 * u_xlat12 + 1.0;
					    u_xlat16 = u_xlat2.x * u_xlat16;
					    u_xlat16 = u_xlat7 * u_xlat16;
					    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
					    u_xlat16 = u_xlat15 * u_xlat15;
					    u_xlat16 = u_xlat16 * u_xlat16;
					    u_xlat15 = u_xlat15 * u_xlat16;
					    u_xlat15 = u_xlat15 * 0.779083729 + 0.220916301;
					    u_xlat2.xyz = vec3(u_xlat15) * u_xlat3.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz + u_xlat2.xyz;
					    SV_Target0.w = 1.0;
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
						float Prop;
						vec4 unused_0_5[2];
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
					uniform  sampler2D _Texture1;
					uniform  sampler2D _Texture2;
					uniform  sampler2D _ShadowMapTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat5;
					float u_xlat6;
					float u_xlat9;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = texture(_Texture2, vs_TEXCOORD0.zw);
					    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(Prop);
					    u_xlat1 = texture(_Texture1, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
					    u_xlat12 = (-Prop) + 1.0;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat12) + u_xlat0.xyz;
					    u_xlat12 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * vs_TEXCOORD1.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat12) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat3.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat5.x = -abs(u_xlat12) + 1.0;
					    u_xlat12 = abs(u_xlat12) + u_xlat1.x;
					    u_xlat12 = u_xlat12 + 9.99999975e-06;
					    u_xlat0.w = 0.5 / u_xlat12;
					    u_xlat0 = u_xlat0 * vec4(0.779083729, 0.779083729, 0.779083729, 0.999999881);
					    u_xlat12 = max(u_xlat0.w, 9.99999975e-05);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat1.x * u_xlat12;
					    u_xlat9 = u_xlat5.x * u_xlat5.x;
					    u_xlat9 = u_xlat9 * u_xlat9;
					    u_xlat5.x = u_xlat5.x * u_xlat9;
					    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat9 = max(u_xlat9, 0.00100000005);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
					    u_xlat9 = dot(_WorldSpaceLightPos0.xyz, u_xlat2.xyz);
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat13 = dot(vec2(u_xlat9), vec2(u_xlat9));
					    u_xlat9 = (-u_xlat9) + 1.0;
					    u_xlat13 = u_xlat13 + -0.5;
					    u_xlat5.x = u_xlat13 * u_xlat5.x + 1.0;
					    u_xlat2.x = (-u_xlat1.x) + 1.0;
					    u_xlat6 = u_xlat2.x * u_xlat2.x;
					    u_xlat6 = u_xlat6 * u_xlat6;
					    u_xlat2.x = u_xlat2.x * u_xlat6;
					    u_xlat13 = u_xlat13 * u_xlat2.x + 1.0;
					    u_xlat5.x = u_xlat5.x * u_xlat13;
					    u_xlat1.x = u_xlat1.x * u_xlat5.x;
					    u_xlat5.xz = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
					    u_xlat2 = texture(_ShadowMapTexture, u_xlat5.xz);
					    u_xlat2.xyz = u_xlat2.xxx * _LightColor0.xyz;
					    u_xlat1.xyw = u_xlat1.xxx * u_xlat2.xyz;
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = u_xlat9 * u_xlat9;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat9 * u_xlat12;
					    u_xlat12 = u_xlat12 * 0.779083729 + 0.220916301;
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyw + u_xlat2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
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
						mat4x4 unity_WorldToLight;
						vec4 _Color;
						float Prop;
						vec4 unused_0_6[2];
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
					uniform  sampler2D _Texture1;
					uniform  sampler2D _Texture2;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _ShadowMapTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat5;
					float u_xlat6;
					float u_xlat9;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = texture(_Texture2, vs_TEXCOORD0.zw);
					    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(Prop);
					    u_xlat1 = texture(_Texture1, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
					    u_xlat12 = (-Prop) + 1.0;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat12) + u_xlat0.xyz;
					    u_xlat12 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * vs_TEXCOORD1.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat12) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat3.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat5.x = -abs(u_xlat12) + 1.0;
					    u_xlat12 = abs(u_xlat12) + u_xlat1.x;
					    u_xlat12 = u_xlat12 + 9.99999975e-06;
					    u_xlat0.w = 0.5 / u_xlat12;
					    u_xlat0 = u_xlat0 * vec4(0.779083729, 0.779083729, 0.779083729, 0.999999881);
					    u_xlat12 = max(u_xlat0.w, 9.99999975e-05);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat1.x * u_xlat12;
					    u_xlat9 = u_xlat5.x * u_xlat5.x;
					    u_xlat9 = u_xlat9 * u_xlat9;
					    u_xlat5.x = u_xlat5.x * u_xlat9;
					    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat9 = max(u_xlat9, 0.00100000005);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
					    u_xlat9 = dot(_WorldSpaceLightPos0.xyz, u_xlat2.xyz);
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat13 = dot(vec2(u_xlat9), vec2(u_xlat9));
					    u_xlat9 = (-u_xlat9) + 1.0;
					    u_xlat13 = u_xlat13 + -0.5;
					    u_xlat5.x = u_xlat13 * u_xlat5.x + 1.0;
					    u_xlat2.x = (-u_xlat1.x) + 1.0;
					    u_xlat6 = u_xlat2.x * u_xlat2.x;
					    u_xlat6 = u_xlat6 * u_xlat6;
					    u_xlat2.x = u_xlat2.x * u_xlat6;
					    u_xlat13 = u_xlat13 * u_xlat2.x + 1.0;
					    u_xlat5.x = u_xlat5.x * u_xlat13;
					    u_xlat1.x = u_xlat1.x * u_xlat5.x;
					    u_xlat5.xz = vs_TEXCOORD2.yy * unity_WorldToLight[1].xy;
					    u_xlat5.xz = unity_WorldToLight[0].xy * vs_TEXCOORD2.xx + u_xlat5.xz;
					    u_xlat5.xz = unity_WorldToLight[2].xy * vs_TEXCOORD2.zz + u_xlat5.xz;
					    u_xlat5.xz = u_xlat5.xz + unity_WorldToLight[3].xy;
					    u_xlat2 = texture(_LightTexture0, u_xlat5.xz);
					    u_xlat5.xz = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
					    u_xlat3 = texture(_ShadowMapTexture, u_xlat5.xz);
					    u_xlat5.x = u_xlat2.w * u_xlat3.x;
					    u_xlat2.xyz = u_xlat5.xxx * _LightColor0.xyz;
					    u_xlat1.xyw = u_xlat1.xxx * u_xlat2.xyz;
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = u_xlat9 * u_xlat9;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat9 * u_xlat12;
					    u_xlat12 = u_xlat12 * 0.779083729 + 0.220916301;
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyw + u_xlat2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "SHADOWS_CUBE" }
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
						mat4x4 unity_WorldToLight;
						vec4 _Color;
						float Prop;
						vec4 unused_0_6[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 _LightPositionRange;
						vec4 unused_2_2[43];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _Texture1;
					uniform  sampler2D _Texture2;
					uniform  sampler2D _LightTexture0;
					uniform  samplerCube _ShadowMapTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					float u_xlat7;
					float u_xlat12;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat16;
					float u_xlat17;
					void main()
					{
					    u_xlat0 = texture(_Texture2, vs_TEXCOORD0.zw);
					    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(Prop);
					    u_xlat1 = texture(_Texture1, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
					    u_xlat15 = (-Prop) + 1.0;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat15) + u_xlat0.xyz;
					    u_xlat15 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat15 = sqrt(u_xlat15);
					    u_xlat0.w = u_xlat15 * _LightPositionRange.w;
					    u_xlat0 = u_xlat0 * vec4(0.779083729, 0.779083729, 0.779083729, 0.970000029);
					    u_xlat1 = texture(_ShadowMapTexture, vs_TEXCOORD3.xyz);
					    u_xlatb15 = u_xlat1.x<u_xlat0.w;
					    u_xlat15 = (u_xlatb15) ? _LightShadowData.x : 1.0;
					    u_xlat1.xyz = vs_TEXCOORD2.yyy * unity_WorldToLight[1].xyz;
					    u_xlat1.xyz = unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + unity_WorldToLight[3].xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1 = texture(_LightTexture0, u_xlat1.xx);
					    u_xlat15 = u_xlat15 * u_xlat1.x;
					    u_xlat1.xyz = vec3(u_xlat15) * _LightColor0.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
					    u_xlat3.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat15 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat4.xyz = u_xlat3.xyz * vec3(u_xlat15) + u_xlat2.xyz;
					    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz;
					    u_xlat15 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat15 = max(u_xlat15, 0.00100000005);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz;
					    u_xlat15 = dot(u_xlat3.xyz, u_xlat4.xyz);
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					    u_xlat16 = dot(vec2(u_xlat15), vec2(u_xlat15));
					    u_xlat15 = (-u_xlat15) + 1.0;
					    u_xlat16 = u_xlat16 + -0.5;
					    u_xlat17 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
					    u_xlat17 = inversesqrt(u_xlat17);
					    u_xlat4.xyz = vec3(u_xlat17) * vs_TEXCOORD1.xyz;
					    u_xlat2.x = dot(u_xlat4.xyz, u_xlat2.xyz);
					    u_xlat7 = dot(u_xlat4.xyz, u_xlat3.xyz);
					    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
					    u_xlat12 = -abs(u_xlat2.x) + 1.0;
					    u_xlat2.x = abs(u_xlat2.x) + u_xlat7;
					    u_xlat2.x = u_xlat2.x + 9.99999975e-06;
					    u_xlat2.x = 0.5 / u_xlat2.x;
					    u_xlat2.x = u_xlat2.x * 0.999999881;
					    u_xlat2.x = max(u_xlat2.x, 9.99999975e-05);
					    u_xlat2.x = sqrt(u_xlat2.x);
					    u_xlat2.x = u_xlat7 * u_xlat2.x;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xxx;
					    u_xlat2.x = u_xlat12 * u_xlat12;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x;
					    u_xlat2.x = u_xlat12 * u_xlat2.x;
					    u_xlat2.x = u_xlat16 * u_xlat2.x + 1.0;
					    u_xlat12 = (-u_xlat7) + 1.0;
					    u_xlat17 = u_xlat12 * u_xlat12;
					    u_xlat17 = u_xlat17 * u_xlat17;
					    u_xlat12 = u_xlat12 * u_xlat17;
					    u_xlat16 = u_xlat16 * u_xlat12 + 1.0;
					    u_xlat16 = u_xlat2.x * u_xlat16;
					    u_xlat16 = u_xlat7 * u_xlat16;
					    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
					    u_xlat16 = u_xlat15 * u_xlat15;
					    u_xlat16 = u_xlat16 * u_xlat16;
					    u_xlat15 = u_xlat15 * u_xlat16;
					    u_xlat15 = u_xlat15 * 0.779083729 + 0.220916301;
					    u_xlat2.xyz = vec3(u_xlat15) * u_xlat3.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz + u_xlat2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
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
						mat4x4 unity_WorldToLight;
						vec4 _Color;
						float Prop;
						vec4 unused_0_6[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 _LightPositionRange;
						vec4 unused_2_2[43];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _Texture1;
					uniform  sampler2D _Texture2;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					uniform  samplerCube _ShadowMapTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					bool u_xlatb1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					float u_xlat7;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					float u_xlat17;
					void main()
					{
					    u_xlat0 = texture(_Texture2, vs_TEXCOORD0.zw);
					    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(Prop);
					    u_xlat1 = texture(_Texture1, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
					    u_xlat15 = (-Prop) + 1.0;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat15) + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.779083729, 0.779083729, 0.779083729);
					    u_xlat1.xyz = vs_TEXCOORD2.yyy * unity_WorldToLight[1].xyz;
					    u_xlat1.xyz = unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + unity_WorldToLight[3].xyz;
					    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1 = texture(_LightTexture0, u_xlat1.xyz);
					    u_xlat2 = texture(_LightTextureB0, vec2(u_xlat15));
					    u_xlat15 = u_xlat1.w * u_xlat2.x;
					    u_xlat1.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * _LightPositionRange.w;
					    u_xlat1.x = u_xlat1.x * 0.970000029;
					    u_xlat2 = texture(_ShadowMapTexture, vs_TEXCOORD3.xyz);
					    u_xlatb1 = u_xlat2.x<u_xlat1.x;
					    u_xlat1.x = (u_xlatb1) ? _LightShadowData.x : 1.0;
					    u_xlat15 = u_xlat15 * u_xlat1.x;
					    u_xlat1.xyz = vec3(u_xlat15) * _LightColor0.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
					    u_xlat3.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat15 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat4.xyz = u_xlat3.xyz * vec3(u_xlat15) + u_xlat2.xyz;
					    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz;
					    u_xlat15 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat15 = max(u_xlat15, 0.00100000005);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz;
					    u_xlat15 = dot(u_xlat3.xyz, u_xlat4.xyz);
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					    u_xlat16 = dot(vec2(u_xlat15), vec2(u_xlat15));
					    u_xlat15 = (-u_xlat15) + 1.0;
					    u_xlat16 = u_xlat16 + -0.5;
					    u_xlat17 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
					    u_xlat17 = inversesqrt(u_xlat17);
					    u_xlat4.xyz = vec3(u_xlat17) * vs_TEXCOORD1.xyz;
					    u_xlat2.x = dot(u_xlat4.xyz, u_xlat2.xyz);
					    u_xlat7 = dot(u_xlat4.xyz, u_xlat3.xyz);
					    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
					    u_xlat12 = -abs(u_xlat2.x) + 1.0;
					    u_xlat2.x = abs(u_xlat2.x) + u_xlat7;
					    u_xlat2.x = u_xlat2.x + 9.99999975e-06;
					    u_xlat2.x = 0.5 / u_xlat2.x;
					    u_xlat2.x = u_xlat2.x * 0.999999881;
					    u_xlat2.x = max(u_xlat2.x, 9.99999975e-05);
					    u_xlat2.x = sqrt(u_xlat2.x);
					    u_xlat2.x = u_xlat7 * u_xlat2.x;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xxx;
					    u_xlat2.x = u_xlat12 * u_xlat12;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x;
					    u_xlat2.x = u_xlat12 * u_xlat2.x;
					    u_xlat2.x = u_xlat16 * u_xlat2.x + 1.0;
					    u_xlat12 = (-u_xlat7) + 1.0;
					    u_xlat17 = u_xlat12 * u_xlat12;
					    u_xlat17 = u_xlat17 * u_xlat17;
					    u_xlat12 = u_xlat12 * u_xlat17;
					    u_xlat16 = u_xlat16 * u_xlat12 + 1.0;
					    u_xlat16 = u_xlat2.x * u_xlat16;
					    u_xlat16 = u_xlat7 * u_xlat16;
					    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
					    u_xlat16 = u_xlat15 * u_xlat15;
					    u_xlat16 = u_xlat16 * u_xlat16;
					    u_xlat15 = u_xlat15 * u_xlat16;
					    u_xlat15 = u_xlat15 * 0.779083729 + 0.220916301;
					    u_xlat2.xyz = vec3(u_xlat15) * u_xlat3.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz + u_xlat2.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
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
						vec4 _ShadowOffsets[4];
						vec4 unused_0_4[3];
						mat4x4 unity_WorldToLight;
						vec4 _Color;
						float Prop;
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
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _Texture1;
					uniform  sampler2D _Texture2;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					float u_xlat4;
					float u_xlat5;
					float u_xlat9;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat14;
					void main()
					{
					    u_xlat0 = vs_TEXCOORD2.yyyy * unity_WorldToLight[1];
					    u_xlat0 = unity_WorldToLight[0] * vs_TEXCOORD2.xxxx + u_xlat0;
					    u_xlat0 = unity_WorldToLight[2] * vs_TEXCOORD2.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_WorldToLight[3];
					    u_xlat1.xy = u_xlat0.xy / u_xlat0.ww;
					    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat1 = texture(_LightTexture0, u_xlat1.xy);
					    u_xlatb12 = 0.0<u_xlat0.z;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat2 = texture(_LightTextureB0, u_xlat0.xx);
					    u_xlat0.x = u_xlatb12 ? 1.0 : float(0.0);
					    u_xlat0.x = u_xlat1.w * u_xlat0.x;
					    u_xlat0.x = u_xlat2.x * u_xlat0.x;
					    u_xlat4 = (-_LightShadowData.x) + 1.0;
					    u_xlat1.xyz = vs_TEXCOORD3.xyz / vs_TEXCOORD3.www;
					    u_xlat2.xyz = u_xlat1.xyz + _ShadowOffsets[0].xyz;
					    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
					    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat3.xyz = u_xlat1.xyz + _ShadowOffsets[1].xyz;
					    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
					    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
					    u_xlat3.xyz = u_xlat1.xyz + _ShadowOffsets[2].xyz;
					    u_xlat1.xyz = u_xlat1.xyz + _ShadowOffsets[3].xyz;
					    vec3 txVec2 = vec3(u_xlat1.xy,u_xlat1.z);
					    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
					    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
					    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
					    u_xlat1 = u_xlat2 * vec4(u_xlat4) + _LightShadowData.xxxx;
					    u_xlat4 = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
					    u_xlat0.x = u_xlat4 * u_xlat0.x;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
					    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat1.xyz;
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat12 = max(u_xlat12, 0.00100000005);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat3.xyz);
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    u_xlat1.w = dot(vec2(u_xlat12), vec2(u_xlat12));
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat14 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
					    u_xlat14 = inversesqrt(u_xlat14);
					    u_xlat3.xyz = vec3(u_xlat14) * vs_TEXCOORD1.xyz;
					    u_xlat1.x = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat5 = dot(u_xlat3.xyz, u_xlat2.xyz);
					    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
					    u_xlat9 = -abs(u_xlat1.x) + 1.0;
					    u_xlat1.x = abs(u_xlat1.x) + u_xlat5;
					    u_xlat1.xw = u_xlat1.xw + vec2(9.99999975e-06, -0.5);
					    u_xlat1.x = 0.5 / u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * 0.999999881;
					    u_xlat1.x = max(u_xlat1.x, 9.99999975e-05);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat5 * u_xlat1.x;
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat1.x = u_xlat9 * u_xlat9;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat9 * u_xlat1.x;
					    u_xlat1.x = u_xlat1.w * u_xlat1.x + 1.0;
					    u_xlat9 = (-u_xlat5) + 1.0;
					    u_xlat14 = u_xlat9 * u_xlat9;
					    u_xlat14 = u_xlat14 * u_xlat14;
					    u_xlat9 = u_xlat9 * u_xlat14;
					    u_xlat9 = u_xlat1.w * u_xlat9 + 1.0;
					    u_xlat1.x = u_xlat1.x * u_xlat9;
					    u_xlat1.x = u_xlat5 * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat1.x = u_xlat12 * u_xlat12;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat12 = u_xlat12 * u_xlat1.x;
					    u_xlat12 = u_xlat12 * 0.779083729 + 0.220916301;
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat2 = texture(_Texture2, vs_TEXCOORD0.zw);
					    u_xlat2.xyz = u_xlat2.xyz * _Color.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(Prop);
					    u_xlat3 = texture(_Texture1, vs_TEXCOORD0.xy);
					    u_xlat3.xyz = u_xlat3.xyz * _Color.xyz;
					    u_xlat12 = (-Prop) + 1.0;
					    u_xlat2.xyz = u_xlat3.xyz * vec3(u_xlat12) + u_xlat2.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.779083729, 0.779083729, 0.779083729);
					    SV_Target0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat1.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
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
						mat4x4 unity_WorldToLight;
						vec4 _Color;
						float Prop;
						vec4 unused_0_6[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 _LightPositionRange;
						vec4 unused_2_2[43];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _Texture1;
					uniform  sampler2D _Texture2;
					uniform  sampler2D _LightTexture0;
					uniform  samplerCube _ShadowMapTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bvec4 u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					float u_xlat5;
					float u_xlat9;
					float u_xlat12;
					float u_xlat14;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _LightPositionRange.w;
					    u_xlat0.x = u_xlat0.x * 0.970000029;
					    u_xlat4.xyz = vs_TEXCOORD3.xyz + vec3(0.0078125, 0.0078125, 0.0078125);
					    u_xlat1 = texture(_ShadowMapTexture, u_xlat4.xyz);
					    u_xlat4.xyz = vs_TEXCOORD3.xyz + vec3(-0.0078125, -0.0078125, 0.0078125);
					    u_xlat2 = texture(_ShadowMapTexture, u_xlat4.xyz);
					    u_xlat1.y = u_xlat2.x;
					    u_xlat4.xyz = vs_TEXCOORD3.xyz + vec3(-0.0078125, 0.0078125, -0.0078125);
					    u_xlat2 = texture(_ShadowMapTexture, u_xlat4.xyz);
					    u_xlat1.z = u_xlat2.x;
					    u_xlat4.xyz = vs_TEXCOORD3.xyz + vec3(0.0078125, -0.0078125, -0.0078125);
					    u_xlat2 = texture(_ShadowMapTexture, u_xlat4.xyz);
					    u_xlat1.w = u_xlat2.x;
					    u_xlatb0 = lessThan(u_xlat1, u_xlat0.xxxx);
					    u_xlat0.x = (u_xlatb0.x) ? _LightShadowData.x : float(1.0);
					    u_xlat0.y = (u_xlatb0.y) ? _LightShadowData.x : float(1.0);
					    u_xlat0.z = (u_xlatb0.z) ? _LightShadowData.x : float(1.0);
					    u_xlat0.w = (u_xlatb0.w) ? _LightShadowData.x : float(1.0);
					    u_xlat0.x = dot(u_xlat0, vec4(0.25, 0.25, 0.25, 0.25));
					    u_xlat4.xyz = vs_TEXCOORD2.yyy * unity_WorldToLight[1].xyz;
					    u_xlat4.xyz = unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat4.xyz;
					    u_xlat4.xyz = unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + unity_WorldToLight[3].xyz;
					    u_xlat4.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat1 = texture(_LightTexture0, u_xlat4.xx);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
					    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat1.xyz;
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat12 = max(u_xlat12, 0.00100000005);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat3.xyz);
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    u_xlat1.w = dot(vec2(u_xlat12), vec2(u_xlat12));
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat14 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
					    u_xlat14 = inversesqrt(u_xlat14);
					    u_xlat3.xyz = vec3(u_xlat14) * vs_TEXCOORD1.xyz;
					    u_xlat1.x = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat5 = dot(u_xlat3.xyz, u_xlat2.xyz);
					    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
					    u_xlat9 = -abs(u_xlat1.x) + 1.0;
					    u_xlat1.x = abs(u_xlat1.x) + u_xlat5;
					    u_xlat1.xw = u_xlat1.xw + vec2(9.99999975e-06, -0.5);
					    u_xlat1.x = 0.5 / u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * 0.999999881;
					    u_xlat1.x = max(u_xlat1.x, 9.99999975e-05);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat5 * u_xlat1.x;
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat1.x = u_xlat9 * u_xlat9;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat9 * u_xlat1.x;
					    u_xlat1.x = u_xlat1.w * u_xlat1.x + 1.0;
					    u_xlat9 = (-u_xlat5) + 1.0;
					    u_xlat14 = u_xlat9 * u_xlat9;
					    u_xlat14 = u_xlat14 * u_xlat14;
					    u_xlat9 = u_xlat9 * u_xlat14;
					    u_xlat9 = u_xlat1.w * u_xlat9 + 1.0;
					    u_xlat1.x = u_xlat1.x * u_xlat9;
					    u_xlat1.x = u_xlat5 * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat1.x = u_xlat12 * u_xlat12;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat12 = u_xlat12 * u_xlat1.x;
					    u_xlat12 = u_xlat12 * 0.779083729 + 0.220916301;
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat2 = texture(_Texture2, vs_TEXCOORD0.zw);
					    u_xlat2.xyz = u_xlat2.xyz * _Color.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(Prop);
					    u_xlat3 = texture(_Texture1, vs_TEXCOORD0.xy);
					    u_xlat3.xyz = u_xlat3.xyz * _Color.xyz;
					    u_xlat12 = (-Prop) + 1.0;
					    u_xlat2.xyz = u_xlat3.xyz * vec3(u_xlat12) + u_xlat2.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.779083729, 0.779083729, 0.779083729);
					    SV_Target0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat1.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
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
						mat4x4 unity_WorldToLight;
						vec4 _Color;
						float Prop;
						vec4 unused_0_6[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 _LightPositionRange;
						vec4 unused_2_2[43];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					uniform  sampler2D _Texture1;
					uniform  sampler2D _Texture2;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					uniform  samplerCube _ShadowMapTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bvec4 u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					float u_xlat5;
					float u_xlat9;
					float u_xlat12;
					float u_xlat14;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _LightPositionRange.w;
					    u_xlat0.x = u_xlat0.x * 0.970000029;
					    u_xlat4.xyz = vs_TEXCOORD3.xyz + vec3(0.0078125, 0.0078125, 0.0078125);
					    u_xlat1 = texture(_ShadowMapTexture, u_xlat4.xyz);
					    u_xlat4.xyz = vs_TEXCOORD3.xyz + vec3(-0.0078125, -0.0078125, 0.0078125);
					    u_xlat2 = texture(_ShadowMapTexture, u_xlat4.xyz);
					    u_xlat1.y = u_xlat2.x;
					    u_xlat4.xyz = vs_TEXCOORD3.xyz + vec3(-0.0078125, 0.0078125, -0.0078125);
					    u_xlat2 = texture(_ShadowMapTexture, u_xlat4.xyz);
					    u_xlat1.z = u_xlat2.x;
					    u_xlat4.xyz = vs_TEXCOORD3.xyz + vec3(0.0078125, -0.0078125, -0.0078125);
					    u_xlat2 = texture(_ShadowMapTexture, u_xlat4.xyz);
					    u_xlat1.w = u_xlat2.x;
					    u_xlatb0 = lessThan(u_xlat1, u_xlat0.xxxx);
					    u_xlat0.x = (u_xlatb0.x) ? _LightShadowData.x : float(1.0);
					    u_xlat0.y = (u_xlatb0.y) ? _LightShadowData.x : float(1.0);
					    u_xlat0.z = (u_xlatb0.z) ? _LightShadowData.x : float(1.0);
					    u_xlat0.w = (u_xlatb0.w) ? _LightShadowData.x : float(1.0);
					    u_xlat0.x = dot(u_xlat0, vec4(0.25, 0.25, 0.25, 0.25));
					    u_xlat4.xyz = vs_TEXCOORD2.yyy * unity_WorldToLight[1].xyz;
					    u_xlat4.xyz = unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat4.xyz;
					    u_xlat4.xyz = unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + unity_WorldToLight[3].xyz;
					    u_xlat1.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat2 = texture(_LightTexture0, u_xlat4.xyz);
					    u_xlat1 = texture(_LightTextureB0, u_xlat1.xx);
					    u_xlat4.x = u_xlat2.w * u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * u_xlat4.x;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
					    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat1.xyz;
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat12 = max(u_xlat12, 0.00100000005);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat3.xyz);
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    u_xlat1.w = dot(vec2(u_xlat12), vec2(u_xlat12));
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat14 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
					    u_xlat14 = inversesqrt(u_xlat14);
					    u_xlat3.xyz = vec3(u_xlat14) * vs_TEXCOORD1.xyz;
					    u_xlat1.x = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat5 = dot(u_xlat3.xyz, u_xlat2.xyz);
					    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
					    u_xlat9 = -abs(u_xlat1.x) + 1.0;
					    u_xlat1.x = abs(u_xlat1.x) + u_xlat5;
					    u_xlat1.xw = u_xlat1.xw + vec2(9.99999975e-06, -0.5);
					    u_xlat1.x = 0.5 / u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * 0.999999881;
					    u_xlat1.x = max(u_xlat1.x, 9.99999975e-05);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat5 * u_xlat1.x;
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat1.x = u_xlat9 * u_xlat9;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat9 * u_xlat1.x;
					    u_xlat1.x = u_xlat1.w * u_xlat1.x + 1.0;
					    u_xlat9 = (-u_xlat5) + 1.0;
					    u_xlat14 = u_xlat9 * u_xlat9;
					    u_xlat14 = u_xlat14 * u_xlat14;
					    u_xlat9 = u_xlat9 * u_xlat14;
					    u_xlat9 = u_xlat1.w * u_xlat9 + 1.0;
					    u_xlat1.x = u_xlat1.x * u_xlat9;
					    u_xlat1.x = u_xlat5 * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat1.x = u_xlat12 * u_xlat12;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat12 = u_xlat12 * u_xlat1.x;
					    u_xlat12 = u_xlat12 * 0.779083729 + 0.220916301;
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat2 = texture(_Texture2, vs_TEXCOORD0.zw);
					    u_xlat2.xyz = u_xlat2.xyz * _Color.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(Prop);
					    u_xlat3 = texture(_Texture1, vs_TEXCOORD0.xy);
					    u_xlat3.xyz = u_xlat3.xyz * _Color.xyz;
					    u_xlat12 = (-Prop) + 1.0;
					    u_xlat2.xyz = u_xlat3.xyz * vec3(u_xlat12) + u_xlat2.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.779083729, 0.779083729, 0.779083729);
					    SV_Target0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat1.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "FOG_LINEAR" }
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
						mat4x4 unity_WorldToLight;
						vec4 _Color;
						float Prop;
						vec4 unused_0_6[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 unused_1_3[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[44];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_3_0;
						vec4 unity_FogParams;
					};
					uniform  sampler2D _Texture1;
					uniform  sampler2D _Texture2;
					uniform  sampler2D _LightTexture0;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  float vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat5;
					float u_xlat6;
					float u_xlat9;
					float u_xlat12;
					float u_xlat13;
					float u_xlat14;
					void main()
					{
					    u_xlat0 = texture(_Texture2, vs_TEXCOORD0.zw);
					    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(Prop);
					    u_xlat1 = texture(_Texture1, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
					    u_xlat12 = (-Prop) + 1.0;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat12) + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.779083729, 0.779083729, 0.779083729);
					    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat1.xyz;
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat12 = max(u_xlat12, 0.00100000005);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat3.xyz);
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    u_xlat1.w = dot(vec2(u_xlat12), vec2(u_xlat12));
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat14 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
					    u_xlat14 = inversesqrt(u_xlat14);
					    u_xlat3.xyz = vec3(u_xlat14) * vs_TEXCOORD1.xyz;
					    u_xlat1.x = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat5.x = dot(u_xlat3.xyz, u_xlat2.xyz);
					    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
					    u_xlat9 = -abs(u_xlat1.x) + 1.0;
					    u_xlat1.x = abs(u_xlat1.x) + u_xlat5.x;
					    u_xlat1.xw = u_xlat1.xw + vec2(9.99999975e-06, -0.5);
					    u_xlat1.x = 0.5 / u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * 0.999999881;
					    u_xlat1.x = max(u_xlat1.x, 9.99999975e-05);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat5.x * u_xlat1.x;
					    u_xlat2.x = u_xlat9 * u_xlat9;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x;
					    u_xlat9 = u_xlat9 * u_xlat2.x;
					    u_xlat9 = u_xlat1.w * u_xlat9 + 1.0;
					    u_xlat2.x = (-u_xlat5.x) + 1.0;
					    u_xlat6 = u_xlat2.x * u_xlat2.x;
					    u_xlat6 = u_xlat6 * u_xlat6;
					    u_xlat2.x = u_xlat2.x * u_xlat6;
					    u_xlat13 = u_xlat1.w * u_xlat2.x + 1.0;
					    u_xlat9 = u_xlat9 * u_xlat13;
					    u_xlat5.x = u_xlat5.x * u_xlat9;
					    u_xlat2.xyz = vs_TEXCOORD2.yyy * unity_WorldToLight[1].xyz;
					    u_xlat2.xyz = unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
					    u_xlat2.xyz = u_xlat2.xyz + unity_WorldToLight[3].xyz;
					    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat2 = texture(_LightTexture0, vec2(u_xlat9));
					    u_xlat2.xyz = u_xlat2.xxx * _LightColor0.xyz;
					    u_xlat5.xyz = u_xlat5.xxx * u_xlat2.xyz;
					    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
					    u_xlat1.x = u_xlat12 * u_xlat12;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat12 = u_xlat12 * u_xlat1.x;
					    u_xlat12 = u_xlat12 * 0.779083729 + 0.220916301;
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat2.xyz;
					    u_xlat12 = vs_TEXCOORD4 / _ProjectionParams.y;
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat12 = u_xlat12 * _ProjectionParams.z;
					    u_xlat12 = max(u_xlat12, 0.0);
					    u_xlat12 = u_xlat12 * unity_FogParams.z + unity_FogParams.w;
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat12);
					    SV_Target0.w = 1.0;
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
						float Prop;
						vec4 unused_0_5[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 unused_1_3[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[44];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_3_0;
						vec4 unity_FogParams;
					};
					uniform  sampler2D _Texture1;
					uniform  sampler2D _Texture2;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  float vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat5;
					float u_xlat9;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = texture(_Texture2, vs_TEXCOORD0.zw);
					    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(Prop);
					    u_xlat1 = texture(_Texture1, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
					    u_xlat12 = (-Prop) + 1.0;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat12) + u_xlat0.xyz;
					    u_xlat12 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * vs_TEXCOORD1.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat12) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat3.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat5.x = -abs(u_xlat12) + 1.0;
					    u_xlat12 = abs(u_xlat12) + u_xlat1.x;
					    u_xlat12 = u_xlat12 + 9.99999975e-06;
					    u_xlat0.w = 0.5 / u_xlat12;
					    u_xlat0 = u_xlat0 * vec4(0.779083729, 0.779083729, 0.779083729, 0.999999881);
					    u_xlat12 = max(u_xlat0.w, 9.99999975e-05);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat1.x * u_xlat12;
					    u_xlat3.xyz = vec3(u_xlat12) * _LightColor0.xyz;
					    u_xlat12 = u_xlat5.x * u_xlat5.x;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat5.x * u_xlat12;
					    u_xlat5.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat5.x = max(u_xlat5.x, 0.00100000005);
					    u_xlat5.x = inversesqrt(u_xlat5.x);
					    u_xlat5.xyz = u_xlat5.xxx * u_xlat2.xyz;
					    u_xlat1.y = dot(_WorldSpaceLightPos0.xyz, u_xlat5.xyz);
					    u_xlat1.y = clamp(u_xlat1.y, 0.0, 1.0);
					    u_xlat9 = dot(u_xlat1.yy, u_xlat1.yy);
					    u_xlat9 = u_xlat9 + -0.5;
					    u_xlat12 = u_xlat9 * u_xlat12 + 1.0;
					    u_xlat5.xz = (-u_xlat1.yx) + vec2(1.0, 1.0);
					    u_xlat2.x = u_xlat5.z * u_xlat5.z;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x;
					    u_xlat13 = u_xlat5.z * u_xlat2.x;
					    u_xlat9 = u_xlat9 * u_xlat13 + 1.0;
					    u_xlat12 = u_xlat12 * u_xlat9;
					    u_xlat12 = u_xlat1.x * u_xlat12;
					    u_xlat1.xzw = vec3(u_xlat12) * _LightColor0.xyz;
					    u_xlat12 = u_xlat5.x * u_xlat5.x;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat5.x * u_xlat12;
					    u_xlat12 = u_xlat12 * 0.779083729 + 0.220916301;
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xzw + u_xlat2.xyz;
					    u_xlat12 = vs_TEXCOORD4 / _ProjectionParams.y;
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat12 = u_xlat12 * _ProjectionParams.z;
					    u_xlat12 = max(u_xlat12, 0.0);
					    u_xlat12 = u_xlat12 * unity_FogParams.z + unity_FogParams.w;
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat12);
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "FOG_LINEAR" }
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
						mat4x4 unity_WorldToLight;
						vec4 _Color;
						float Prop;
						vec4 unused_0_6[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 unused_1_3[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[44];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_3_0;
						vec4 unity_FogParams;
					};
					uniform  sampler2D _Texture1;
					uniform  sampler2D _Texture2;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  float vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					float u_xlat7;
					float u_xlat12;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat16;
					float u_xlat17;
					void main()
					{
					    u_xlat0 = texture(_Texture2, vs_TEXCOORD0.zw);
					    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(Prop);
					    u_xlat1 = texture(_Texture1, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
					    u_xlat15 = (-Prop) + 1.0;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat15) + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.779083729, 0.779083729, 0.779083729);
					    u_xlat1 = vs_TEXCOORD2.yyyy * unity_WorldToLight[1];
					    u_xlat1 = unity_WorldToLight[0] * vs_TEXCOORD2.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToLight[2] * vs_TEXCOORD2.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_WorldToLight[3];
					    u_xlat2.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat2 = texture(_LightTexture0, u_xlat2.xy);
					    u_xlatb15 = 0.0<u_xlat1.z;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1 = texture(_LightTextureB0, u_xlat1.xx);
					    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
					    u_xlat15 = u_xlat2.w * u_xlat15;
					    u_xlat15 = u_xlat1.x * u_xlat15;
					    u_xlat1.xyz = vec3(u_xlat15) * _LightColor0.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
					    u_xlat3.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat15 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat4.xyz = u_xlat3.xyz * vec3(u_xlat15) + u_xlat2.xyz;
					    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz;
					    u_xlat15 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat15 = max(u_xlat15, 0.00100000005);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz;
					    u_xlat15 = dot(u_xlat3.xyz, u_xlat4.xyz);
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					    u_xlat16 = dot(vec2(u_xlat15), vec2(u_xlat15));
					    u_xlat15 = (-u_xlat15) + 1.0;
					    u_xlat16 = u_xlat16 + -0.5;
					    u_xlat17 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
					    u_xlat17 = inversesqrt(u_xlat17);
					    u_xlat4.xyz = vec3(u_xlat17) * vs_TEXCOORD1.xyz;
					    u_xlat2.x = dot(u_xlat4.xyz, u_xlat2.xyz);
					    u_xlat7 = dot(u_xlat4.xyz, u_xlat3.xyz);
					    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
					    u_xlat12 = -abs(u_xlat2.x) + 1.0;
					    u_xlat2.x = abs(u_xlat2.x) + u_xlat7;
					    u_xlat2.x = u_xlat2.x + 9.99999975e-06;
					    u_xlat2.x = 0.5 / u_xlat2.x;
					    u_xlat2.x = u_xlat2.x * 0.999999881;
					    u_xlat2.x = max(u_xlat2.x, 9.99999975e-05);
					    u_xlat2.x = sqrt(u_xlat2.x);
					    u_xlat2.x = u_xlat7 * u_xlat2.x;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xxx;
					    u_xlat2.x = u_xlat12 * u_xlat12;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x;
					    u_xlat2.x = u_xlat12 * u_xlat2.x;
					    u_xlat2.x = u_xlat16 * u_xlat2.x + 1.0;
					    u_xlat12 = (-u_xlat7) + 1.0;
					    u_xlat17 = u_xlat12 * u_xlat12;
					    u_xlat17 = u_xlat17 * u_xlat17;
					    u_xlat12 = u_xlat12 * u_xlat17;
					    u_xlat16 = u_xlat16 * u_xlat12 + 1.0;
					    u_xlat16 = u_xlat2.x * u_xlat16;
					    u_xlat16 = u_xlat7 * u_xlat16;
					    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
					    u_xlat16 = u_xlat15 * u_xlat15;
					    u_xlat16 = u_xlat16 * u_xlat16;
					    u_xlat15 = u_xlat15 * u_xlat16;
					    u_xlat15 = u_xlat15 * 0.779083729 + 0.220916301;
					    u_xlat2.xyz = vec3(u_xlat15) * u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat15 = vs_TEXCOORD4 / _ProjectionParams.y;
					    u_xlat15 = (-u_xlat15) + 1.0;
					    u_xlat15 = u_xlat15 * _ProjectionParams.z;
					    u_xlat15 = max(u_xlat15, 0.0);
					    u_xlat15 = u_xlat15 * unity_FogParams.z + unity_FogParams.w;
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat15);
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "FOG_LINEAR" }
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
						mat4x4 unity_WorldToLight;
						vec4 _Color;
						float Prop;
						vec4 unused_0_6[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 unused_1_3[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[44];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_3_0;
						vec4 unity_FogParams;
					};
					uniform  sampler2D _Texture1;
					uniform  sampler2D _Texture2;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  float vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat5;
					float u_xlat6;
					float u_xlat9;
					float u_xlat12;
					float u_xlat13;
					float u_xlat14;
					void main()
					{
					    u_xlat0 = texture(_Texture2, vs_TEXCOORD0.zw);
					    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(Prop);
					    u_xlat1 = texture(_Texture1, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
					    u_xlat12 = (-Prop) + 1.0;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat12) + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.779083729, 0.779083729, 0.779083729);
					    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat1.xyz;
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat12 = max(u_xlat12, 0.00100000005);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat3.xyz);
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    u_xlat1.w = dot(vec2(u_xlat12), vec2(u_xlat12));
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat14 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
					    u_xlat14 = inversesqrt(u_xlat14);
					    u_xlat3.xyz = vec3(u_xlat14) * vs_TEXCOORD1.xyz;
					    u_xlat1.x = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat5.x = dot(u_xlat3.xyz, u_xlat2.xyz);
					    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
					    u_xlat9 = -abs(u_xlat1.x) + 1.0;
					    u_xlat1.x = abs(u_xlat1.x) + u_xlat5.x;
					    u_xlat1.xw = u_xlat1.xw + vec2(9.99999975e-06, -0.5);
					    u_xlat1.x = 0.5 / u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * 0.999999881;
					    u_xlat1.x = max(u_xlat1.x, 9.99999975e-05);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat5.x * u_xlat1.x;
					    u_xlat2.x = u_xlat9 * u_xlat9;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x;
					    u_xlat9 = u_xlat9 * u_xlat2.x;
					    u_xlat9 = u_xlat1.w * u_xlat9 + 1.0;
					    u_xlat2.x = (-u_xlat5.x) + 1.0;
					    u_xlat6 = u_xlat2.x * u_xlat2.x;
					    u_xlat6 = u_xlat6 * u_xlat6;
					    u_xlat2.x = u_xlat2.x * u_xlat6;
					    u_xlat13 = u_xlat1.w * u_xlat2.x + 1.0;
					    u_xlat9 = u_xlat9 * u_xlat13;
					    u_xlat5.x = u_xlat5.x * u_xlat9;
					    u_xlat2.xyz = vs_TEXCOORD2.yyy * unity_WorldToLight[1].xyz;
					    u_xlat2.xyz = unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
					    u_xlat2.xyz = u_xlat2.xyz + unity_WorldToLight[3].xyz;
					    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat2 = texture(_LightTexture0, u_xlat2.xyz);
					    u_xlat3 = texture(_LightTextureB0, vec2(u_xlat9));
					    u_xlat9 = u_xlat2.w * u_xlat3.x;
					    u_xlat2.xyz = vec3(u_xlat9) * _LightColor0.xyz;
					    u_xlat5.xyz = u_xlat5.xxx * u_xlat2.xyz;
					    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
					    u_xlat1.x = u_xlat12 * u_xlat12;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat12 = u_xlat12 * u_xlat1.x;
					    u_xlat12 = u_xlat12 * 0.779083729 + 0.220916301;
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat2.xyz;
					    u_xlat12 = vs_TEXCOORD4 / _ProjectionParams.y;
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat12 = u_xlat12 * _ProjectionParams.z;
					    u_xlat12 = max(u_xlat12, 0.0);
					    u_xlat12 = u_xlat12 * unity_FogParams.z + unity_FogParams.w;
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat12);
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" }
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
						mat4x4 unity_WorldToLight;
						vec4 _Color;
						float Prop;
						vec4 unused_0_6[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 unused_1_3[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[44];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_3_0;
						vec4 unity_FogParams;
					};
					uniform  sampler2D _Texture1;
					uniform  sampler2D _Texture2;
					uniform  sampler2D _LightTexture0;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  float vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat5;
					float u_xlat6;
					float u_xlat9;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = texture(_Texture2, vs_TEXCOORD0.zw);
					    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(Prop);
					    u_xlat1 = texture(_Texture1, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
					    u_xlat12 = (-Prop) + 1.0;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat12) + u_xlat0.xyz;
					    u_xlat12 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * vs_TEXCOORD1.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat12) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat3.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat5.x = -abs(u_xlat12) + 1.0;
					    u_xlat12 = abs(u_xlat12) + u_xlat1.x;
					    u_xlat12 = u_xlat12 + 9.99999975e-06;
					    u_xlat0.w = 0.5 / u_xlat12;
					    u_xlat0 = u_xlat0 * vec4(0.779083729, 0.779083729, 0.779083729, 0.999999881);
					    u_xlat12 = max(u_xlat0.w, 9.99999975e-05);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat1.x * u_xlat12;
					    u_xlat9 = u_xlat5.x * u_xlat5.x;
					    u_xlat9 = u_xlat9 * u_xlat9;
					    u_xlat5.x = u_xlat5.x * u_xlat9;
					    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat9 = max(u_xlat9, 0.00100000005);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
					    u_xlat9 = dot(_WorldSpaceLightPos0.xyz, u_xlat2.xyz);
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat13 = dot(vec2(u_xlat9), vec2(u_xlat9));
					    u_xlat9 = (-u_xlat9) + 1.0;
					    u_xlat13 = u_xlat13 + -0.5;
					    u_xlat5.x = u_xlat13 * u_xlat5.x + 1.0;
					    u_xlat2.x = (-u_xlat1.x) + 1.0;
					    u_xlat6 = u_xlat2.x * u_xlat2.x;
					    u_xlat6 = u_xlat6 * u_xlat6;
					    u_xlat2.x = u_xlat2.x * u_xlat6;
					    u_xlat13 = u_xlat13 * u_xlat2.x + 1.0;
					    u_xlat5.x = u_xlat5.x * u_xlat13;
					    u_xlat1.x = u_xlat1.x * u_xlat5.x;
					    u_xlat5.xz = vs_TEXCOORD2.yy * unity_WorldToLight[1].xy;
					    u_xlat5.xz = unity_WorldToLight[0].xy * vs_TEXCOORD2.xx + u_xlat5.xz;
					    u_xlat5.xz = unity_WorldToLight[2].xy * vs_TEXCOORD2.zz + u_xlat5.xz;
					    u_xlat5.xz = u_xlat5.xz + unity_WorldToLight[3].xy;
					    u_xlat2 = texture(_LightTexture0, u_xlat5.xz);
					    u_xlat2.xyz = u_xlat2.www * _LightColor0.xyz;
					    u_xlat1.xyw = u_xlat1.xxx * u_xlat2.xyz;
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = u_xlat9 * u_xlat9;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat9 * u_xlat12;
					    u_xlat12 = u_xlat12 * 0.779083729 + 0.220916301;
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyw + u_xlat2.xyz;
					    u_xlat12 = vs_TEXCOORD4 / _ProjectionParams.y;
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat12 = u_xlat12 * _ProjectionParams.z;
					    u_xlat12 = max(u_xlat12, 0.0);
					    u_xlat12 = u_xlat12 * unity_FogParams.z + unity_FogParams.w;
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat12);
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "SHADOWS_DEPTH" "FOG_LINEAR" }
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
						mat4x4 unity_WorldToLight;
						vec4 _Color;
						float Prop;
						vec4 unused_0_6[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 unused_1_3[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[44];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					layout(std140) uniform UnityFog {
						vec4 unused_4_0;
						vec4 unity_FogParams;
					};
					uniform  sampler2D _Texture1;
					uniform  sampler2D _Texture2;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  float vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					float u_xlat6;
					float u_xlat7;
					float u_xlat12;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat16;
					float u_xlat17;
					void main()
					{
					    u_xlat0 = texture(_Texture2, vs_TEXCOORD0.zw);
					    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(Prop);
					    u_xlat1 = texture(_Texture1, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
					    u_xlat15 = (-Prop) + 1.0;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat15) + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.779083729, 0.779083729, 0.779083729);
					    u_xlat1 = vs_TEXCOORD2.yyyy * unity_WorldToLight[1];
					    u_xlat1 = unity_WorldToLight[0] * vs_TEXCOORD2.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToLight[2] * vs_TEXCOORD2.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_WorldToLight[3];
					    u_xlat2.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat2 = texture(_LightTexture0, u_xlat2.xy);
					    u_xlatb15 = 0.0<u_xlat1.z;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1 = texture(_LightTextureB0, u_xlat1.xx);
					    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
					    u_xlat15 = u_xlat2.w * u_xlat15;
					    u_xlat15 = u_xlat1.x * u_xlat15;
					    u_xlat1.xyz = vs_TEXCOORD3.xyz / vs_TEXCOORD3.www;
					    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
					    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat6 = (-_LightShadowData.x) + 1.0;
					    u_xlat1.x = u_xlat1.x * u_xlat6 + _LightShadowData.x;
					    u_xlat15 = u_xlat15 * u_xlat1.x;
					    u_xlat1.xyz = vec3(u_xlat15) * _LightColor0.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
					    u_xlat3.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat15 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat4.xyz = u_xlat3.xyz * vec3(u_xlat15) + u_xlat2.xyz;
					    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz;
					    u_xlat15 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat15 = max(u_xlat15, 0.00100000005);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz;
					    u_xlat15 = dot(u_xlat3.xyz, u_xlat4.xyz);
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					    u_xlat16 = dot(vec2(u_xlat15), vec2(u_xlat15));
					    u_xlat15 = (-u_xlat15) + 1.0;
					    u_xlat16 = u_xlat16 + -0.5;
					    u_xlat17 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
					    u_xlat17 = inversesqrt(u_xlat17);
					    u_xlat4.xyz = vec3(u_xlat17) * vs_TEXCOORD1.xyz;
					    u_xlat2.x = dot(u_xlat4.xyz, u_xlat2.xyz);
					    u_xlat7 = dot(u_xlat4.xyz, u_xlat3.xyz);
					    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
					    u_xlat12 = -abs(u_xlat2.x) + 1.0;
					    u_xlat2.x = abs(u_xlat2.x) + u_xlat7;
					    u_xlat2.x = u_xlat2.x + 9.99999975e-06;
					    u_xlat2.x = 0.5 / u_xlat2.x;
					    u_xlat2.x = u_xlat2.x * 0.999999881;
					    u_xlat2.x = max(u_xlat2.x, 9.99999975e-05);
					    u_xlat2.x = sqrt(u_xlat2.x);
					    u_xlat2.x = u_xlat7 * u_xlat2.x;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xxx;
					    u_xlat2.x = u_xlat12 * u_xlat12;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x;
					    u_xlat2.x = u_xlat12 * u_xlat2.x;
					    u_xlat2.x = u_xlat16 * u_xlat2.x + 1.0;
					    u_xlat12 = (-u_xlat7) + 1.0;
					    u_xlat17 = u_xlat12 * u_xlat12;
					    u_xlat17 = u_xlat17 * u_xlat17;
					    u_xlat12 = u_xlat12 * u_xlat17;
					    u_xlat16 = u_xlat16 * u_xlat12 + 1.0;
					    u_xlat16 = u_xlat2.x * u_xlat16;
					    u_xlat16 = u_xlat7 * u_xlat16;
					    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
					    u_xlat16 = u_xlat15 * u_xlat15;
					    u_xlat16 = u_xlat16 * u_xlat16;
					    u_xlat15 = u_xlat15 * u_xlat16;
					    u_xlat15 = u_xlat15 * 0.779083729 + 0.220916301;
					    u_xlat2.xyz = vec3(u_xlat15) * u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat15 = vs_TEXCOORD4 / _ProjectionParams.y;
					    u_xlat15 = (-u_xlat15) + 1.0;
					    u_xlat15 = u_xlat15 * _ProjectionParams.z;
					    u_xlat15 = max(u_xlat15, 0.0);
					    u_xlat15 = u_xlat15 * unity_FogParams.z + unity_FogParams.w;
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat15);
					    SV_Target0.w = 1.0;
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
						float Prop;
						vec4 unused_0_5[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 unused_1_3[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[44];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_3_0;
						vec4 unity_FogParams;
					};
					uniform  sampler2D _Texture1;
					uniform  sampler2D _Texture2;
					uniform  sampler2D _ShadowMapTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  float vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat5;
					float u_xlat6;
					float u_xlat9;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = texture(_Texture2, vs_TEXCOORD0.zw);
					    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(Prop);
					    u_xlat1 = texture(_Texture1, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
					    u_xlat12 = (-Prop) + 1.0;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat12) + u_xlat0.xyz;
					    u_xlat12 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * vs_TEXCOORD1.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat12) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat3.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat5.x = -abs(u_xlat12) + 1.0;
					    u_xlat12 = abs(u_xlat12) + u_xlat1.x;
					    u_xlat12 = u_xlat12 + 9.99999975e-06;
					    u_xlat0.w = 0.5 / u_xlat12;
					    u_xlat0 = u_xlat0 * vec4(0.779083729, 0.779083729, 0.779083729, 0.999999881);
					    u_xlat12 = max(u_xlat0.w, 9.99999975e-05);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat1.x * u_xlat12;
					    u_xlat9 = u_xlat5.x * u_xlat5.x;
					    u_xlat9 = u_xlat9 * u_xlat9;
					    u_xlat5.x = u_xlat5.x * u_xlat9;
					    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat9 = max(u_xlat9, 0.00100000005);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
					    u_xlat9 = dot(_WorldSpaceLightPos0.xyz, u_xlat2.xyz);
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat13 = dot(vec2(u_xlat9), vec2(u_xlat9));
					    u_xlat9 = (-u_xlat9) + 1.0;
					    u_xlat13 = u_xlat13 + -0.5;
					    u_xlat5.x = u_xlat13 * u_xlat5.x + 1.0;
					    u_xlat2.x = (-u_xlat1.x) + 1.0;
					    u_xlat6 = u_xlat2.x * u_xlat2.x;
					    u_xlat6 = u_xlat6 * u_xlat6;
					    u_xlat2.x = u_xlat2.x * u_xlat6;
					    u_xlat13 = u_xlat13 * u_xlat2.x + 1.0;
					    u_xlat5.x = u_xlat5.x * u_xlat13;
					    u_xlat1.x = u_xlat1.x * u_xlat5.x;
					    u_xlat5.xz = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
					    u_xlat2 = texture(_ShadowMapTexture, u_xlat5.xz);
					    u_xlat2.xyz = u_xlat2.xxx * _LightColor0.xyz;
					    u_xlat1.xyw = u_xlat1.xxx * u_xlat2.xyz;
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = u_xlat9 * u_xlat9;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat9 * u_xlat12;
					    u_xlat12 = u_xlat12 * 0.779083729 + 0.220916301;
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyw + u_xlat2.xyz;
					    u_xlat12 = vs_TEXCOORD4 / _ProjectionParams.y;
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat12 = u_xlat12 * _ProjectionParams.z;
					    u_xlat12 = max(u_xlat12, 0.0);
					    u_xlat12 = u_xlat12 * unity_FogParams.z + unity_FogParams.w;
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat12);
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "FOG_LINEAR" }
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
						mat4x4 unity_WorldToLight;
						vec4 _Color;
						float Prop;
						vec4 unused_0_6[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 unused_1_3[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[44];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_3_0;
						vec4 unity_FogParams;
					};
					uniform  sampler2D _Texture1;
					uniform  sampler2D _Texture2;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _ShadowMapTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  float vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat5;
					float u_xlat6;
					float u_xlat9;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = texture(_Texture2, vs_TEXCOORD0.zw);
					    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(Prop);
					    u_xlat1 = texture(_Texture1, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
					    u_xlat12 = (-Prop) + 1.0;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat12) + u_xlat0.xyz;
					    u_xlat12 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * vs_TEXCOORD1.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat12) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat3.xyz);
					    u_xlat1.x = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
					    u_xlat5.x = -abs(u_xlat12) + 1.0;
					    u_xlat12 = abs(u_xlat12) + u_xlat1.x;
					    u_xlat12 = u_xlat12 + 9.99999975e-06;
					    u_xlat0.w = 0.5 / u_xlat12;
					    u_xlat0 = u_xlat0 * vec4(0.779083729, 0.779083729, 0.779083729, 0.999999881);
					    u_xlat12 = max(u_xlat0.w, 9.99999975e-05);
					    u_xlat12 = sqrt(u_xlat12);
					    u_xlat12 = u_xlat1.x * u_xlat12;
					    u_xlat9 = u_xlat5.x * u_xlat5.x;
					    u_xlat9 = u_xlat9 * u_xlat9;
					    u_xlat5.x = u_xlat5.x * u_xlat9;
					    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat9 = max(u_xlat9, 0.00100000005);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
					    u_xlat9 = dot(_WorldSpaceLightPos0.xyz, u_xlat2.xyz);
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    u_xlat13 = dot(vec2(u_xlat9), vec2(u_xlat9));
					    u_xlat9 = (-u_xlat9) + 1.0;
					    u_xlat13 = u_xlat13 + -0.5;
					    u_xlat5.x = u_xlat13 * u_xlat5.x + 1.0;
					    u_xlat2.x = (-u_xlat1.x) + 1.0;
					    u_xlat6 = u_xlat2.x * u_xlat2.x;
					    u_xlat6 = u_xlat6 * u_xlat6;
					    u_xlat2.x = u_xlat2.x * u_xlat6;
					    u_xlat13 = u_xlat13 * u_xlat2.x + 1.0;
					    u_xlat5.x = u_xlat5.x * u_xlat13;
					    u_xlat1.x = u_xlat1.x * u_xlat5.x;
					    u_xlat5.xz = vs_TEXCOORD2.yy * unity_WorldToLight[1].xy;
					    u_xlat5.xz = unity_WorldToLight[0].xy * vs_TEXCOORD2.xx + u_xlat5.xz;
					    u_xlat5.xz = unity_WorldToLight[2].xy * vs_TEXCOORD2.zz + u_xlat5.xz;
					    u_xlat5.xz = u_xlat5.xz + unity_WorldToLight[3].xy;
					    u_xlat2 = texture(_LightTexture0, u_xlat5.xz);
					    u_xlat5.xz = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
					    u_xlat3 = texture(_ShadowMapTexture, u_xlat5.xz);
					    u_xlat5.x = u_xlat2.w * u_xlat3.x;
					    u_xlat2.xyz = u_xlat5.xxx * _LightColor0.xyz;
					    u_xlat1.xyw = u_xlat1.xxx * u_xlat2.xyz;
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = u_xlat9 * u_xlat9;
					    u_xlat12 = u_xlat12 * u_xlat12;
					    u_xlat12 = u_xlat9 * u_xlat12;
					    u_xlat12 = u_xlat12 * 0.779083729 + 0.220916301;
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyw + u_xlat2.xyz;
					    u_xlat12 = vs_TEXCOORD4 / _ProjectionParams.y;
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat12 = u_xlat12 * _ProjectionParams.z;
					    u_xlat12 = max(u_xlat12, 0.0);
					    u_xlat12 = u_xlat12 * unity_FogParams.z + unity_FogParams.w;
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat12);
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "SHADOWS_CUBE" "FOG_LINEAR" }
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
						mat4x4 unity_WorldToLight;
						vec4 _Color;
						float Prop;
						vec4 unused_0_6[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 unused_1_3[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 _LightPositionRange;
						vec4 unused_2_2[43];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					layout(std140) uniform UnityFog {
						vec4 unused_4_0;
						vec4 unity_FogParams;
					};
					uniform  sampler2D _Texture1;
					uniform  sampler2D _Texture2;
					uniform  sampler2D _LightTexture0;
					uniform  samplerCube _ShadowMapTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  float vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					float u_xlat7;
					float u_xlat12;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat16;
					float u_xlat17;
					void main()
					{
					    u_xlat0 = texture(_Texture2, vs_TEXCOORD0.zw);
					    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(Prop);
					    u_xlat1 = texture(_Texture1, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
					    u_xlat15 = (-Prop) + 1.0;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat15) + u_xlat0.xyz;
					    u_xlat15 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat15 = sqrt(u_xlat15);
					    u_xlat0.w = u_xlat15 * _LightPositionRange.w;
					    u_xlat0 = u_xlat0 * vec4(0.779083729, 0.779083729, 0.779083729, 0.970000029);
					    u_xlat1 = texture(_ShadowMapTexture, vs_TEXCOORD3.xyz);
					    u_xlatb15 = u_xlat1.x<u_xlat0.w;
					    u_xlat15 = (u_xlatb15) ? _LightShadowData.x : 1.0;
					    u_xlat1.xyz = vs_TEXCOORD2.yyy * unity_WorldToLight[1].xyz;
					    u_xlat1.xyz = unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + unity_WorldToLight[3].xyz;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1 = texture(_LightTexture0, u_xlat1.xx);
					    u_xlat15 = u_xlat15 * u_xlat1.x;
					    u_xlat1.xyz = vec3(u_xlat15) * _LightColor0.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
					    u_xlat3.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat15 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat4.xyz = u_xlat3.xyz * vec3(u_xlat15) + u_xlat2.xyz;
					    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz;
					    u_xlat15 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat15 = max(u_xlat15, 0.00100000005);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz;
					    u_xlat15 = dot(u_xlat3.xyz, u_xlat4.xyz);
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					    u_xlat16 = dot(vec2(u_xlat15), vec2(u_xlat15));
					    u_xlat15 = (-u_xlat15) + 1.0;
					    u_xlat16 = u_xlat16 + -0.5;
					    u_xlat17 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
					    u_xlat17 = inversesqrt(u_xlat17);
					    u_xlat4.xyz = vec3(u_xlat17) * vs_TEXCOORD1.xyz;
					    u_xlat2.x = dot(u_xlat4.xyz, u_xlat2.xyz);
					    u_xlat7 = dot(u_xlat4.xyz, u_xlat3.xyz);
					    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
					    u_xlat12 = -abs(u_xlat2.x) + 1.0;
					    u_xlat2.x = abs(u_xlat2.x) + u_xlat7;
					    u_xlat2.x = u_xlat2.x + 9.99999975e-06;
					    u_xlat2.x = 0.5 / u_xlat2.x;
					    u_xlat2.x = u_xlat2.x * 0.999999881;
					    u_xlat2.x = max(u_xlat2.x, 9.99999975e-05);
					    u_xlat2.x = sqrt(u_xlat2.x);
					    u_xlat2.x = u_xlat7 * u_xlat2.x;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xxx;
					    u_xlat2.x = u_xlat12 * u_xlat12;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x;
					    u_xlat2.x = u_xlat12 * u_xlat2.x;
					    u_xlat2.x = u_xlat16 * u_xlat2.x + 1.0;
					    u_xlat12 = (-u_xlat7) + 1.0;
					    u_xlat17 = u_xlat12 * u_xlat12;
					    u_xlat17 = u_xlat17 * u_xlat17;
					    u_xlat12 = u_xlat12 * u_xlat17;
					    u_xlat16 = u_xlat16 * u_xlat12 + 1.0;
					    u_xlat16 = u_xlat2.x * u_xlat16;
					    u_xlat16 = u_xlat7 * u_xlat16;
					    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
					    u_xlat16 = u_xlat15 * u_xlat15;
					    u_xlat16 = u_xlat16 * u_xlat16;
					    u_xlat15 = u_xlat15 * u_xlat16;
					    u_xlat15 = u_xlat15 * 0.779083729 + 0.220916301;
					    u_xlat2.xyz = vec3(u_xlat15) * u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat15 = vs_TEXCOORD4 / _ProjectionParams.y;
					    u_xlat15 = (-u_xlat15) + 1.0;
					    u_xlat15 = u_xlat15 * _ProjectionParams.z;
					    u_xlat15 = max(u_xlat15, 0.0);
					    u_xlat15 = u_xlat15 * unity_FogParams.z + unity_FogParams.w;
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat15);
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "FOG_LINEAR" }
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
						mat4x4 unity_WorldToLight;
						vec4 _Color;
						float Prop;
						vec4 unused_0_6[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 unused_1_3[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 _LightPositionRange;
						vec4 unused_2_2[43];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					layout(std140) uniform UnityFog {
						vec4 unused_4_0;
						vec4 unity_FogParams;
					};
					uniform  sampler2D _Texture1;
					uniform  sampler2D _Texture2;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					uniform  samplerCube _ShadowMapTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  float vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					bool u_xlatb1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					float u_xlat7;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					float u_xlat17;
					void main()
					{
					    u_xlat0 = texture(_Texture2, vs_TEXCOORD0.zw);
					    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(Prop);
					    u_xlat1 = texture(_Texture1, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
					    u_xlat15 = (-Prop) + 1.0;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat15) + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.779083729, 0.779083729, 0.779083729);
					    u_xlat1.xyz = vs_TEXCOORD2.yyy * unity_WorldToLight[1].xyz;
					    u_xlat1.xyz = unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + unity_WorldToLight[3].xyz;
					    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1 = texture(_LightTexture0, u_xlat1.xyz);
					    u_xlat2 = texture(_LightTextureB0, vec2(u_xlat15));
					    u_xlat15 = u_xlat1.w * u_xlat2.x;
					    u_xlat1.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat1.x * _LightPositionRange.w;
					    u_xlat1.x = u_xlat1.x * 0.970000029;
					    u_xlat2 = texture(_ShadowMapTexture, vs_TEXCOORD3.xyz);
					    u_xlatb1 = u_xlat2.x<u_xlat1.x;
					    u_xlat1.x = (u_xlatb1) ? _LightShadowData.x : 1.0;
					    u_xlat15 = u_xlat15 * u_xlat1.x;
					    u_xlat1.xyz = vec3(u_xlat15) * _LightColor0.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
					    u_xlat3.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat15 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat4.xyz = u_xlat3.xyz * vec3(u_xlat15) + u_xlat2.xyz;
					    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz;
					    u_xlat15 = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat15 = max(u_xlat15, 0.00100000005);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz;
					    u_xlat15 = dot(u_xlat3.xyz, u_xlat4.xyz);
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					    u_xlat16 = dot(vec2(u_xlat15), vec2(u_xlat15));
					    u_xlat15 = (-u_xlat15) + 1.0;
					    u_xlat16 = u_xlat16 + -0.5;
					    u_xlat17 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
					    u_xlat17 = inversesqrt(u_xlat17);
					    u_xlat4.xyz = vec3(u_xlat17) * vs_TEXCOORD1.xyz;
					    u_xlat2.x = dot(u_xlat4.xyz, u_xlat2.xyz);
					    u_xlat7 = dot(u_xlat4.xyz, u_xlat3.xyz);
					    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
					    u_xlat12 = -abs(u_xlat2.x) + 1.0;
					    u_xlat2.x = abs(u_xlat2.x) + u_xlat7;
					    u_xlat2.x = u_xlat2.x + 9.99999975e-06;
					    u_xlat2.x = 0.5 / u_xlat2.x;
					    u_xlat2.x = u_xlat2.x * 0.999999881;
					    u_xlat2.x = max(u_xlat2.x, 9.99999975e-05);
					    u_xlat2.x = sqrt(u_xlat2.x);
					    u_xlat2.x = u_xlat7 * u_xlat2.x;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.xxx;
					    u_xlat2.x = u_xlat12 * u_xlat12;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x;
					    u_xlat2.x = u_xlat12 * u_xlat2.x;
					    u_xlat2.x = u_xlat16 * u_xlat2.x + 1.0;
					    u_xlat12 = (-u_xlat7) + 1.0;
					    u_xlat17 = u_xlat12 * u_xlat12;
					    u_xlat17 = u_xlat17 * u_xlat17;
					    u_xlat12 = u_xlat12 * u_xlat17;
					    u_xlat16 = u_xlat16 * u_xlat12 + 1.0;
					    u_xlat16 = u_xlat2.x * u_xlat16;
					    u_xlat16 = u_xlat7 * u_xlat16;
					    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
					    u_xlat16 = u_xlat15 * u_xlat15;
					    u_xlat16 = u_xlat16 * u_xlat16;
					    u_xlat15 = u_xlat15 * u_xlat16;
					    u_xlat15 = u_xlat15 * 0.779083729 + 0.220916301;
					    u_xlat2.xyz = vec3(u_xlat15) * u_xlat3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat15 = vs_TEXCOORD4 / _ProjectionParams.y;
					    u_xlat15 = (-u_xlat15) + 1.0;
					    u_xlat15 = u_xlat15 * _ProjectionParams.z;
					    u_xlat15 = max(u_xlat15, 0.0);
					    u_xlat15 = u_xlat15 * unity_FogParams.z + unity_FogParams.w;
					    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat15);
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "FOG_LINEAR" }
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
						vec4 _ShadowOffsets[4];
						vec4 unused_0_4[3];
						mat4x4 unity_WorldToLight;
						vec4 _Color;
						float Prop;
						vec4 unused_0_8[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 unused_1_3[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[44];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					layout(std140) uniform UnityFog {
						vec4 unused_4_0;
						vec4 unity_FogParams;
					};
					uniform  sampler2D _Texture1;
					uniform  sampler2D _Texture2;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  float vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					float u_xlat4;
					float u_xlat5;
					float u_xlat9;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat14;
					void main()
					{
					    u_xlat0 = vs_TEXCOORD2.yyyy * unity_WorldToLight[1];
					    u_xlat0 = unity_WorldToLight[0] * vs_TEXCOORD2.xxxx + u_xlat0;
					    u_xlat0 = unity_WorldToLight[2] * vs_TEXCOORD2.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_WorldToLight[3];
					    u_xlat1.xy = u_xlat0.xy / u_xlat0.ww;
					    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat1 = texture(_LightTexture0, u_xlat1.xy);
					    u_xlatb12 = 0.0<u_xlat0.z;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat2 = texture(_LightTextureB0, u_xlat0.xx);
					    u_xlat0.x = u_xlatb12 ? 1.0 : float(0.0);
					    u_xlat0.x = u_xlat1.w * u_xlat0.x;
					    u_xlat0.x = u_xlat2.x * u_xlat0.x;
					    u_xlat4 = (-_LightShadowData.x) + 1.0;
					    u_xlat1.xyz = vs_TEXCOORD3.xyz / vs_TEXCOORD3.www;
					    u_xlat2.xyz = u_xlat1.xyz + _ShadowOffsets[0].xyz;
					    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
					    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
					    u_xlat3.xyz = u_xlat1.xyz + _ShadowOffsets[1].xyz;
					    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
					    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
					    u_xlat3.xyz = u_xlat1.xyz + _ShadowOffsets[2].xyz;
					    u_xlat1.xyz = u_xlat1.xyz + _ShadowOffsets[3].xyz;
					    vec3 txVec2 = vec3(u_xlat1.xy,u_xlat1.z);
					    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
					    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
					    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
					    u_xlat1 = u_xlat2 * vec4(u_xlat4) + _LightShadowData.xxxx;
					    u_xlat4 = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
					    u_xlat0.x = u_xlat4 * u_xlat0.x;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
					    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat1.xyz;
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat12 = max(u_xlat12, 0.00100000005);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat3.xyz);
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    u_xlat1.w = dot(vec2(u_xlat12), vec2(u_xlat12));
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat14 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
					    u_xlat14 = inversesqrt(u_xlat14);
					    u_xlat3.xyz = vec3(u_xlat14) * vs_TEXCOORD1.xyz;
					    u_xlat1.x = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat5 = dot(u_xlat3.xyz, u_xlat2.xyz);
					    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
					    u_xlat9 = -abs(u_xlat1.x) + 1.0;
					    u_xlat1.x = abs(u_xlat1.x) + u_xlat5;
					    u_xlat1.xw = u_xlat1.xw + vec2(9.99999975e-06, -0.5);
					    u_xlat1.x = 0.5 / u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * 0.999999881;
					    u_xlat1.x = max(u_xlat1.x, 9.99999975e-05);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat5 * u_xlat1.x;
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat1.x = u_xlat9 * u_xlat9;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat9 * u_xlat1.x;
					    u_xlat1.x = u_xlat1.w * u_xlat1.x + 1.0;
					    u_xlat9 = (-u_xlat5) + 1.0;
					    u_xlat14 = u_xlat9 * u_xlat9;
					    u_xlat14 = u_xlat14 * u_xlat14;
					    u_xlat9 = u_xlat9 * u_xlat14;
					    u_xlat9 = u_xlat1.w * u_xlat9 + 1.0;
					    u_xlat1.x = u_xlat1.x * u_xlat9;
					    u_xlat1.x = u_xlat5 * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat1.x = u_xlat12 * u_xlat12;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat12 = u_xlat12 * u_xlat1.x;
					    u_xlat12 = u_xlat12 * 0.779083729 + 0.220916301;
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat2 = texture(_Texture2, vs_TEXCOORD0.zw);
					    u_xlat2.xyz = u_xlat2.xyz * _Color.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(Prop);
					    u_xlat3 = texture(_Texture1, vs_TEXCOORD0.xy);
					    u_xlat3.xyz = u_xlat3.xyz * _Color.xyz;
					    u_xlat12 = (-Prop) + 1.0;
					    u_xlat2.xyz = u_xlat3.xyz * vec3(u_xlat12) + u_xlat2.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.779083729, 0.779083729, 0.779083729);
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat12 = vs_TEXCOORD4 / _ProjectionParams.y;
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat12 = u_xlat12 * _ProjectionParams.z;
					    u_xlat12 = max(u_xlat12, 0.0);
					    u_xlat12 = u_xlat12 * unity_FogParams.z + unity_FogParams.w;
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat12);
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" }
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
						mat4x4 unity_WorldToLight;
						vec4 _Color;
						float Prop;
						vec4 unused_0_6[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 unused_1_3[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 _LightPositionRange;
						vec4 unused_2_2[43];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					layout(std140) uniform UnityFog {
						vec4 unused_4_0;
						vec4 unity_FogParams;
					};
					uniform  sampler2D _Texture1;
					uniform  sampler2D _Texture2;
					uniform  sampler2D _LightTexture0;
					uniform  samplerCube _ShadowMapTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  float vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bvec4 u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					float u_xlat5;
					float u_xlat9;
					float u_xlat12;
					float u_xlat14;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _LightPositionRange.w;
					    u_xlat0.x = u_xlat0.x * 0.970000029;
					    u_xlat4.xyz = vs_TEXCOORD3.xyz + vec3(0.0078125, 0.0078125, 0.0078125);
					    u_xlat1 = texture(_ShadowMapTexture, u_xlat4.xyz);
					    u_xlat4.xyz = vs_TEXCOORD3.xyz + vec3(-0.0078125, -0.0078125, 0.0078125);
					    u_xlat2 = texture(_ShadowMapTexture, u_xlat4.xyz);
					    u_xlat1.y = u_xlat2.x;
					    u_xlat4.xyz = vs_TEXCOORD3.xyz + vec3(-0.0078125, 0.0078125, -0.0078125);
					    u_xlat2 = texture(_ShadowMapTexture, u_xlat4.xyz);
					    u_xlat1.z = u_xlat2.x;
					    u_xlat4.xyz = vs_TEXCOORD3.xyz + vec3(0.0078125, -0.0078125, -0.0078125);
					    u_xlat2 = texture(_ShadowMapTexture, u_xlat4.xyz);
					    u_xlat1.w = u_xlat2.x;
					    u_xlatb0 = lessThan(u_xlat1, u_xlat0.xxxx);
					    u_xlat0.x = (u_xlatb0.x) ? _LightShadowData.x : float(1.0);
					    u_xlat0.y = (u_xlatb0.y) ? _LightShadowData.x : float(1.0);
					    u_xlat0.z = (u_xlatb0.z) ? _LightShadowData.x : float(1.0);
					    u_xlat0.w = (u_xlatb0.w) ? _LightShadowData.x : float(1.0);
					    u_xlat0.x = dot(u_xlat0, vec4(0.25, 0.25, 0.25, 0.25));
					    u_xlat4.xyz = vs_TEXCOORD2.yyy * unity_WorldToLight[1].xyz;
					    u_xlat4.xyz = unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat4.xyz;
					    u_xlat4.xyz = unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + unity_WorldToLight[3].xyz;
					    u_xlat4.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat1 = texture(_LightTexture0, u_xlat4.xx);
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
					    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat1.xyz;
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat12 = max(u_xlat12, 0.00100000005);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat3.xyz);
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    u_xlat1.w = dot(vec2(u_xlat12), vec2(u_xlat12));
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat14 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
					    u_xlat14 = inversesqrt(u_xlat14);
					    u_xlat3.xyz = vec3(u_xlat14) * vs_TEXCOORD1.xyz;
					    u_xlat1.x = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat5 = dot(u_xlat3.xyz, u_xlat2.xyz);
					    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
					    u_xlat9 = -abs(u_xlat1.x) + 1.0;
					    u_xlat1.x = abs(u_xlat1.x) + u_xlat5;
					    u_xlat1.xw = u_xlat1.xw + vec2(9.99999975e-06, -0.5);
					    u_xlat1.x = 0.5 / u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * 0.999999881;
					    u_xlat1.x = max(u_xlat1.x, 9.99999975e-05);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat5 * u_xlat1.x;
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat1.x = u_xlat9 * u_xlat9;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat9 * u_xlat1.x;
					    u_xlat1.x = u_xlat1.w * u_xlat1.x + 1.0;
					    u_xlat9 = (-u_xlat5) + 1.0;
					    u_xlat14 = u_xlat9 * u_xlat9;
					    u_xlat14 = u_xlat14 * u_xlat14;
					    u_xlat9 = u_xlat9 * u_xlat14;
					    u_xlat9 = u_xlat1.w * u_xlat9 + 1.0;
					    u_xlat1.x = u_xlat1.x * u_xlat9;
					    u_xlat1.x = u_xlat5 * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat1.x = u_xlat12 * u_xlat12;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat12 = u_xlat12 * u_xlat1.x;
					    u_xlat12 = u_xlat12 * 0.779083729 + 0.220916301;
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat2 = texture(_Texture2, vs_TEXCOORD0.zw);
					    u_xlat2.xyz = u_xlat2.xyz * _Color.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(Prop);
					    u_xlat3 = texture(_Texture1, vs_TEXCOORD0.xy);
					    u_xlat3.xyz = u_xlat3.xyz * _Color.xyz;
					    u_xlat12 = (-Prop) + 1.0;
					    u_xlat2.xyz = u_xlat3.xyz * vec3(u_xlat12) + u_xlat2.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.779083729, 0.779083729, 0.779083729);
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat12 = vs_TEXCOORD4 / _ProjectionParams.y;
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat12 = u_xlat12 * _ProjectionParams.z;
					    u_xlat12 = max(u_xlat12, 0.0);
					    u_xlat12 = u_xlat12 * unity_FogParams.z + unity_FogParams.w;
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat12);
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "FOG_LINEAR" }
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
						mat4x4 unity_WorldToLight;
						vec4 _Color;
						float Prop;
						vec4 unused_0_6[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 unused_1_3[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 _LightPositionRange;
						vec4 unused_2_2[43];
					};
					layout(std140) uniform UnityShadows {
						vec4 unused_3_0[24];
						vec4 _LightShadowData;
						vec4 unused_3_2;
					};
					layout(std140) uniform UnityFog {
						vec4 unused_4_0;
						vec4 unity_FogParams;
					};
					uniform  sampler2D _Texture1;
					uniform  sampler2D _Texture2;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					uniform  samplerCube _ShadowMapTexture;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  float vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bvec4 u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					float u_xlat5;
					float u_xlat9;
					float u_xlat12;
					float u_xlat14;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat0.x = sqrt(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _LightPositionRange.w;
					    u_xlat0.x = u_xlat0.x * 0.970000029;
					    u_xlat4.xyz = vs_TEXCOORD3.xyz + vec3(0.0078125, 0.0078125, 0.0078125);
					    u_xlat1 = texture(_ShadowMapTexture, u_xlat4.xyz);
					    u_xlat4.xyz = vs_TEXCOORD3.xyz + vec3(-0.0078125, -0.0078125, 0.0078125);
					    u_xlat2 = texture(_ShadowMapTexture, u_xlat4.xyz);
					    u_xlat1.y = u_xlat2.x;
					    u_xlat4.xyz = vs_TEXCOORD3.xyz + vec3(-0.0078125, 0.0078125, -0.0078125);
					    u_xlat2 = texture(_ShadowMapTexture, u_xlat4.xyz);
					    u_xlat1.z = u_xlat2.x;
					    u_xlat4.xyz = vs_TEXCOORD3.xyz + vec3(0.0078125, -0.0078125, -0.0078125);
					    u_xlat2 = texture(_ShadowMapTexture, u_xlat4.xyz);
					    u_xlat1.w = u_xlat2.x;
					    u_xlatb0 = lessThan(u_xlat1, u_xlat0.xxxx);
					    u_xlat0.x = (u_xlatb0.x) ? _LightShadowData.x : float(1.0);
					    u_xlat0.y = (u_xlatb0.y) ? _LightShadowData.x : float(1.0);
					    u_xlat0.z = (u_xlatb0.z) ? _LightShadowData.x : float(1.0);
					    u_xlat0.w = (u_xlatb0.w) ? _LightShadowData.x : float(1.0);
					    u_xlat0.x = dot(u_xlat0, vec4(0.25, 0.25, 0.25, 0.25));
					    u_xlat4.xyz = vs_TEXCOORD2.yyy * unity_WorldToLight[1].xyz;
					    u_xlat4.xyz = unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat4.xyz;
					    u_xlat4.xyz = unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat4.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + unity_WorldToLight[3].xyz;
					    u_xlat1.x = dot(u_xlat4.xyz, u_xlat4.xyz);
					    u_xlat2 = texture(_LightTexture0, u_xlat4.xyz);
					    u_xlat1 = texture(_LightTextureB0, u_xlat1.xx);
					    u_xlat4.x = u_xlat2.w * u_xlat1.x;
					    u_xlat0.x = u_xlat0.x * u_xlat4.x;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
					    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat12) + u_xlat1.xyz;
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat12 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat12 = max(u_xlat12, 0.00100000005);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat3.xyz);
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    u_xlat1.w = dot(vec2(u_xlat12), vec2(u_xlat12));
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat14 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
					    u_xlat14 = inversesqrt(u_xlat14);
					    u_xlat3.xyz = vec3(u_xlat14) * vs_TEXCOORD1.xyz;
					    u_xlat1.x = dot(u_xlat3.xyz, u_xlat1.xyz);
					    u_xlat5 = dot(u_xlat3.xyz, u_xlat2.xyz);
					    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
					    u_xlat9 = -abs(u_xlat1.x) + 1.0;
					    u_xlat1.x = abs(u_xlat1.x) + u_xlat5;
					    u_xlat1.xw = u_xlat1.xw + vec2(9.99999975e-06, -0.5);
					    u_xlat1.x = 0.5 / u_xlat1.x;
					    u_xlat1.x = u_xlat1.x * 0.999999881;
					    u_xlat1.x = max(u_xlat1.x, 9.99999975e-05);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat1.x = u_xlat5 * u_xlat1.x;
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat1.x = u_xlat9 * u_xlat9;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat1.x = u_xlat9 * u_xlat1.x;
					    u_xlat1.x = u_xlat1.w * u_xlat1.x + 1.0;
					    u_xlat9 = (-u_xlat5) + 1.0;
					    u_xlat14 = u_xlat9 * u_xlat9;
					    u_xlat14 = u_xlat14 * u_xlat14;
					    u_xlat9 = u_xlat9 * u_xlat14;
					    u_xlat9 = u_xlat1.w * u_xlat9 + 1.0;
					    u_xlat1.x = u_xlat1.x * u_xlat9;
					    u_xlat1.x = u_xlat5 * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
					    u_xlat1.x = u_xlat12 * u_xlat12;
					    u_xlat1.x = u_xlat1.x * u_xlat1.x;
					    u_xlat12 = u_xlat12 * u_xlat1.x;
					    u_xlat12 = u_xlat12 * 0.779083729 + 0.220916301;
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    u_xlat2 = texture(_Texture2, vs_TEXCOORD0.zw);
					    u_xlat2.xyz = u_xlat2.xyz * _Color.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(Prop);
					    u_xlat3 = texture(_Texture1, vs_TEXCOORD0.xy);
					    u_xlat3.xyz = u_xlat3.xyz * _Color.xyz;
					    u_xlat12 = (-Prop) + 1.0;
					    u_xlat2.xyz = u_xlat3.xyz * vec3(u_xlat12) + u_xlat2.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.779083729, 0.779083729, 0.779083729);
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat12 = vs_TEXCOORD4 / _ProjectionParams.y;
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat12 = u_xlat12 * _ProjectionParams.z;
					    u_xlat12 = max(u_xlat12, 0.0);
					    u_xlat12 = u_xlat12 * unity_FogParams.z + unity_FogParams.w;
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat12);
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
			}
		}
		Pass {
			Name "DEFERRED"
			LOD 200
			Tags { "LIGHTMODE" = "Deferred" "RenderType" = "Opaque" }
			ZClip Off
			GpuProgramID 160791
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
						vec4 unused_0_0[6];
						vec4 _Texture1_ST;
						vec4 _Texture2_ST;
						vec4 unused_0_3;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_1_0[41];
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
						vec4 unused_2_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture1_ST.xy + _Texture1_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Texture2_ST.xy + _Texture2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat6 = u_xlat0.y * u_xlat0.y;
					    u_xlat6 = u_xlat0.x * u_xlat0.x + (-u_xlat6);
					    u_xlat1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat0.x = dot(unity_SHBr, u_xlat1);
					    u_xlat0.y = dot(unity_SHBg, u_xlat1);
					    u_xlat0.z = dot(unity_SHBb, u_xlat1);
					    vs_TEXCOORD5.xyz = unity_SHC.xyz * vec3(u_xlat6) + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_HDR_ON" }
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
						vec4 unused_0_0[6];
						vec4 _Texture1_ST;
						vec4 _Texture2_ST;
						vec4 unused_0_3;
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_1_0[41];
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
						vec4 unused_2_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture1_ST.xy + _Texture1_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Texture2_ST.xy + _Texture2_ST.zw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
					    u_xlat1.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD2.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat6 = u_xlat0.y * u_xlat0.y;
					    u_xlat6 = u_xlat0.x * u_xlat0.x + (-u_xlat6);
					    u_xlat1 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat0.x = dot(unity_SHBr, u_xlat1);
					    u_xlat0.y = dot(unity_SHBg, u_xlat1);
					    u_xlat0.z = dot(unity_SHBb, u_xlat1);
					    vs_TEXCOORD5.xyz = unity_SHC.xyz * vec3(u_xlat6) + u_xlat0.xyz;
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
						float Prop;
						vec4 unused_0_3[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_1_0[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unused_1_4[4];
					};
					layout(std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					uniform  sampler2D _Texture1;
					uniform  sampler2D _Texture2;
					uniform  sampler3D unity_ProbeVolumeSH;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					layout(location = 1) out vec4 SV_Target1;
					layout(location = 2) out vec4 SV_Target2;
					layout(location = 3) out vec4 SV_Target3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat6;
					float u_xlat15;
					bool u_xlatb15;
					void main()
					{
					    u_xlat0 = texture(_Texture1, vs_TEXCOORD0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
					    u_xlat1 = texture(_Texture2, vs_TEXCOORD0.zw);
					    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
					    u_xlat15 = (-Prop) + 1.0;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(Prop);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15) + u_xlat1.xyz;
					    u_xlatb15 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb15){
					        u_xlatb15 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat1.xyz = vs_TEXCOORD2.yyy * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat1.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat1.xyz;
					        u_xlat1.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat1.xyz;
					        u_xlat1.xyz = u_xlat1.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat1.xyz = (bool(u_xlatb15)) ? u_xlat1.xyz : vs_TEXCOORD2.xyz;
					        u_xlat1.xyz = u_xlat1.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat1.yzw = u_xlat1.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat15 = u_xlat1.y * 0.25;
					        u_xlat6 = unity_ProbeVolumeParams.z * 0.5;
					        u_xlat2.x = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
					        u_xlat15 = max(u_xlat15, u_xlat6);
					        u_xlat1.x = min(u_xlat2.x, u_xlat15);
					        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat1.xzw);
					        u_xlat3.xyz = u_xlat1.xzw + vec3(0.25, 0.0, 0.0);
					        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xyz);
					        u_xlat1.xyz = u_xlat1.xzw + vec3(0.5, 0.0, 0.0);
					        u_xlat1 = texture(unity_ProbeVolumeSH, u_xlat1.xyz);
					        u_xlat4.xyz = vs_TEXCOORD1.xyz;
					        u_xlat4.w = 1.0;
					        u_xlat2.x = dot(u_xlat2, u_xlat4);
					        u_xlat2.y = dot(u_xlat3, u_xlat4);
					        u_xlat2.z = dot(u_xlat1, u_xlat4);
					    } else {
					        u_xlat1.xyz = vs_TEXCOORD1.xyz;
					        u_xlat1.w = 1.0;
					        u_xlat2.x = dot(unity_SHAr, u_xlat1);
					        u_xlat2.y = dot(unity_SHAg, u_xlat1);
					        u_xlat2.z = dot(unity_SHAb, u_xlat1);
					    }
					    u_xlat1.xyz = u_xlat2.xyz + vs_TEXCOORD5.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.779083729, 0.779083729, 0.779083729);
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat0.xyz;
					    SV_Target3.xyz = exp2((-u_xlat1.xyz));
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    SV_Target1 = vec4(0.220916301, 0.220916301, 0.220916301, 0.0);
					    SV_Target2.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    SV_Target2.w = 1.0;
					    SV_Target3.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "UNITY_HDR_ON" }
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
						float Prop;
						vec4 unused_0_3[3];
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_1_0[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unused_1_4[4];
					};
					layout(std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					uniform  sampler2D _Texture1;
					uniform  sampler2D _Texture2;
					uniform  sampler3D unity_ProbeVolumeSH;
					in  vec4 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					layout(location = 1) out vec4 SV_Target1;
					layout(location = 2) out vec4 SV_Target2;
					layout(location = 3) out vec4 SV_Target3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat6;
					float u_xlat15;
					bool u_xlatb15;
					void main()
					{
					    u_xlat0 = texture(_Texture1, vs_TEXCOORD0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
					    u_xlat1 = texture(_Texture2, vs_TEXCOORD0.zw);
					    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
					    u_xlat15 = (-Prop) + 1.0;
					    u_xlat1.xyz = u_xlat1.xyz * vec3(Prop);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15) + u_xlat1.xyz;
					    u_xlatb15 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb15){
					        u_xlatb15 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat1.xyz = vs_TEXCOORD2.yyy * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat1.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat1.xyz;
					        u_xlat1.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat1.xyz;
					        u_xlat1.xyz = u_xlat1.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat1.xyz = (bool(u_xlatb15)) ? u_xlat1.xyz : vs_TEXCOORD2.xyz;
					        u_xlat1.xyz = u_xlat1.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat1.yzw = u_xlat1.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat15 = u_xlat1.y * 0.25;
					        u_xlat6 = unity_ProbeVolumeParams.z * 0.5;
					        u_xlat2.x = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
					        u_xlat15 = max(u_xlat15, u_xlat6);
					        u_xlat1.x = min(u_xlat2.x, u_xlat15);
					        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat1.xzw);
					        u_xlat3.xyz = u_xlat1.xzw + vec3(0.25, 0.0, 0.0);
					        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xyz);
					        u_xlat1.xyz = u_xlat1.xzw + vec3(0.5, 0.0, 0.0);
					        u_xlat1 = texture(unity_ProbeVolumeSH, u_xlat1.xyz);
					        u_xlat4.xyz = vs_TEXCOORD1.xyz;
					        u_xlat4.w = 1.0;
					        u_xlat2.x = dot(u_xlat2, u_xlat4);
					        u_xlat2.y = dot(u_xlat3, u_xlat4);
					        u_xlat2.z = dot(u_xlat1, u_xlat4);
					    } else {
					        u_xlat1.xyz = vs_TEXCOORD1.xyz;
					        u_xlat1.w = 1.0;
					        u_xlat2.x = dot(unity_SHAr, u_xlat1);
					        u_xlat2.y = dot(unity_SHAg, u_xlat1);
					        u_xlat2.z = dot(unity_SHAb, u_xlat1);
					    }
					    u_xlat1.xyz = u_xlat2.xyz + vs_TEXCOORD5.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.779083729, 0.779083729, 0.779083729);
					    SV_Target3.xyz = u_xlat1.xyz * u_xlat0.xyz;
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    SV_Target1 = vec4(0.220916301, 0.220916301, 0.220916301, 0.0);
					    SV_Target2.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    SV_Target2.w = 1.0;
					    SV_Target3.w = 1.0;
					    return;
					}"
				}
			}
		}
		Pass {
			Name "META"
			LOD 200
			Tags { "LIGHTMODE" = "Meta" "RenderType" = "Opaque" }
			ZClip Off
			Cull Off
			GpuProgramID 254785
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
						vec4 unused_0_0[6];
						vec4 _Texture1_ST;
						vec4 _Texture2_ST;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[8];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_3[6];
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
					in  vec4 in_TEXCOORD0;
					in  vec4 in_TEXCOORD1;
					in  vec4 in_TEXCOORD2;
					out vec4 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					bool u_xlatb6;
					void main()
					{
					    u_xlatb0 = 0.0<in_POSITION0.z;
					    u_xlat0.z = u_xlatb0 ? 9.99999975e-05 : float(0.0);
					    u_xlat0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    u_xlat0.xyz = (unity_MetaVertexControl.x) ? u_xlat0.xyz : in_POSITION0.xyz;
					    u_xlatb6 = 0.0<u_xlat0.z;
					    u_xlat1.z = u_xlatb6 ? 9.99999975e-05 : float(0.0);
					    u_xlat1.xy = in_TEXCOORD2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
					    u_xlat0.xyz = (unity_MetaVertexControl.y) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1 = u_xlat0.yyyy * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat0 = glstate_matrix_mvp[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = u_xlat0 + glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Texture1_ST.xy + _Texture1_ST.zw;
					    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Texture2_ST.xy + _Texture2_ST.zw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
						float Prop;
						float unity_OneOverOutputBoost;
						float unity_MaxOutputValue;
						vec4 unused_0_5[2];
					};
					layout(std140) uniform UnityMetaPass {
						vec4 unused_1_0;
						bvec4 unity_MetaFragmentControl;
					};
					uniform  sampler2D _Texture1;
					uniform  sampler2D _Texture2;
					in  vec4 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = texture(_Texture2, vs_TEXCOORD0.zw);
					    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(Prop);
					    u_xlat1 = texture(_Texture1, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
					    u_xlat6 = (-Prop) + 1.0;
					    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat6) + u_xlat0.xyz;
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat6 = unity_OneOverOutputBoost;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat6);
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
	}
	Fallback "Diffuse"
}