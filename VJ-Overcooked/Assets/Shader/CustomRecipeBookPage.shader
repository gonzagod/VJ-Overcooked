Shader "Custom/RecipeBookPage" {
	Properties {
		_Color ("Main Color", Vector) = (1,1,1,1)
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_FrontPageTex ("FrontPage (RGB)", 2D) = "white" {}
		_BackPageTex ("BackPage (RGB)", 2D) = "white" {}
		_UIAreaUV ("UI MinMax Area UV", Vector) = (0.3,0.3,0.7,0.7)
	}
	SubShader {
		Tags { "RenderType" = "Diffuse" }
		Pass {
			Name "FORWARD"
			Tags { "LIGHTMODE" = "ForwardBase" "RenderType" = "Diffuse" "SHADOWSUPPORT" = "true" }
			ZClip Off
			Cull Off
			GpuProgramID 27083
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
						vec4 unused_0_0[4];
						vec4 _Color;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
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
						vec4 unused_2_4;
						vec4 unity_WorldTransformParams;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec4 vs_TEXCOORD9;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat2 = u_xlat0.xxxx * u_xlat2.xyzz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.wxy;
					    u_xlat3.xyz = u_xlat2.ywx * u_xlat1.yzx + (-u_xlat3.xyz);
					    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
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
					    vs_TEXCOORD3.z = u_xlat2.w;
					    vs_TEXCOORD4 = in_COLOR0 * _Color;
					    vs_TEXCOORD5.xyz = in_TANGENT0.xyz;
					    u_xlat0.x = u_xlat2.y * u_xlat2.y;
					    u_xlat0.x = u_xlat2.x * u_xlat2.x + (-u_xlat0.x);
					    u_xlat1 = u_xlat2.ywzx * u_xlat2;
					    u_xlat2.x = dot(unity_SHBr, u_xlat1);
					    u_xlat2.y = dot(unity_SHBg, u_xlat1);
					    u_xlat2.z = dot(unity_SHBb, u_xlat1);
					    vs_TEXCOORD6.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat2.xyz;
					    vs_TEXCOORD9 = vec4(0.0, 0.0, 0.0, 0.0);
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
						vec4 unused_0_0[4];
						vec4 _Color;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
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
						vec4 unused_3_4;
						vec4 unity_WorldTransformParams;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec4 vs_TEXCOORD7;
					out vec4 vs_TEXCOORD9;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
					    u_xlat3.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat3.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat3.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat3 = u_xlat1.xxxx * u_xlat3.xyzz;
					    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.wxy;
					    u_xlat4.xyz = u_xlat3.ywx * u_xlat2.yzx + (-u_xlat4.xyz);
					    u_xlat1.x = in_TANGENT0.w * unity_WorldTransformParams.w;
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
					    vs_TEXCOORD3.z = u_xlat3.w;
					    vs_TEXCOORD4 = in_COLOR0 * _Color;
					    vs_TEXCOORD5.xyz = in_TANGENT0.xyz;
					    u_xlat1.x = u_xlat3.y * u_xlat3.y;
					    u_xlat1.x = u_xlat3.x * u_xlat3.x + (-u_xlat1.x);
					    u_xlat2 = u_xlat3.ywzx * u_xlat3;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    vs_TEXCOORD6.xyz = unity_SHC.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD7.zw = u_xlat0.zw;
					    vs_TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD9 = vec4(0.0, 0.0, 0.0, 0.0);
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
						vec4 unused_0_0[4];
						vec4 _Color;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
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
						vec4 unused_2_4;
						vec4 unity_WorldTransformParams;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec4 vs_TEXCOORD9;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat15;
					float u_xlat16;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat0.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat0.xyz;
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    vs_TEXCOORD1.x = u_xlat0.z;
					    u_xlat15 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat16 = inversesqrt(u_xlat16);
					    u_xlat1 = vec4(u_xlat16) * u_xlat1.xyzz;
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.wxy;
					    u_xlat2.xyz = u_xlat1.ywx * u_xlat0.yzx + (-u_xlat2.xyz);
					    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
					    vs_TEXCOORD1.y = u_xlat2.x;
					    u_xlat3.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat3.xyz;
					    vs_TEXCOORD1.w = u_xlat3.x;
					    vs_TEXCOORD1.z = u_xlat1.x;
					    vs_TEXCOORD2.x = u_xlat0.x;
					    vs_TEXCOORD3.x = u_xlat0.y;
					    vs_TEXCOORD2.y = u_xlat2.y;
					    vs_TEXCOORD3.y = u_xlat2.z;
					    vs_TEXCOORD2.w = u_xlat3.y;
					    vs_TEXCOORD2.z = u_xlat1.y;
					    vs_TEXCOORD3.w = u_xlat3.z;
					    vs_TEXCOORD3.z = u_xlat1.w;
					    vs_TEXCOORD4 = in_COLOR0 * _Color;
					    vs_TEXCOORD5.xyz = in_TANGENT0.xyz;
					    u_xlat0 = (-u_xlat3.xxxx) + unity_4LightPosX0;
					    u_xlat2 = (-u_xlat3.yyyy) + unity_4LightPosY0;
					    u_xlat3 = (-u_xlat3.zzzz) + unity_4LightPosZ0;
					    u_xlat4 = u_xlat1.yyyy * u_xlat2;
					    u_xlat2 = u_xlat2 * u_xlat2;
					    u_xlat2 = u_xlat0 * u_xlat0 + u_xlat2;
					    u_xlat0 = u_xlat0 * u_xlat1.xxxx + u_xlat4;
					    u_xlat0 = u_xlat3 * u_xlat1.wwzw + u_xlat0;
					    u_xlat2 = u_xlat3 * u_xlat3 + u_xlat2;
					    u_xlat2 = max(u_xlat2, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat3 = inversesqrt(u_xlat2);
					    u_xlat2 = u_xlat2 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat2 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat2;
					    u_xlat0 = u_xlat0 * u_xlat3;
					    u_xlat0 = max(u_xlat0, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat0 = u_xlat2 * u_xlat0;
					    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
					    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
					    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat2.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    u_xlat15 = u_xlat1.y * u_xlat1.y;
					    u_xlat15 = u_xlat1.x * u_xlat1.x + (-u_xlat15);
					    u_xlat1 = u_xlat1.ywzx * u_xlat1;
					    u_xlat3.x = dot(unity_SHBr, u_xlat1);
					    u_xlat3.y = dot(unity_SHBg, u_xlat1);
					    u_xlat3.z = dot(unity_SHBb, u_xlat1);
					    u_xlat1.xyz = unity_SHC.xyz * vec3(u_xlat15) + u_xlat3.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz * u_xlat2.xyz + u_xlat1.xyz;
					    vs_TEXCOORD9 = vec4(0.0, 0.0, 0.0, 0.0);
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
						vec4 unused_0_0[4];
						vec4 _Color;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
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
						vec4 unused_3_4;
						vec4 unity_WorldTransformParams;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec4 vs_TEXCOORD7;
					out vec4 vs_TEXCOORD9;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					float u_xlat19;
					float u_xlat20;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat1.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
					    vs_TEXCOORD1.x = u_xlat1.z;
					    u_xlat19 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat20 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat20 = inversesqrt(u_xlat20);
					    u_xlat2 = vec4(u_xlat20) * u_xlat2.xyzz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.wxy;
					    u_xlat3.xyz = u_xlat2.ywx * u_xlat1.yzx + (-u_xlat3.xyz);
					    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
					    vs_TEXCOORD1.y = u_xlat3.x;
					    u_xlat4.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat4.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
					    u_xlat4.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
					    u_xlat4.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat4.xyz;
					    vs_TEXCOORD1.w = u_xlat4.x;
					    vs_TEXCOORD1.z = u_xlat2.x;
					    vs_TEXCOORD2.x = u_xlat1.x;
					    vs_TEXCOORD3.x = u_xlat1.y;
					    vs_TEXCOORD2.y = u_xlat3.y;
					    vs_TEXCOORD3.y = u_xlat3.z;
					    vs_TEXCOORD2.w = u_xlat4.y;
					    vs_TEXCOORD2.z = u_xlat2.y;
					    vs_TEXCOORD3.w = u_xlat4.z;
					    vs_TEXCOORD3.z = u_xlat2.w;
					    vs_TEXCOORD4 = in_COLOR0 * _Color;
					    vs_TEXCOORD5.xyz = in_TANGENT0.xyz;
					    u_xlat1 = (-u_xlat4.xxxx) + unity_4LightPosX0;
					    u_xlat3 = (-u_xlat4.yyyy) + unity_4LightPosY0;
					    u_xlat4 = (-u_xlat4.zzzz) + unity_4LightPosZ0;
					    u_xlat5 = u_xlat2.yyyy * u_xlat3;
					    u_xlat3 = u_xlat3 * u_xlat3;
					    u_xlat3 = u_xlat1 * u_xlat1 + u_xlat3;
					    u_xlat1 = u_xlat1 * u_xlat2.xxxx + u_xlat5;
					    u_xlat1 = u_xlat4 * u_xlat2.wwzw + u_xlat1;
					    u_xlat3 = u_xlat4 * u_xlat4 + u_xlat3;
					    u_xlat3 = max(u_xlat3, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat4 = inversesqrt(u_xlat3);
					    u_xlat3 = u_xlat3 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat3 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat3;
					    u_xlat1 = u_xlat1 * u_xlat4;
					    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat1 = u_xlat3 * u_xlat1;
					    u_xlat3.xyz = u_xlat1.yyy * unity_LightColor[1].xyz;
					    u_xlat3.xyz = unity_LightColor[0].xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat1.xyz = unity_LightColor[2].xyz * u_xlat1.zzz + u_xlat3.xyz;
					    u_xlat1.xyz = unity_LightColor[3].xyz * u_xlat1.www + u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    u_xlat19 = u_xlat2.y * u_xlat2.y;
					    u_xlat19 = u_xlat2.x * u_xlat2.x + (-u_xlat19);
					    u_xlat2 = u_xlat2.ywzx * u_xlat2;
					    u_xlat4.x = dot(unity_SHBr, u_xlat2);
					    u_xlat4.y = dot(unity_SHBg, u_xlat2);
					    u_xlat4.z = dot(unity_SHBb, u_xlat2);
					    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat19) + u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat1.xyz * u_xlat3.xyz + u_xlat2.xyz;
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD7.zw = u_xlat0.zw;
					    vs_TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD9 = vec4(0.0, 0.0, 0.0, 0.0);
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
						vec4 unused_0_0[4];
						vec4 _Color;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
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
						vec4 unused_2_4;
						vec4 unity_WorldTransformParams;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out float vs_TEXCOORD8;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec4 vs_TEXCOORD9;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD8 = u_xlat0.z;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat2 = u_xlat0.xxxx * u_xlat2.xyzz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.wxy;
					    u_xlat3.xyz = u_xlat2.ywx * u_xlat1.yzx + (-u_xlat3.xyz);
					    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
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
					    vs_TEXCOORD3.z = u_xlat2.w;
					    vs_TEXCOORD4 = in_COLOR0 * _Color;
					    vs_TEXCOORD5.xyz = in_TANGENT0.xyz;
					    u_xlat0.x = u_xlat2.y * u_xlat2.y;
					    u_xlat0.x = u_xlat2.x * u_xlat2.x + (-u_xlat0.x);
					    u_xlat1 = u_xlat2.ywzx * u_xlat2;
					    u_xlat2.x = dot(unity_SHBr, u_xlat1);
					    u_xlat2.y = dot(unity_SHBg, u_xlat1);
					    u_xlat2.z = dot(unity_SHBb, u_xlat1);
					    vs_TEXCOORD6.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat2.xyz;
					    vs_TEXCOORD9 = vec4(0.0, 0.0, 0.0, 0.0);
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
						vec4 unused_0_0[4];
						vec4 _Color;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
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
						vec4 unused_3_4;
						vec4 unity_WorldTransformParams;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out float vs_TEXCOORD8;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec4 vs_TEXCOORD7;
					out vec4 vs_TEXCOORD9;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					float u_xlat5;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD8 = u_xlat0.z;
					    vs_TEXCOORD7.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    vs_TEXCOORD1.w = u_xlat1.x;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat2.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
					    vs_TEXCOORD1.x = u_xlat2.z;
					    u_xlat3.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat3.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat3.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat3 = vec4(u_xlat10) * u_xlat3.xyzz;
					    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.wxy;
					    u_xlat4.xyz = u_xlat3.ywx * u_xlat2.yzx + (-u_xlat4.xyz);
					    u_xlat10 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat4.xyz = vec3(u_xlat10) * u_xlat4.xyz;
					    vs_TEXCOORD1.y = u_xlat4.x;
					    vs_TEXCOORD1.z = u_xlat3.x;
					    vs_TEXCOORD2.x = u_xlat2.x;
					    vs_TEXCOORD3.x = u_xlat2.y;
					    vs_TEXCOORD2.w = u_xlat1.y;
					    vs_TEXCOORD3.w = u_xlat1.z;
					    vs_TEXCOORD2.y = u_xlat4.y;
					    vs_TEXCOORD3.y = u_xlat4.z;
					    vs_TEXCOORD2.z = u_xlat3.y;
					    vs_TEXCOORD3.z = u_xlat3.w;
					    vs_TEXCOORD4 = in_COLOR0 * _Color;
					    vs_TEXCOORD5.xyz = in_TANGENT0.xyz;
					    u_xlat10 = u_xlat3.y * u_xlat3.y;
					    u_xlat10 = u_xlat3.x * u_xlat3.x + (-u_xlat10);
					    u_xlat1 = u_xlat3.ywzx * u_xlat3;
					    u_xlat2.x = dot(unity_SHBr, u_xlat1);
					    u_xlat2.y = dot(unity_SHBg, u_xlat1);
					    u_xlat2.z = dot(unity_SHBb, u_xlat1);
					    vs_TEXCOORD6.xyz = unity_SHC.xyz * vec3(u_xlat10) + u_xlat2.xyz;
					    u_xlat5 = u_xlat0.y * _ProjectionParams.x;
					    u_xlat0.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat0.w = u_xlat5 * 0.5;
					    vs_TEXCOORD7.xy = u_xlat0.zz + u_xlat0.xw;
					    vs_TEXCOORD9 = vec4(0.0, 0.0, 0.0, 0.0);
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
						vec4 unused_0_0[4];
						vec4 _Color;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
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
						vec4 unused_2_4;
						vec4 unity_WorldTransformParams;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out float vs_TEXCOORD8;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec4 vs_TEXCOORD9;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat15;
					float u_xlat16;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD8 = u_xlat0.z;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat0.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat0.xyz;
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    vs_TEXCOORD1.x = u_xlat0.z;
					    u_xlat15 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat16 = inversesqrt(u_xlat16);
					    u_xlat1 = vec4(u_xlat16) * u_xlat1.xyzz;
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.wxy;
					    u_xlat2.xyz = u_xlat1.ywx * u_xlat0.yzx + (-u_xlat2.xyz);
					    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
					    vs_TEXCOORD1.y = u_xlat2.x;
					    u_xlat3.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat3.xyz;
					    vs_TEXCOORD1.w = u_xlat3.x;
					    vs_TEXCOORD1.z = u_xlat1.x;
					    vs_TEXCOORD2.x = u_xlat0.x;
					    vs_TEXCOORD3.x = u_xlat0.y;
					    vs_TEXCOORD2.y = u_xlat2.y;
					    vs_TEXCOORD3.y = u_xlat2.z;
					    vs_TEXCOORD2.w = u_xlat3.y;
					    vs_TEXCOORD2.z = u_xlat1.y;
					    vs_TEXCOORD3.w = u_xlat3.z;
					    vs_TEXCOORD3.z = u_xlat1.w;
					    vs_TEXCOORD4 = in_COLOR0 * _Color;
					    vs_TEXCOORD5.xyz = in_TANGENT0.xyz;
					    u_xlat0 = (-u_xlat3.xxxx) + unity_4LightPosX0;
					    u_xlat2 = (-u_xlat3.yyyy) + unity_4LightPosY0;
					    u_xlat3 = (-u_xlat3.zzzz) + unity_4LightPosZ0;
					    u_xlat4 = u_xlat1.yyyy * u_xlat2;
					    u_xlat2 = u_xlat2 * u_xlat2;
					    u_xlat2 = u_xlat0 * u_xlat0 + u_xlat2;
					    u_xlat0 = u_xlat0 * u_xlat1.xxxx + u_xlat4;
					    u_xlat0 = u_xlat3 * u_xlat1.wwzw + u_xlat0;
					    u_xlat2 = u_xlat3 * u_xlat3 + u_xlat2;
					    u_xlat2 = max(u_xlat2, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat3 = inversesqrt(u_xlat2);
					    u_xlat2 = u_xlat2 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat2 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat2;
					    u_xlat0 = u_xlat0 * u_xlat3;
					    u_xlat0 = max(u_xlat0, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat0 = u_xlat2 * u_xlat0;
					    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
					    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
					    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    u_xlat2.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    u_xlat15 = u_xlat1.y * u_xlat1.y;
					    u_xlat15 = u_xlat1.x * u_xlat1.x + (-u_xlat15);
					    u_xlat1 = u_xlat1.ywzx * u_xlat1;
					    u_xlat3.x = dot(unity_SHBr, u_xlat1);
					    u_xlat3.y = dot(unity_SHBg, u_xlat1);
					    u_xlat3.z = dot(unity_SHBb, u_xlat1);
					    u_xlat1.xyz = unity_SHC.xyz * vec3(u_xlat15) + u_xlat3.xyz;
					    vs_TEXCOORD6.xyz = u_xlat0.xyz * u_xlat2.xyz + u_xlat1.xyz;
					    vs_TEXCOORD9 = vec4(0.0, 0.0, 0.0, 0.0);
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
						vec4 unused_0_0[4];
						vec4 _Color;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
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
						vec4 unused_3_4;
						vec4 unity_WorldTransformParams;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out float vs_TEXCOORD8;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec4 vs_TEXCOORD7;
					out vec4 vs_TEXCOORD9;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					float u_xlat6;
					float u_xlat12;
					float u_xlat19;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD8 = u_xlat0.z;
					    vs_TEXCOORD7.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat1.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    vs_TEXCOORD1.x = u_xlat1.z;
					    u_xlat12 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat19 = inversesqrt(u_xlat19);
					    u_xlat2 = vec4(u_xlat19) * u_xlat2.xyzz;
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat2.wxy;
					    u_xlat3.xyz = u_xlat2.ywx * u_xlat1.yzx + (-u_xlat3.xyz);
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    vs_TEXCOORD1.y = u_xlat3.x;
					    u_xlat4.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat4.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
					    u_xlat4.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
					    u_xlat4.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat4.xyz;
					    vs_TEXCOORD1.w = u_xlat4.x;
					    vs_TEXCOORD1.z = u_xlat2.x;
					    vs_TEXCOORD2.x = u_xlat1.x;
					    vs_TEXCOORD3.x = u_xlat1.y;
					    vs_TEXCOORD2.y = u_xlat3.y;
					    vs_TEXCOORD3.y = u_xlat3.z;
					    vs_TEXCOORD2.w = u_xlat4.y;
					    vs_TEXCOORD2.z = u_xlat2.y;
					    vs_TEXCOORD3.w = u_xlat4.z;
					    vs_TEXCOORD3.z = u_xlat2.w;
					    vs_TEXCOORD4 = in_COLOR0 * _Color;
					    vs_TEXCOORD5.xyz = in_TANGENT0.xyz;
					    u_xlat1 = (-u_xlat4.xxxx) + unity_4LightPosX0;
					    u_xlat3 = (-u_xlat4.yyyy) + unity_4LightPosY0;
					    u_xlat4 = (-u_xlat4.zzzz) + unity_4LightPosZ0;
					    u_xlat5 = u_xlat2.yyyy * u_xlat3;
					    u_xlat3 = u_xlat3 * u_xlat3;
					    u_xlat3 = u_xlat1 * u_xlat1 + u_xlat3;
					    u_xlat1 = u_xlat1 * u_xlat2.xxxx + u_xlat5;
					    u_xlat1 = u_xlat4 * u_xlat2.wwzw + u_xlat1;
					    u_xlat3 = u_xlat4 * u_xlat4 + u_xlat3;
					    u_xlat3 = max(u_xlat3, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat4 = inversesqrt(u_xlat3);
					    u_xlat3 = u_xlat3 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat3 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat3;
					    u_xlat1 = u_xlat1 * u_xlat4;
					    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat1 = u_xlat3 * u_xlat1;
					    u_xlat3.xyz = u_xlat1.yyy * unity_LightColor[1].xyz;
					    u_xlat3.xyz = unity_LightColor[0].xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat1.xyz = unity_LightColor[2].xyz * u_xlat1.zzz + u_xlat3.xyz;
					    u_xlat1.xyz = unity_LightColor[3].xyz * u_xlat1.www + u_xlat1.xyz;
					    u_xlat3.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
					    u_xlat3.xyz = u_xlat1.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
					    u_xlat12 = u_xlat2.y * u_xlat2.y;
					    u_xlat12 = u_xlat2.x * u_xlat2.x + (-u_xlat12);
					    u_xlat2 = u_xlat2.ywzx * u_xlat2;
					    u_xlat4.x = dot(unity_SHBr, u_xlat2);
					    u_xlat4.y = dot(unity_SHBg, u_xlat2);
					    u_xlat4.z = dot(unity_SHBb, u_xlat2);
					    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat12) + u_xlat4.xyz;
					    vs_TEXCOORD6.xyz = u_xlat1.xyz * u_xlat3.xyz + u_xlat2.xyz;
					    u_xlat6 = u_xlat0.y * _ProjectionParams.x;
					    u_xlat0.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat0.w = u_xlat6 * 0.5;
					    vs_TEXCOORD7.xy = u_xlat0.zz + u_xlat0.xw;
					    vs_TEXCOORD9 = vec4(0.0, 0.0, 0.0, 0.0);
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
						vec4 unused_0_2[2];
						vec4 _UIAreaUV;
						vec4 unused_0_4;
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
					layout(std140) uniform UnityPerDraw {
						vec4 unused_3_0[12];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_3[2];
					};
					layout(std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _FrontPageTex;
					uniform  sampler2D _BackPageTex;
					uniform  sampler3D unity_ProbeVolumeSH;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					bool u_xlatb1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					bvec2 u_xlatb3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					float u_xlat13;
					vec2 u_xlat15;
					float u_xlat18;
					float u_xlat19;
					void main()
					{
					    u_xlat6.x = vs_TEXCOORD1.w;
					    u_xlat6.y = vs_TEXCOORD2.w;
					    u_xlat6.z = vs_TEXCOORD3.w;
					    u_xlat1.xyz = (-u_xlat6.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat1.yyy * vs_TEXCOORD2.xyz;
					    u_xlat1.xyw = vs_TEXCOORD1.xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat1.xyz = vs_TEXCOORD3.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3.xy = vs_TEXCOORD0.xy + (-_UIAreaUV.xy);
					    u_xlat15.xy = (-_UIAreaUV.xy) + _UIAreaUV.zw;
					    u_xlat3.xy = u_xlat3.xy / u_xlat15.xy;
					    u_xlat4 = texture(_FrontPageTex, u_xlat3.xy);
					    u_xlat3.z = (-u_xlat3.x) + 1.0;
					    u_xlat5 = texture(_BackPageTex, u_xlat3.zy);
					    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
					    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
					    u_xlatb3.xy = greaterThanEqual(vec4(0.25, 0.25, 0.0, 0.0), u_xlat3.xyxx).xy;
					    u_xlat3.x = u_xlatb3.x ? float(1.0) : 0.0;
					    u_xlat3.y = u_xlatb3.y ? float(1.0) : 0.0;
					;
					    u_xlat0.x = u_xlat3.y * u_xlat3.x;
					    u_xlat1.x = dot(u_xlat1.xyz, unity_ObjectToWorld[1].xyz);
					    u_xlatb1 = u_xlat1.x>=0.0;
					    u_xlat7.x = u_xlatb1 ? 1.0 : float(0.0);
					    u_xlat7.x = u_xlat0.x * u_xlat7.x;
					    u_xlat13 = u_xlat4.w * u_xlat7.x;
					    u_xlat0.x = (u_xlatb1) ? 0.0 : u_xlat0.x;
					    u_xlat1.x = u_xlat5.w * u_xlat0.x;
					    u_xlat7.x = (-u_xlat7.x) * u_xlat4.w + 1.0;
					    u_xlat3.xyz = vec3(u_xlat13) * u_xlat4.xyz;
					    u_xlat7.xyz = u_xlat2.xyz * u_xlat7.xxx + u_xlat3.xyz;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat5.w + 1.0;
					    u_xlat2.xyz = u_xlat1.xxx * u_xlat5.xyz;
					    u_xlat1.xyz = u_xlat7.xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD1.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.y = dot(vs_TEXCOORD2.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(vs_TEXCOORD3.xyz, unity_WorldToObject[1].xyz);
					    u_xlatb0 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb0){
					        u_xlatb0 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat3.xyz = vs_TEXCOORD2.www * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat3.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD1.www + u_xlat3.xyz;
					        u_xlat3.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD3.www + u_xlat3.xyz;
					        u_xlat3.xyz = u_xlat3.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat0.xyz = (bool(u_xlatb0)) ? u_xlat3.xyz : u_xlat6.xyz;
					        u_xlat0.xyz = u_xlat0.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat0.yzw = u_xlat0.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat6.x = u_xlat0.y * 0.25;
					        u_xlat19 = unity_ProbeVolumeParams.z * 0.5;
					        u_xlat3.x = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
					        u_xlat6.x = max(u_xlat6.x, u_xlat19);
					        u_xlat0.x = min(u_xlat3.x, u_xlat6.x);
					        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat0.xzw);
					        u_xlat4.xyz = u_xlat0.xzw + vec3(0.25, 0.0, 0.0);
					        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xyz);
					        u_xlat0.xyz = u_xlat0.xzw + vec3(0.5, 0.0, 0.0);
					        u_xlat0 = texture(unity_ProbeVolumeSH, u_xlat0.xyz);
					        u_xlat2.w = 1.0;
					        u_xlat3.x = dot(u_xlat3, u_xlat2);
					        u_xlat3.y = dot(u_xlat4, u_xlat2);
					        u_xlat3.z = dot(u_xlat0, u_xlat2);
					    } else {
					        u_xlat2.w = 1.0;
					        u_xlat3.x = dot(unity_SHAr, u_xlat2);
					        u_xlat3.y = dot(unity_SHAg, u_xlat2);
					        u_xlat3.z = dot(unity_SHAb, u_xlat2);
					    }
					    u_xlat0.xyz = u_xlat3.xyz + vs_TEXCOORD6.xyz;
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat18 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat18 = max(u_xlat18, 0.0);
					    u_xlat2.xyz = u_xlat1.xyz * _LightColor0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat0.xyz;
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
						vec4 unused_0_2[2];
						vec4 _UIAreaUV;
						vec4 unused_0_4;
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
					layout(std140) uniform UnityPerDraw {
						vec4 unused_3_0[12];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_3[2];
					};
					layout(std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _FrontPageTex;
					uniform  sampler2D _BackPageTex;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler3D unity_ProbeVolumeSH;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD6;
					in  vec4 vs_TEXCOORD7;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					bool u_xlatb1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					bvec2 u_xlatb3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					float u_xlat13;
					vec2 u_xlat15;
					float u_xlat18;
					float u_xlat19;
					float u_xlat20;
					void main()
					{
					    u_xlat6.x = vs_TEXCOORD1.w;
					    u_xlat6.y = vs_TEXCOORD2.w;
					    u_xlat6.z = vs_TEXCOORD3.w;
					    u_xlat1.xyz = (-u_xlat6.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat1.yyy * vs_TEXCOORD2.xyz;
					    u_xlat1.xyw = vs_TEXCOORD1.xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat1.xyz = vs_TEXCOORD3.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3.xy = vs_TEXCOORD0.xy + (-_UIAreaUV.xy);
					    u_xlat15.xy = (-_UIAreaUV.xy) + _UIAreaUV.zw;
					    u_xlat3.xy = u_xlat3.xy / u_xlat15.xy;
					    u_xlat4 = texture(_FrontPageTex, u_xlat3.xy);
					    u_xlat3.z = (-u_xlat3.x) + 1.0;
					    u_xlat5 = texture(_BackPageTex, u_xlat3.zy);
					    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
					    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
					    u_xlatb3.xy = greaterThanEqual(vec4(0.25, 0.25, 0.0, 0.0), u_xlat3.xyxx).xy;
					    u_xlat3.x = u_xlatb3.x ? float(1.0) : 0.0;
					    u_xlat3.y = u_xlatb3.y ? float(1.0) : 0.0;
					;
					    u_xlat0.x = u_xlat3.y * u_xlat3.x;
					    u_xlat1.x = dot(u_xlat1.xyz, unity_ObjectToWorld[1].xyz);
					    u_xlatb1 = u_xlat1.x>=0.0;
					    u_xlat7.x = u_xlatb1 ? 1.0 : float(0.0);
					    u_xlat7.x = u_xlat0.x * u_xlat7.x;
					    u_xlat13 = u_xlat4.w * u_xlat7.x;
					    u_xlat0.x = (u_xlatb1) ? 0.0 : u_xlat0.x;
					    u_xlat1.x = u_xlat5.w * u_xlat0.x;
					    u_xlat7.x = (-u_xlat7.x) * u_xlat4.w + 1.0;
					    u_xlat3.xyz = vec3(u_xlat13) * u_xlat4.xyz;
					    u_xlat7.xyz = u_xlat2.xyz * u_xlat7.xxx + u_xlat3.xyz;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat5.w + 1.0;
					    u_xlat2.xyz = u_xlat1.xxx * u_xlat5.xyz;
					    u_xlat1.xyz = u_xlat7.xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat2.xy = vs_TEXCOORD7.xy / vs_TEXCOORD7.ww;
					    u_xlat2 = texture(_ShadowMapTexture, u_xlat2.xy);
					    u_xlat3.x = dot(vs_TEXCOORD1.xyz, unity_WorldToObject[1].xyz);
					    u_xlat3.y = dot(vs_TEXCOORD2.xyz, unity_WorldToObject[1].xyz);
					    u_xlat3.z = dot(vs_TEXCOORD3.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.xyz = u_xlat2.xxx * _LightColor0.xyz;
					    u_xlatb0 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb0){
					        u_xlatb0 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat4.xyz = vs_TEXCOORD2.www * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD1.www + u_xlat4.xyz;
					        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD3.www + u_xlat4.xyz;
					        u_xlat4.xyz = u_xlat4.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat0.xyz = (bool(u_xlatb0)) ? u_xlat4.xyz : u_xlat6.xyz;
					        u_xlat0.xyz = u_xlat0.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat0.yzw = u_xlat0.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat6.x = u_xlat0.y * 0.25;
					        u_xlat19 = unity_ProbeVolumeParams.z * 0.5;
					        u_xlat20 = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
					        u_xlat6.x = max(u_xlat6.x, u_xlat19);
					        u_xlat0.x = min(u_xlat20, u_xlat6.x);
					        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat0.xzw);
					        u_xlat5.xyz = u_xlat0.xzw + vec3(0.25, 0.0, 0.0);
					        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xyz);
					        u_xlat0.xyz = u_xlat0.xzw + vec3(0.5, 0.0, 0.0);
					        u_xlat0 = texture(unity_ProbeVolumeSH, u_xlat0.xyz);
					        u_xlat3.w = 1.0;
					        u_xlat4.x = dot(u_xlat4, u_xlat3);
					        u_xlat4.y = dot(u_xlat5, u_xlat3);
					        u_xlat4.z = dot(u_xlat0, u_xlat3);
					    } else {
					        u_xlat3.w = 1.0;
					        u_xlat4.x = dot(unity_SHAr, u_xlat3);
					        u_xlat4.y = dot(unity_SHAg, u_xlat3);
					        u_xlat4.z = dot(unity_SHAb, u_xlat3);
					    }
					    u_xlat0.xyz = u_xlat4.xyz + vs_TEXCOORD6.xyz;
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat18 = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat18 = max(u_xlat18, 0.0);
					    u_xlat2.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    SV_Target0.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat0.xyz;
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
						vec4 unused_0_2[2];
						vec4 _UIAreaUV;
						vec4 unused_0_4;
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
					layout(std140) uniform UnityPerDraw {
						vec4 unused_3_0[12];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_3[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unity_FogParams;
					};
					layout(std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _FrontPageTex;
					uniform  sampler2D _BackPageTex;
					uniform  sampler3D unity_ProbeVolumeSH;
					in  vec2 vs_TEXCOORD0;
					in  float vs_TEXCOORD8;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD6;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					bool u_xlatb1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					bvec2 u_xlatb3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					float u_xlat13;
					vec2 u_xlat15;
					float u_xlat18;
					float u_xlat19;
					void main()
					{
					    u_xlat6.x = vs_TEXCOORD1.w;
					    u_xlat6.y = vs_TEXCOORD2.w;
					    u_xlat6.z = vs_TEXCOORD3.w;
					    u_xlat1.xyz = (-u_xlat6.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat1.yyy * vs_TEXCOORD2.xyz;
					    u_xlat1.xyw = vs_TEXCOORD1.xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat1.xyz = vs_TEXCOORD3.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3.xy = vs_TEXCOORD0.xy + (-_UIAreaUV.xy);
					    u_xlat15.xy = (-_UIAreaUV.xy) + _UIAreaUV.zw;
					    u_xlat3.xy = u_xlat3.xy / u_xlat15.xy;
					    u_xlat4 = texture(_FrontPageTex, u_xlat3.xy);
					    u_xlat3.z = (-u_xlat3.x) + 1.0;
					    u_xlat5 = texture(_BackPageTex, u_xlat3.zy);
					    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
					    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
					    u_xlatb3.xy = greaterThanEqual(vec4(0.25, 0.25, 0.0, 0.0), u_xlat3.xyxx).xy;
					    u_xlat3.x = u_xlatb3.x ? float(1.0) : 0.0;
					    u_xlat3.y = u_xlatb3.y ? float(1.0) : 0.0;
					;
					    u_xlat0.x = u_xlat3.y * u_xlat3.x;
					    u_xlat1.x = dot(u_xlat1.xyz, unity_ObjectToWorld[1].xyz);
					    u_xlatb1 = u_xlat1.x>=0.0;
					    u_xlat7.x = u_xlatb1 ? 1.0 : float(0.0);
					    u_xlat7.x = u_xlat0.x * u_xlat7.x;
					    u_xlat13 = u_xlat4.w * u_xlat7.x;
					    u_xlat0.x = (u_xlatb1) ? 0.0 : u_xlat0.x;
					    u_xlat1.x = u_xlat5.w * u_xlat0.x;
					    u_xlat7.x = (-u_xlat7.x) * u_xlat4.w + 1.0;
					    u_xlat3.xyz = vec3(u_xlat13) * u_xlat4.xyz;
					    u_xlat7.xyz = u_xlat2.xyz * u_xlat7.xxx + u_xlat3.xyz;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat5.w + 1.0;
					    u_xlat2.xyz = u_xlat1.xxx * u_xlat5.xyz;
					    u_xlat1.xyz = u_xlat7.xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD1.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.y = dot(vs_TEXCOORD2.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(vs_TEXCOORD3.xyz, unity_WorldToObject[1].xyz);
					    u_xlatb0 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb0){
					        u_xlatb0 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat3.xyz = vs_TEXCOORD2.www * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat3.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD1.www + u_xlat3.xyz;
					        u_xlat3.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD3.www + u_xlat3.xyz;
					        u_xlat3.xyz = u_xlat3.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat0.xyz = (bool(u_xlatb0)) ? u_xlat3.xyz : u_xlat6.xyz;
					        u_xlat0.xyz = u_xlat0.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat0.yzw = u_xlat0.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat6.x = u_xlat0.y * 0.25;
					        u_xlat19 = unity_ProbeVolumeParams.z * 0.5;
					        u_xlat3.x = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
					        u_xlat6.x = max(u_xlat6.x, u_xlat19);
					        u_xlat0.x = min(u_xlat3.x, u_xlat6.x);
					        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat0.xzw);
					        u_xlat4.xyz = u_xlat0.xzw + vec3(0.25, 0.0, 0.0);
					        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xyz);
					        u_xlat0.xyz = u_xlat0.xzw + vec3(0.5, 0.0, 0.0);
					        u_xlat0 = texture(unity_ProbeVolumeSH, u_xlat0.xyz);
					        u_xlat2.w = 1.0;
					        u_xlat3.x = dot(u_xlat3, u_xlat2);
					        u_xlat3.y = dot(u_xlat4, u_xlat2);
					        u_xlat3.z = dot(u_xlat0, u_xlat2);
					    } else {
					        u_xlat2.w = 1.0;
					        u_xlat3.x = dot(unity_SHAr, u_xlat2);
					        u_xlat3.y = dot(unity_SHAg, u_xlat2);
					        u_xlat3.z = dot(unity_SHAb, u_xlat2);
					    }
					    u_xlat0.xyz = u_xlat3.xyz + vs_TEXCOORD6.xyz;
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat18 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat18 = max(u_xlat18, 0.0);
					    u_xlat2.xyz = u_xlat1.xyz * _LightColor0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat0.xyz;
					    u_xlat18 = vs_TEXCOORD8 / _ProjectionParams.y;
					    u_xlat18 = (-u_xlat18) + 1.0;
					    u_xlat18 = u_xlat18 * _ProjectionParams.z;
					    u_xlat18 = max(u_xlat18, 0.0);
					    u_xlat18 = u_xlat18 * unity_FogParams.z + unity_FogParams.w;
					    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
					    SV_Target0.xyz = vec3(u_xlat18) * u_xlat0.xyz + unity_FogColor.xyz;
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
						vec4 unused_0_2[2];
						vec4 _UIAreaUV;
						vec4 unused_0_4;
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
					layout(std140) uniform UnityPerDraw {
						vec4 unused_3_0[12];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_3[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unity_FogParams;
					};
					layout(std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _FrontPageTex;
					uniform  sampler2D _BackPageTex;
					uniform  sampler2D _ShadowMapTexture;
					uniform  sampler3D unity_ProbeVolumeSH;
					in  vec2 vs_TEXCOORD0;
					in  float vs_TEXCOORD8;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD6;
					in  vec4 vs_TEXCOORD7;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					bool u_xlatb1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					bvec2 u_xlatb3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat7;
					float u_xlat13;
					vec2 u_xlat15;
					float u_xlat18;
					float u_xlat19;
					float u_xlat20;
					void main()
					{
					    u_xlat6.x = vs_TEXCOORD1.w;
					    u_xlat6.y = vs_TEXCOORD2.w;
					    u_xlat6.z = vs_TEXCOORD3.w;
					    u_xlat1.xyz = (-u_xlat6.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat1.yyy * vs_TEXCOORD2.xyz;
					    u_xlat1.xyw = vs_TEXCOORD1.xyz * u_xlat1.xxx + u_xlat2.xyz;
					    u_xlat1.xyz = vs_TEXCOORD3.xyz * u_xlat1.zzz + u_xlat1.xyw;
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3.xy = vs_TEXCOORD0.xy + (-_UIAreaUV.xy);
					    u_xlat15.xy = (-_UIAreaUV.xy) + _UIAreaUV.zw;
					    u_xlat3.xy = u_xlat3.xy / u_xlat15.xy;
					    u_xlat4 = texture(_FrontPageTex, u_xlat3.xy);
					    u_xlat3.z = (-u_xlat3.x) + 1.0;
					    u_xlat5 = texture(_BackPageTex, u_xlat3.zy);
					    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
					    u_xlat3.xy = u_xlat3.xy * u_xlat3.xy;
					    u_xlatb3.xy = greaterThanEqual(vec4(0.25, 0.25, 0.0, 0.0), u_xlat3.xyxx).xy;
					    u_xlat3.x = u_xlatb3.x ? float(1.0) : 0.0;
					    u_xlat3.y = u_xlatb3.y ? float(1.0) : 0.0;
					;
					    u_xlat0.x = u_xlat3.y * u_xlat3.x;
					    u_xlat1.x = dot(u_xlat1.xyz, unity_ObjectToWorld[1].xyz);
					    u_xlatb1 = u_xlat1.x>=0.0;
					    u_xlat7.x = u_xlatb1 ? 1.0 : float(0.0);
					    u_xlat7.x = u_xlat0.x * u_xlat7.x;
					    u_xlat13 = u_xlat4.w * u_xlat7.x;
					    u_xlat0.x = (u_xlatb1) ? 0.0 : u_xlat0.x;
					    u_xlat1.x = u_xlat5.w * u_xlat0.x;
					    u_xlat7.x = (-u_xlat7.x) * u_xlat4.w + 1.0;
					    u_xlat3.xyz = vec3(u_xlat13) * u_xlat4.xyz;
					    u_xlat7.xyz = u_xlat2.xyz * u_xlat7.xxx + u_xlat3.xyz;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat5.w + 1.0;
					    u_xlat2.xyz = u_xlat1.xxx * u_xlat5.xyz;
					    u_xlat1.xyz = u_xlat7.xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat2.xy = vs_TEXCOORD7.xy / vs_TEXCOORD7.ww;
					    u_xlat2 = texture(_ShadowMapTexture, u_xlat2.xy);
					    u_xlat3.x = dot(vs_TEXCOORD1.xyz, unity_WorldToObject[1].xyz);
					    u_xlat3.y = dot(vs_TEXCOORD2.xyz, unity_WorldToObject[1].xyz);
					    u_xlat3.z = dot(vs_TEXCOORD3.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.xyz = u_xlat2.xxx * _LightColor0.xyz;
					    u_xlatb0 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb0){
					        u_xlatb0 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat4.xyz = vs_TEXCOORD2.www * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD1.www + u_xlat4.xyz;
					        u_xlat4.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD3.www + u_xlat4.xyz;
					        u_xlat4.xyz = u_xlat4.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat0.xyz = (bool(u_xlatb0)) ? u_xlat4.xyz : u_xlat6.xyz;
					        u_xlat0.xyz = u_xlat0.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat0.yzw = u_xlat0.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat6.x = u_xlat0.y * 0.25;
					        u_xlat19 = unity_ProbeVolumeParams.z * 0.5;
					        u_xlat20 = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
					        u_xlat6.x = max(u_xlat6.x, u_xlat19);
					        u_xlat0.x = min(u_xlat20, u_xlat6.x);
					        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat0.xzw);
					        u_xlat5.xyz = u_xlat0.xzw + vec3(0.25, 0.0, 0.0);
					        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xyz);
					        u_xlat0.xyz = u_xlat0.xzw + vec3(0.5, 0.0, 0.0);
					        u_xlat0 = texture(unity_ProbeVolumeSH, u_xlat0.xyz);
					        u_xlat3.w = 1.0;
					        u_xlat4.x = dot(u_xlat4, u_xlat3);
					        u_xlat4.y = dot(u_xlat5, u_xlat3);
					        u_xlat4.z = dot(u_xlat0, u_xlat3);
					    } else {
					        u_xlat3.w = 1.0;
					        u_xlat4.x = dot(unity_SHAr, u_xlat3);
					        u_xlat4.y = dot(unity_SHAg, u_xlat3);
					        u_xlat4.z = dot(unity_SHAb, u_xlat3);
					    }
					    u_xlat0.xyz = u_xlat4.xyz + vs_TEXCOORD6.xyz;
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat18 = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat18 = max(u_xlat18, 0.0);
					    u_xlat2.xyz = u_xlat1.xyz * u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat2.xyz * vec3(u_xlat18) + u_xlat0.xyz;
					    u_xlat18 = vs_TEXCOORD8 / _ProjectionParams.y;
					    u_xlat18 = (-u_xlat18) + 1.0;
					    u_xlat18 = u_xlat18 * _ProjectionParams.z;
					    u_xlat18 = max(u_xlat18, 0.0);
					    u_xlat18 = u_xlat18 * unity_FogParams.z + unity_FogParams.w;
					    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
					    SV_Target0.xyz = vec3(u_xlat18) * u_xlat0.xyz + unity_FogColor.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
			}
		}
		Pass {
			Name "FORWARD"
			Tags { "LIGHTMODE" = "ForwardAdd" "RenderType" = "Diffuse" }
			Blend One One, One One
			ZClip Off
			ZWrite Off
			Cull Off
			GpuProgramID 74535
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
						vec4 unused_0_0[8];
						vec4 _Color;
						vec4 unused_0_2;
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
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
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
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD4.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD5 = in_COLOR0 * _Color;
					    vs_TEXCOORD6.xyz = in_TANGENT0.xyz;
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
						vec4 unused_0_0[4];
						vec4 _Color;
						vec4 unused_0_2;
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
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
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
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD4.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD5 = in_COLOR0 * _Color;
					    vs_TEXCOORD6.xyz = in_TANGENT0.xyz;
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
						vec4 unused_0_0[8];
						vec4 _Color;
						vec4 unused_0_2;
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
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
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
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD4.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD5 = in_COLOR0 * _Color;
					    vs_TEXCOORD6.xyz = in_TANGENT0.xyz;
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
						vec4 unused_0_0[8];
						vec4 _Color;
						vec4 unused_0_2;
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
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
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
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD4.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD5 = in_COLOR0 * _Color;
					    vs_TEXCOORD6.xyz = in_TANGENT0.xyz;
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
						vec4 unused_0_0[8];
						vec4 _Color;
						vec4 unused_0_2;
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
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
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
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD4.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD5 = in_COLOR0 * _Color;
					    vs_TEXCOORD6.xyz = in_TANGENT0.xyz;
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
						vec4 unused_0_0[8];
						vec4 _Color;
						vec4 unused_0_2;
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
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out float vs_TEXCOORD8;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD8 = u_xlat0.z;
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
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD4.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD5 = in_COLOR0 * _Color;
					    vs_TEXCOORD6.xyz = in_TANGENT0.xyz;
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
						vec4 unused_0_0[4];
						vec4 _Color;
						vec4 unused_0_2;
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
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out float vs_TEXCOORD8;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD8 = u_xlat0.z;
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
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD4.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD5 = in_COLOR0 * _Color;
					    vs_TEXCOORD6.xyz = in_TANGENT0.xyz;
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
						vec4 unused_0_0[8];
						vec4 _Color;
						vec4 unused_0_2;
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
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out float vs_TEXCOORD8;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD8 = u_xlat0.z;
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
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD4.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD5 = in_COLOR0 * _Color;
					    vs_TEXCOORD6.xyz = in_TANGENT0.xyz;
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
						vec4 unused_0_0[8];
						vec4 _Color;
						vec4 unused_0_2;
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
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out float vs_TEXCOORD8;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD8 = u_xlat0.z;
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
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD4.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD5 = in_COLOR0 * _Color;
					    vs_TEXCOORD6.xyz = in_TANGENT0.xyz;
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
						vec4 unused_0_0[8];
						vec4 _Color;
						vec4 unused_0_2;
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
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out float vs_TEXCOORD8;
					out vec3 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD8 = u_xlat0.z;
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
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD4.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD5 = in_COLOR0 * _Color;
					    vs_TEXCOORD6.xyz = in_TANGENT0.xyz;
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
						vec4 unused_0_4;
						vec4 _UIAreaUV;
						vec4 unused_0_6;
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
					layout(std140) uniform UnityPerDraw {
						vec4 unused_3_0[12];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_3[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _FrontPageTex;
					uniform  sampler2D _BackPageTex;
					uniform  sampler2D _LightTexture0;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bvec4 u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec2 u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
					    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat0.x = dot(u_xlat0.xyz, unity_ObjectToWorld[1].xyz);
					    u_xlatb0.x = u_xlat0.x>=0.0;
					    u_xlat8.xy = vs_TEXCOORD0.xy + (-_UIAreaUV.xy);
					    u_xlat1.xy = (-_UIAreaUV.xy) + _UIAreaUV.zw;
					    u_xlat1.xy = u_xlat8.xy / u_xlat1.xy;
					    u_xlat8.xy = u_xlat1.xy + vec2(-0.5, -0.5);
					    u_xlat8.xy = u_xlat8.xy * u_xlat8.xy;
					    u_xlatb0.zw = greaterThanEqual(vec4(0.0, 0.0, 0.25, 0.25), u_xlat8.xxxy).zw;
					    u_xlat4.x = u_xlatb0.x ? float(1.0) : 0.0;
					    u_xlat4.y = u_xlatb0.z ? float(1.0) : 0.0;
					    u_xlat4.z = u_xlatb0.w ? float(1.0) : 0.0;
					;
					    u_xlat8.x = u_xlat4.z * u_xlat4.y;
					    u_xlat4.x = u_xlat8.x * u_xlat4.x;
					    u_xlat0.x = (u_xlatb0.x) ? 0.0 : u_xlat8.x;
					    u_xlat2 = texture(_FrontPageTex, u_xlat1.xy);
					    u_xlat8.x = u_xlat4.x * u_xlat2.w;
					    u_xlat4.x = (-u_xlat4.x) * u_xlat2.w + 1.0;
					    u_xlat2.xyz = u_xlat8.xxx * u_xlat2.xyz;
					    u_xlat3 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xxx + u_xlat2.xyz;
					    u_xlat1.z = (-u_xlat1.x) + 1.0;
					    u_xlat1 = texture(_BackPageTex, u_xlat1.zy);
					    u_xlat2.x = u_xlat0.x * u_xlat1.w;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat1.w + 1.0;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
					    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = vs_TEXCOORD4.yyy * unity_WorldToLight[1].xyz;
					    u_xlat1.xyz = unity_WorldToLight[0].xyz * vs_TEXCOORD4.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_WorldToLight[2].xyz * vs_TEXCOORD4.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + unity_WorldToLight[3].xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1 = texture(_LightTexture0, vec2(u_xlat12));
					    u_xlat1.xyz = u_xlat1.xxx * _LightColor0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD1.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.y = dot(vs_TEXCOORD2.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(vs_TEXCOORD3.xyz, unity_WorldToObject[1].xyz);
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat12 = max(u_xlat12, 0.0);
					    SV_Target0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
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
						vec4 unused_0_2[2];
						vec4 _UIAreaUV;
						vec4 unused_0_4;
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
					layout(std140) uniform UnityPerDraw {
						vec4 unused_3_0[12];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_3[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _FrontPageTex;
					uniform  sampler2D _BackPageTex;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bvec4 u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec2 u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
					    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat0.x = dot(u_xlat0.xyz, unity_ObjectToWorld[1].xyz);
					    u_xlatb0.x = u_xlat0.x>=0.0;
					    u_xlat8.xy = vs_TEXCOORD0.xy + (-_UIAreaUV.xy);
					    u_xlat1.xy = (-_UIAreaUV.xy) + _UIAreaUV.zw;
					    u_xlat1.xy = u_xlat8.xy / u_xlat1.xy;
					    u_xlat8.xy = u_xlat1.xy + vec2(-0.5, -0.5);
					    u_xlat8.xy = u_xlat8.xy * u_xlat8.xy;
					    u_xlatb0.zw = greaterThanEqual(vec4(0.0, 0.0, 0.25, 0.25), u_xlat8.xxxy).zw;
					    u_xlat4.x = u_xlatb0.x ? float(1.0) : 0.0;
					    u_xlat4.y = u_xlatb0.z ? float(1.0) : 0.0;
					    u_xlat4.z = u_xlatb0.w ? float(1.0) : 0.0;
					;
					    u_xlat8.x = u_xlat4.z * u_xlat4.y;
					    u_xlat4.x = u_xlat8.x * u_xlat4.x;
					    u_xlat0.x = (u_xlatb0.x) ? 0.0 : u_xlat8.x;
					    u_xlat2 = texture(_FrontPageTex, u_xlat1.xy);
					    u_xlat8.x = u_xlat4.x * u_xlat2.w;
					    u_xlat4.x = (-u_xlat4.x) * u_xlat2.w + 1.0;
					    u_xlat2.xyz = u_xlat8.xxx * u_xlat2.xyz;
					    u_xlat3 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xxx + u_xlat2.xyz;
					    u_xlat1.z = (-u_xlat1.x) + 1.0;
					    u_xlat1 = texture(_BackPageTex, u_xlat1.zy);
					    u_xlat2.x = u_xlat0.x * u_xlat1.w;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat1.w + 1.0;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
					    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    u_xlat1.x = dot(vs_TEXCOORD1.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.y = dot(vs_TEXCOORD2.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(vs_TEXCOORD3.xyz, unity_WorldToObject[1].xyz);
					    u_xlat12 = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat12 = max(u_xlat12, 0.0);
					    SV_Target0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
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
						vec4 unused_0_4;
						vec4 _UIAreaUV;
						vec4 unused_0_6;
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
					layout(std140) uniform UnityPerDraw {
						vec4 unused_3_0[12];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_3[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _FrontPageTex;
					uniform  sampler2D _BackPageTex;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bvec4 u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec2 u_xlat8;
					float u_xlat12;
					bool u_xlatb12;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
					    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat0.x = dot(u_xlat0.xyz, unity_ObjectToWorld[1].xyz);
					    u_xlatb0.x = u_xlat0.x>=0.0;
					    u_xlat8.xy = vs_TEXCOORD0.xy + (-_UIAreaUV.xy);
					    u_xlat1.xy = (-_UIAreaUV.xy) + _UIAreaUV.zw;
					    u_xlat1.xy = u_xlat8.xy / u_xlat1.xy;
					    u_xlat8.xy = u_xlat1.xy + vec2(-0.5, -0.5);
					    u_xlat8.xy = u_xlat8.xy * u_xlat8.xy;
					    u_xlatb0.zw = greaterThanEqual(vec4(0.0, 0.0, 0.25, 0.25), u_xlat8.xxxy).zw;
					    u_xlat4.x = u_xlatb0.x ? float(1.0) : 0.0;
					    u_xlat4.y = u_xlatb0.z ? float(1.0) : 0.0;
					    u_xlat4.z = u_xlatb0.w ? float(1.0) : 0.0;
					;
					    u_xlat8.x = u_xlat4.z * u_xlat4.y;
					    u_xlat4.x = u_xlat8.x * u_xlat4.x;
					    u_xlat0.x = (u_xlatb0.x) ? 0.0 : u_xlat8.x;
					    u_xlat2 = texture(_FrontPageTex, u_xlat1.xy);
					    u_xlat8.x = u_xlat4.x * u_xlat2.w;
					    u_xlat4.x = (-u_xlat4.x) * u_xlat2.w + 1.0;
					    u_xlat2.xyz = u_xlat8.xxx * u_xlat2.xyz;
					    u_xlat3 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xxx + u_xlat2.xyz;
					    u_xlat1.z = (-u_xlat1.x) + 1.0;
					    u_xlat1 = texture(_BackPageTex, u_xlat1.zy);
					    u_xlat2.x = u_xlat0.x * u_xlat1.w;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat1.w + 1.0;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
					    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1 = vs_TEXCOORD4.yyyy * unity_WorldToLight[1];
					    u_xlat1 = unity_WorldToLight[0] * vs_TEXCOORD4.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToLight[2] * vs_TEXCOORD4.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_WorldToLight[3];
					    u_xlat2.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat2 = texture(_LightTexture0, u_xlat2.xy);
					    u_xlatb12 = 0.0<u_xlat1.z;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1 = texture(_LightTextureB0, u_xlat1.xx);
					    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
					    u_xlat12 = u_xlat2.w * u_xlat12;
					    u_xlat12 = u_xlat1.x * u_xlat12;
					    u_xlat1.xyz = vec3(u_xlat12) * _LightColor0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD1.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.y = dot(vs_TEXCOORD2.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(vs_TEXCOORD3.xyz, unity_WorldToObject[1].xyz);
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat12 = max(u_xlat12, 0.0);
					    SV_Target0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
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
						vec4 unused_0_4;
						vec4 _UIAreaUV;
						vec4 unused_0_6;
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
					layout(std140) uniform UnityPerDraw {
						vec4 unused_3_0[12];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_3[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _FrontPageTex;
					uniform  sampler2D _BackPageTex;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bvec4 u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec2 u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
					    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat0.x = dot(u_xlat0.xyz, unity_ObjectToWorld[1].xyz);
					    u_xlatb0.x = u_xlat0.x>=0.0;
					    u_xlat8.xy = vs_TEXCOORD0.xy + (-_UIAreaUV.xy);
					    u_xlat1.xy = (-_UIAreaUV.xy) + _UIAreaUV.zw;
					    u_xlat1.xy = u_xlat8.xy / u_xlat1.xy;
					    u_xlat8.xy = u_xlat1.xy + vec2(-0.5, -0.5);
					    u_xlat8.xy = u_xlat8.xy * u_xlat8.xy;
					    u_xlatb0.zw = greaterThanEqual(vec4(0.0, 0.0, 0.25, 0.25), u_xlat8.xxxy).zw;
					    u_xlat4.x = u_xlatb0.x ? float(1.0) : 0.0;
					    u_xlat4.y = u_xlatb0.z ? float(1.0) : 0.0;
					    u_xlat4.z = u_xlatb0.w ? float(1.0) : 0.0;
					;
					    u_xlat8.x = u_xlat4.z * u_xlat4.y;
					    u_xlat4.x = u_xlat8.x * u_xlat4.x;
					    u_xlat0.x = (u_xlatb0.x) ? 0.0 : u_xlat8.x;
					    u_xlat2 = texture(_FrontPageTex, u_xlat1.xy);
					    u_xlat8.x = u_xlat4.x * u_xlat2.w;
					    u_xlat4.x = (-u_xlat4.x) * u_xlat2.w + 1.0;
					    u_xlat2.xyz = u_xlat8.xxx * u_xlat2.xyz;
					    u_xlat3 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xxx + u_xlat2.xyz;
					    u_xlat1.z = (-u_xlat1.x) + 1.0;
					    u_xlat1 = texture(_BackPageTex, u_xlat1.zy);
					    u_xlat2.x = u_xlat0.x * u_xlat1.w;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat1.w + 1.0;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
					    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = vs_TEXCOORD4.yyy * unity_WorldToLight[1].xyz;
					    u_xlat1.xyz = unity_WorldToLight[0].xyz * vs_TEXCOORD4.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_WorldToLight[2].xyz * vs_TEXCOORD4.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + unity_WorldToLight[3].xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1 = texture(_LightTexture0, u_xlat1.xyz);
					    u_xlat2 = texture(_LightTextureB0, vec2(u_xlat12));
					    u_xlat12 = u_xlat1.w * u_xlat2.x;
					    u_xlat1.xyz = vec3(u_xlat12) * _LightColor0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD1.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.y = dot(vs_TEXCOORD2.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(vs_TEXCOORD3.xyz, unity_WorldToObject[1].xyz);
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat12 = max(u_xlat12, 0.0);
					    SV_Target0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
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
						vec4 unused_0_4;
						vec4 _UIAreaUV;
						vec4 unused_0_6;
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
					layout(std140) uniform UnityPerDraw {
						vec4 unused_3_0[12];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_3[2];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _FrontPageTex;
					uniform  sampler2D _BackPageTex;
					uniform  sampler2D _LightTexture0;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bvec4 u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec2 u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
					    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat0.x = dot(u_xlat0.xyz, unity_ObjectToWorld[1].xyz);
					    u_xlatb0.x = u_xlat0.x>=0.0;
					    u_xlat8.xy = vs_TEXCOORD0.xy + (-_UIAreaUV.xy);
					    u_xlat1.xy = (-_UIAreaUV.xy) + _UIAreaUV.zw;
					    u_xlat1.xy = u_xlat8.xy / u_xlat1.xy;
					    u_xlat8.xy = u_xlat1.xy + vec2(-0.5, -0.5);
					    u_xlat8.xy = u_xlat8.xy * u_xlat8.xy;
					    u_xlatb0.zw = greaterThanEqual(vec4(0.0, 0.0, 0.25, 0.25), u_xlat8.xxxy).zw;
					    u_xlat4.x = u_xlatb0.x ? float(1.0) : 0.0;
					    u_xlat4.y = u_xlatb0.z ? float(1.0) : 0.0;
					    u_xlat4.z = u_xlatb0.w ? float(1.0) : 0.0;
					;
					    u_xlat8.x = u_xlat4.z * u_xlat4.y;
					    u_xlat4.x = u_xlat8.x * u_xlat4.x;
					    u_xlat0.x = (u_xlatb0.x) ? 0.0 : u_xlat8.x;
					    u_xlat2 = texture(_FrontPageTex, u_xlat1.xy);
					    u_xlat8.x = u_xlat4.x * u_xlat2.w;
					    u_xlat4.x = (-u_xlat4.x) * u_xlat2.w + 1.0;
					    u_xlat2.xyz = u_xlat8.xxx * u_xlat2.xyz;
					    u_xlat3 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xxx + u_xlat2.xyz;
					    u_xlat1.z = (-u_xlat1.x) + 1.0;
					    u_xlat1 = texture(_BackPageTex, u_xlat1.zy);
					    u_xlat2.x = u_xlat0.x * u_xlat1.w;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat1.w + 1.0;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
					    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xy = vs_TEXCOORD4.yy * unity_WorldToLight[1].xy;
					    u_xlat1.xy = unity_WorldToLight[0].xy * vs_TEXCOORD4.xx + u_xlat1.xy;
					    u_xlat1.xy = unity_WorldToLight[2].xy * vs_TEXCOORD4.zz + u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy + unity_WorldToLight[3].xy;
					    u_xlat1 = texture(_LightTexture0, u_xlat1.xy);
					    u_xlat1.xyz = u_xlat1.www * _LightColor0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat1.x = dot(vs_TEXCOORD1.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.y = dot(vs_TEXCOORD2.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(vs_TEXCOORD3.xyz, unity_WorldToObject[1].xyz);
					    u_xlat12 = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat12 = max(u_xlat12, 0.0);
					    SV_Target0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
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
						vec4 unused_0_4;
						vec4 _UIAreaUV;
						vec4 unused_0_6;
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
					layout(std140) uniform UnityPerDraw {
						vec4 unused_3_0[12];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_3[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_4_0;
						vec4 unity_FogParams;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _FrontPageTex;
					uniform  sampler2D _BackPageTex;
					uniform  sampler2D _LightTexture0;
					in  vec2 vs_TEXCOORD0;
					in  float vs_TEXCOORD8;
					in  vec3 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bvec4 u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec2 u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
					    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat0.x = dot(u_xlat0.xyz, unity_ObjectToWorld[1].xyz);
					    u_xlatb0.x = u_xlat0.x>=0.0;
					    u_xlat8.xy = vs_TEXCOORD0.xy + (-_UIAreaUV.xy);
					    u_xlat1.xy = (-_UIAreaUV.xy) + _UIAreaUV.zw;
					    u_xlat1.xy = u_xlat8.xy / u_xlat1.xy;
					    u_xlat8.xy = u_xlat1.xy + vec2(-0.5, -0.5);
					    u_xlat8.xy = u_xlat8.xy * u_xlat8.xy;
					    u_xlatb0.zw = greaterThanEqual(vec4(0.0, 0.0, 0.25, 0.25), u_xlat8.xxxy).zw;
					    u_xlat4.x = u_xlatb0.x ? float(1.0) : 0.0;
					    u_xlat4.y = u_xlatb0.z ? float(1.0) : 0.0;
					    u_xlat4.z = u_xlatb0.w ? float(1.0) : 0.0;
					;
					    u_xlat8.x = u_xlat4.z * u_xlat4.y;
					    u_xlat4.x = u_xlat8.x * u_xlat4.x;
					    u_xlat0.x = (u_xlatb0.x) ? 0.0 : u_xlat8.x;
					    u_xlat2 = texture(_FrontPageTex, u_xlat1.xy);
					    u_xlat8.x = u_xlat4.x * u_xlat2.w;
					    u_xlat4.x = (-u_xlat4.x) * u_xlat2.w + 1.0;
					    u_xlat2.xyz = u_xlat8.xxx * u_xlat2.xyz;
					    u_xlat3 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xxx + u_xlat2.xyz;
					    u_xlat1.z = (-u_xlat1.x) + 1.0;
					    u_xlat1 = texture(_BackPageTex, u_xlat1.zy);
					    u_xlat2.x = u_xlat0.x * u_xlat1.w;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat1.w + 1.0;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
					    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = vs_TEXCOORD4.yyy * unity_WorldToLight[1].xyz;
					    u_xlat1.xyz = unity_WorldToLight[0].xyz * vs_TEXCOORD4.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_WorldToLight[2].xyz * vs_TEXCOORD4.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + unity_WorldToLight[3].xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1 = texture(_LightTexture0, vec2(u_xlat12));
					    u_xlat1.xyz = u_xlat1.xxx * _LightColor0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD1.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.y = dot(vs_TEXCOORD2.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(vs_TEXCOORD3.xyz, unity_WorldToObject[1].xyz);
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat12 = max(u_xlat12, 0.0);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat12 = vs_TEXCOORD8 / _ProjectionParams.y;
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
						vec4 unused_0_2[2];
						vec4 _UIAreaUV;
						vec4 unused_0_4;
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
					layout(std140) uniform UnityPerDraw {
						vec4 unused_3_0[12];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_3[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_4_0;
						vec4 unity_FogParams;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _FrontPageTex;
					uniform  sampler2D _BackPageTex;
					in  vec2 vs_TEXCOORD0;
					in  float vs_TEXCOORD8;
					in  vec3 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bvec4 u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec2 u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
					    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat0.x = dot(u_xlat0.xyz, unity_ObjectToWorld[1].xyz);
					    u_xlatb0.x = u_xlat0.x>=0.0;
					    u_xlat8.xy = vs_TEXCOORD0.xy + (-_UIAreaUV.xy);
					    u_xlat1.xy = (-_UIAreaUV.xy) + _UIAreaUV.zw;
					    u_xlat1.xy = u_xlat8.xy / u_xlat1.xy;
					    u_xlat8.xy = u_xlat1.xy + vec2(-0.5, -0.5);
					    u_xlat8.xy = u_xlat8.xy * u_xlat8.xy;
					    u_xlatb0.zw = greaterThanEqual(vec4(0.0, 0.0, 0.25, 0.25), u_xlat8.xxxy).zw;
					    u_xlat4.x = u_xlatb0.x ? float(1.0) : 0.0;
					    u_xlat4.y = u_xlatb0.z ? float(1.0) : 0.0;
					    u_xlat4.z = u_xlatb0.w ? float(1.0) : 0.0;
					;
					    u_xlat8.x = u_xlat4.z * u_xlat4.y;
					    u_xlat4.x = u_xlat8.x * u_xlat4.x;
					    u_xlat0.x = (u_xlatb0.x) ? 0.0 : u_xlat8.x;
					    u_xlat2 = texture(_FrontPageTex, u_xlat1.xy);
					    u_xlat8.x = u_xlat4.x * u_xlat2.w;
					    u_xlat4.x = (-u_xlat4.x) * u_xlat2.w + 1.0;
					    u_xlat2.xyz = u_xlat8.xxx * u_xlat2.xyz;
					    u_xlat3 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xxx + u_xlat2.xyz;
					    u_xlat1.z = (-u_xlat1.x) + 1.0;
					    u_xlat1 = texture(_BackPageTex, u_xlat1.zy);
					    u_xlat2.x = u_xlat0.x * u_xlat1.w;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat1.w + 1.0;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
					    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    u_xlat1.x = dot(vs_TEXCOORD1.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.y = dot(vs_TEXCOORD2.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(vs_TEXCOORD3.xyz, unity_WorldToObject[1].xyz);
					    u_xlat12 = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat12 = max(u_xlat12, 0.0);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat12 = vs_TEXCOORD8 / _ProjectionParams.y;
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
						vec4 unused_0_4;
						vec4 _UIAreaUV;
						vec4 unused_0_6;
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
					layout(std140) uniform UnityPerDraw {
						vec4 unused_3_0[12];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_3[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_4_0;
						vec4 unity_FogParams;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _FrontPageTex;
					uniform  sampler2D _BackPageTex;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					in  vec2 vs_TEXCOORD0;
					in  float vs_TEXCOORD8;
					in  vec3 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bvec4 u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec2 u_xlat8;
					float u_xlat12;
					bool u_xlatb12;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
					    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat0.x = dot(u_xlat0.xyz, unity_ObjectToWorld[1].xyz);
					    u_xlatb0.x = u_xlat0.x>=0.0;
					    u_xlat8.xy = vs_TEXCOORD0.xy + (-_UIAreaUV.xy);
					    u_xlat1.xy = (-_UIAreaUV.xy) + _UIAreaUV.zw;
					    u_xlat1.xy = u_xlat8.xy / u_xlat1.xy;
					    u_xlat8.xy = u_xlat1.xy + vec2(-0.5, -0.5);
					    u_xlat8.xy = u_xlat8.xy * u_xlat8.xy;
					    u_xlatb0.zw = greaterThanEqual(vec4(0.0, 0.0, 0.25, 0.25), u_xlat8.xxxy).zw;
					    u_xlat4.x = u_xlatb0.x ? float(1.0) : 0.0;
					    u_xlat4.y = u_xlatb0.z ? float(1.0) : 0.0;
					    u_xlat4.z = u_xlatb0.w ? float(1.0) : 0.0;
					;
					    u_xlat8.x = u_xlat4.z * u_xlat4.y;
					    u_xlat4.x = u_xlat8.x * u_xlat4.x;
					    u_xlat0.x = (u_xlatb0.x) ? 0.0 : u_xlat8.x;
					    u_xlat2 = texture(_FrontPageTex, u_xlat1.xy);
					    u_xlat8.x = u_xlat4.x * u_xlat2.w;
					    u_xlat4.x = (-u_xlat4.x) * u_xlat2.w + 1.0;
					    u_xlat2.xyz = u_xlat8.xxx * u_xlat2.xyz;
					    u_xlat3 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xxx + u_xlat2.xyz;
					    u_xlat1.z = (-u_xlat1.x) + 1.0;
					    u_xlat1 = texture(_BackPageTex, u_xlat1.zy);
					    u_xlat2.x = u_xlat0.x * u_xlat1.w;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat1.w + 1.0;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
					    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1 = vs_TEXCOORD4.yyyy * unity_WorldToLight[1];
					    u_xlat1 = unity_WorldToLight[0] * vs_TEXCOORD4.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToLight[2] * vs_TEXCOORD4.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + unity_WorldToLight[3];
					    u_xlat2.xy = u_xlat1.xy / u_xlat1.ww;
					    u_xlat2.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat2 = texture(_LightTexture0, u_xlat2.xy);
					    u_xlatb12 = 0.0<u_xlat1.z;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1 = texture(_LightTextureB0, u_xlat1.xx);
					    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
					    u_xlat12 = u_xlat2.w * u_xlat12;
					    u_xlat12 = u_xlat1.x * u_xlat12;
					    u_xlat1.xyz = vec3(u_xlat12) * _LightColor0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD1.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.y = dot(vs_TEXCOORD2.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(vs_TEXCOORD3.xyz, unity_WorldToObject[1].xyz);
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat12 = max(u_xlat12, 0.0);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat12 = vs_TEXCOORD8 / _ProjectionParams.y;
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
						vec4 unused_0_4;
						vec4 _UIAreaUV;
						vec4 unused_0_6;
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
					layout(std140) uniform UnityPerDraw {
						vec4 unused_3_0[12];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_3[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_4_0;
						vec4 unity_FogParams;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _FrontPageTex;
					uniform  sampler2D _BackPageTex;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					in  vec2 vs_TEXCOORD0;
					in  float vs_TEXCOORD8;
					in  vec3 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bvec4 u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec2 u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
					    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat0.x = dot(u_xlat0.xyz, unity_ObjectToWorld[1].xyz);
					    u_xlatb0.x = u_xlat0.x>=0.0;
					    u_xlat8.xy = vs_TEXCOORD0.xy + (-_UIAreaUV.xy);
					    u_xlat1.xy = (-_UIAreaUV.xy) + _UIAreaUV.zw;
					    u_xlat1.xy = u_xlat8.xy / u_xlat1.xy;
					    u_xlat8.xy = u_xlat1.xy + vec2(-0.5, -0.5);
					    u_xlat8.xy = u_xlat8.xy * u_xlat8.xy;
					    u_xlatb0.zw = greaterThanEqual(vec4(0.0, 0.0, 0.25, 0.25), u_xlat8.xxxy).zw;
					    u_xlat4.x = u_xlatb0.x ? float(1.0) : 0.0;
					    u_xlat4.y = u_xlatb0.z ? float(1.0) : 0.0;
					    u_xlat4.z = u_xlatb0.w ? float(1.0) : 0.0;
					;
					    u_xlat8.x = u_xlat4.z * u_xlat4.y;
					    u_xlat4.x = u_xlat8.x * u_xlat4.x;
					    u_xlat0.x = (u_xlatb0.x) ? 0.0 : u_xlat8.x;
					    u_xlat2 = texture(_FrontPageTex, u_xlat1.xy);
					    u_xlat8.x = u_xlat4.x * u_xlat2.w;
					    u_xlat4.x = (-u_xlat4.x) * u_xlat2.w + 1.0;
					    u_xlat2.xyz = u_xlat8.xxx * u_xlat2.xyz;
					    u_xlat3 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xxx + u_xlat2.xyz;
					    u_xlat1.z = (-u_xlat1.x) + 1.0;
					    u_xlat1 = texture(_BackPageTex, u_xlat1.zy);
					    u_xlat2.x = u_xlat0.x * u_xlat1.w;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat1.w + 1.0;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
					    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = vs_TEXCOORD4.yyy * unity_WorldToLight[1].xyz;
					    u_xlat1.xyz = unity_WorldToLight[0].xyz * vs_TEXCOORD4.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_WorldToLight[2].xyz * vs_TEXCOORD4.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + unity_WorldToLight[3].xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1 = texture(_LightTexture0, u_xlat1.xyz);
					    u_xlat2 = texture(_LightTextureB0, vec2(u_xlat12));
					    u_xlat12 = u_xlat1.w * u_xlat2.x;
					    u_xlat1.xyz = vec3(u_xlat12) * _LightColor0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlat2.x = dot(vs_TEXCOORD1.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.y = dot(vs_TEXCOORD2.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(vs_TEXCOORD3.xyz, unity_WorldToObject[1].xyz);
					    u_xlat12 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat12 = max(u_xlat12, 0.0);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat12 = vs_TEXCOORD8 / _ProjectionParams.y;
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
						vec4 unused_0_4;
						vec4 _UIAreaUV;
						vec4 unused_0_6;
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
					layout(std140) uniform UnityPerDraw {
						vec4 unused_3_0[12];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_3_3[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_4_0;
						vec4 unity_FogParams;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _FrontPageTex;
					uniform  sampler2D _BackPageTex;
					uniform  sampler2D _LightTexture0;
					in  vec2 vs_TEXCOORD0;
					in  float vs_TEXCOORD8;
					in  vec3 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec3 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD4;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bvec4 u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec2 u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
					    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat0.x = dot(u_xlat0.xyz, unity_ObjectToWorld[1].xyz);
					    u_xlatb0.x = u_xlat0.x>=0.0;
					    u_xlat8.xy = vs_TEXCOORD0.xy + (-_UIAreaUV.xy);
					    u_xlat1.xy = (-_UIAreaUV.xy) + _UIAreaUV.zw;
					    u_xlat1.xy = u_xlat8.xy / u_xlat1.xy;
					    u_xlat8.xy = u_xlat1.xy + vec2(-0.5, -0.5);
					    u_xlat8.xy = u_xlat8.xy * u_xlat8.xy;
					    u_xlatb0.zw = greaterThanEqual(vec4(0.0, 0.0, 0.25, 0.25), u_xlat8.xxxy).zw;
					    u_xlat4.x = u_xlatb0.x ? float(1.0) : 0.0;
					    u_xlat4.y = u_xlatb0.z ? float(1.0) : 0.0;
					    u_xlat4.z = u_xlatb0.w ? float(1.0) : 0.0;
					;
					    u_xlat8.x = u_xlat4.z * u_xlat4.y;
					    u_xlat4.x = u_xlat8.x * u_xlat4.x;
					    u_xlat0.x = (u_xlatb0.x) ? 0.0 : u_xlat8.x;
					    u_xlat2 = texture(_FrontPageTex, u_xlat1.xy);
					    u_xlat8.x = u_xlat4.x * u_xlat2.w;
					    u_xlat4.x = (-u_xlat4.x) * u_xlat2.w + 1.0;
					    u_xlat2.xyz = u_xlat8.xxx * u_xlat2.xyz;
					    u_xlat3 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xxx + u_xlat2.xyz;
					    u_xlat1.z = (-u_xlat1.x) + 1.0;
					    u_xlat1 = texture(_BackPageTex, u_xlat1.zy);
					    u_xlat2.x = u_xlat0.x * u_xlat1.w;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat1.w + 1.0;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
					    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xy = vs_TEXCOORD4.yy * unity_WorldToLight[1].xy;
					    u_xlat1.xy = unity_WorldToLight[0].xy * vs_TEXCOORD4.xx + u_xlat1.xy;
					    u_xlat1.xy = unity_WorldToLight[2].xy * vs_TEXCOORD4.zz + u_xlat1.xy;
					    u_xlat1.xy = u_xlat1.xy + unity_WorldToLight[3].xy;
					    u_xlat1 = texture(_LightTexture0, u_xlat1.xy);
					    u_xlat1.xyz = u_xlat1.www * _LightColor0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat1.x = dot(vs_TEXCOORD1.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.y = dot(vs_TEXCOORD2.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(vs_TEXCOORD3.xyz, unity_WorldToObject[1].xyz);
					    u_xlat12 = dot(u_xlat1.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat12 = max(u_xlat12, 0.0);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat12 = vs_TEXCOORD8 / _ProjectionParams.y;
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
			Name "PREPASS"
			Tags { "LIGHTMODE" = "PrePassBase" "RenderType" = "Diffuse" }
			ZClip Off
			Cull Off
			GpuProgramID 159150
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
						vec4 unused_0_0[4];
						vec4 _Color;
						vec4 unused_0_2;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_4;
						vec4 unity_WorldTransformParams;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_COLOR0;
					out vec4 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					float u_xlat12;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + glstate_matrix_mvp[3];
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat1.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat2.xyz);
					    u_xlat12 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    vs_TEXCOORD0.y = u_xlat2.x;
					    u_xlat3.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat3.xyz;
					    vs_TEXCOORD0.w = u_xlat3.x;
					    vs_TEXCOORD0.x = u_xlat1.z;
					    vs_TEXCOORD0.z = u_xlat0.y;
					    vs_TEXCOORD1.x = u_xlat1.x;
					    vs_TEXCOORD2.x = u_xlat1.y;
					    vs_TEXCOORD1.z = u_xlat0.z;
					    vs_TEXCOORD2.z = u_xlat0.x;
					    vs_TEXCOORD1.w = u_xlat3.y;
					    vs_TEXCOORD2.w = u_xlat3.z;
					    vs_TEXCOORD1.y = u_xlat2.y;
					    vs_TEXCOORD2.y = u_xlat2.z;
					    vs_TEXCOORD3 = in_COLOR0 * _Color;
					    vs_TEXCOORD4.xyz = in_TANGENT0.xyz;
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
					layout(std140) uniform UnityPerDraw {
						vec4 unused_0_0[16];
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[2];
					};
					in  vec4 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.y = dot(vs_TEXCOORD1.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(vs_TEXCOORD2.xyz, unity_WorldToObject[1].xyz);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
			}
		}
		Pass {
			Name "PREPASS"
			Tags { "LIGHTMODE" = "PrePassFinal" "RenderType" = "Diffuse" }
			ZClip Off
			ZWrite Off
			Cull Off
			GpuProgramID 205142
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
						vec4 unused_0_0[4];
						vec4 _Color;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 unused_1_3[3];
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
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					out vec4 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
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
					    u_xlat1.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    vs_TEXCOORD2 = in_COLOR0 * _Color;
					    vs_TEXCOORD3.xyz = in_TANGENT0.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat16 = inversesqrt(u_xlat16);
					    u_xlat2.xyz = vec3(u_xlat16) * u_xlat2.xyz;
					    vs_TEXCOORD4.x = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlat3.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat3.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat3.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat16 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat16 = inversesqrt(u_xlat16);
					    u_xlat3.xyz = vec3(u_xlat16) * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat2.yzx * u_xlat3.zxy;
					    u_xlat2.xyz = u_xlat3.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
					    u_xlat16 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.xyz = vec3(u_xlat16) * u_xlat2.xyz;
					    vs_TEXCOORD4.y = dot(u_xlat1.xyz, u_xlat2.xyz);
					    vs_TEXCOORD4.z = dot(u_xlat1.xyz, u_xlat3.xyz);
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD5.zw = u_xlat0.zw;
					    vs_TEXCOORD5.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = u_xlat3.y * u_xlat3.y;
					    u_xlat0.x = u_xlat3.x * u_xlat3.x + (-u_xlat0.x);
					    u_xlat1 = u_xlat3.yzzx * u_xlat3.xyzz;
					    u_xlat2.x = dot(unity_SHBr, u_xlat1);
					    u_xlat2.y = dot(unity_SHBg, u_xlat1);
					    u_xlat2.z = dot(unity_SHBb, u_xlat1);
					    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat3.w = 1.0;
					    u_xlat1.x = dot(unity_SHAr, u_xlat3);
					    u_xlat1.y = dot(unity_SHAg, u_xlat3);
					    u_xlat1.z = dot(unity_SHAb, u_xlat3);
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD7.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
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
						vec4 unused_0_0[4];
						vec4 _Color;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 unused_1_3[3];
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
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					out vec4 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
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
					    u_xlat1.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    vs_TEXCOORD2 = in_COLOR0 * _Color;
					    vs_TEXCOORD3.xyz = in_TANGENT0.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat16 = inversesqrt(u_xlat16);
					    u_xlat2.xyz = vec3(u_xlat16) * u_xlat2.xyz;
					    vs_TEXCOORD4.x = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlat3.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat3.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat3.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat16 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat16 = inversesqrt(u_xlat16);
					    u_xlat3.xyz = vec3(u_xlat16) * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat2.yzx * u_xlat3.zxy;
					    u_xlat2.xyz = u_xlat3.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
					    u_xlat16 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.xyz = vec3(u_xlat16) * u_xlat2.xyz;
					    vs_TEXCOORD4.y = dot(u_xlat1.xyz, u_xlat2.xyz);
					    vs_TEXCOORD4.z = dot(u_xlat1.xyz, u_xlat3.xyz);
					    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
					    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
					    vs_TEXCOORD5.zw = u_xlat0.zw;
					    vs_TEXCOORD5.xy = u_xlat1.zz + u_xlat1.xw;
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = u_xlat3.y * u_xlat3.y;
					    u_xlat0.x = u_xlat3.x * u_xlat3.x + (-u_xlat0.x);
					    u_xlat1 = u_xlat3.yzzx * u_xlat3.xyzz;
					    u_xlat2.x = dot(unity_SHBr, u_xlat1);
					    u_xlat2.y = dot(unity_SHBg, u_xlat1);
					    u_xlat2.z = dot(unity_SHBb, u_xlat1);
					    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat3.w = 1.0;
					    u_xlat1.x = dot(unity_SHAr, u_xlat3);
					    u_xlat1.y = dot(unity_SHAg, u_xlat3);
					    u_xlat1.z = dot(unity_SHAb, u_xlat3);
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD7.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
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
						vec4 unused_0_0[4];
						vec4 _Color;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 unused_1_3[3];
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
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out float vs_TEXCOORD8;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					out vec4 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					float u_xlat5;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD8 = u_xlat0.z;
					    vs_TEXCOORD5.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    vs_TEXCOORD2 = in_COLOR0 * _Color;
					    vs_TEXCOORD3.xyz = in_TANGENT0.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
					    vs_TEXCOORD4.x = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlat3.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat3.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat3.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat3.xyz = vec3(u_xlat10) * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat2.yzx * u_xlat3.zxy;
					    u_xlat2.xyz = u_xlat3.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
					    u_xlat10 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
					    vs_TEXCOORD4.y = dot(u_xlat1.xyz, u_xlat2.xyz);
					    vs_TEXCOORD4.z = dot(u_xlat1.xyz, u_xlat3.xyz);
					    u_xlat5 = u_xlat0.y * _ProjectionParams.x;
					    u_xlat0.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat0.w = u_xlat5 * 0.5;
					    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = u_xlat3.y * u_xlat3.y;
					    u_xlat0.x = u_xlat3.x * u_xlat3.x + (-u_xlat0.x);
					    u_xlat1 = u_xlat3.yzzx * u_xlat3.xyzz;
					    u_xlat2.x = dot(unity_SHBr, u_xlat1);
					    u_xlat2.y = dot(unity_SHBg, u_xlat1);
					    u_xlat2.z = dot(unity_SHBb, u_xlat1);
					    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat3.w = 1.0;
					    u_xlat1.x = dot(unity_SHAr, u_xlat3);
					    u_xlat1.y = dot(unity_SHAg, u_xlat3);
					    u_xlat1.z = dot(unity_SHAb, u_xlat3);
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD7.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "FOG_LINEAR" "UNITY_HDR_ON" }
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
						vec4 _Color;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 _ProjectionParams;
						vec4 unused_1_3[3];
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
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out float vs_TEXCOORD8;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					out vec3 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					out vec4 vs_TEXCOORD6;
					out vec3 vs_TEXCOORD7;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					float u_xlat5;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + glstate_matrix_mvp[3];
					    gl_Position = u_xlat0;
					    vs_TEXCOORD8 = u_xlat0.z;
					    vs_TEXCOORD5.zw = u_xlat0.zw;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat1.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = u_xlat1.xyz;
					    u_xlat1.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
					    vs_TEXCOORD2 = in_COLOR0 * _Color;
					    vs_TEXCOORD3.xyz = in_TANGENT0.xyz;
					    u_xlat2.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
					    u_xlat2.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
					    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
					    vs_TEXCOORD4.x = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlat3.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat3.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat3.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    u_xlat3.xyz = vec3(u_xlat10) * u_xlat3.xyz;
					    u_xlat4.xyz = u_xlat2.yzx * u_xlat3.zxy;
					    u_xlat2.xyz = u_xlat3.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
					    u_xlat10 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
					    vs_TEXCOORD4.y = dot(u_xlat1.xyz, u_xlat2.xyz);
					    vs_TEXCOORD4.z = dot(u_xlat1.xyz, u_xlat3.xyz);
					    u_xlat5 = u_xlat0.y * _ProjectionParams.x;
					    u_xlat0.xz = u_xlat0.xw * vec2(0.5, 0.5);
					    u_xlat0.w = u_xlat5 * 0.5;
					    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
					    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = u_xlat3.y * u_xlat3.y;
					    u_xlat0.x = u_xlat3.x * u_xlat3.x + (-u_xlat0.x);
					    u_xlat1 = u_xlat3.yzzx * u_xlat3.xyzz;
					    u_xlat2.x = dot(unity_SHBr, u_xlat1);
					    u_xlat2.y = dot(unity_SHBg, u_xlat1);
					    u_xlat2.z = dot(unity_SHBb, u_xlat1);
					    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat3.w = 1.0;
					    u_xlat1.x = dot(unity_SHAr, u_xlat3);
					    u_xlat1.y = dot(unity_SHAg, u_xlat3);
					    u_xlat1.z = dot(unity_SHAb, u_xlat3);
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD7.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
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
						vec4 unused_0_0[5];
						vec4 _UIAreaUV;
						vec4 unused_0_2[2];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_2[6];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _FrontPageTex;
					uniform  sampler2D _BackPageTex;
					uniform  sampler2D _LightBuffer;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD4;
					in  vec4 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD7;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					bvec4 u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec2 u_xlat8;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, unity_ObjectToWorld[1].xyz);
					    u_xlatb0.x = u_xlat0.x>=0.0;
					    u_xlat8.xy = vs_TEXCOORD0.xy + (-_UIAreaUV.xy);
					    u_xlat1.xy = (-_UIAreaUV.xy) + _UIAreaUV.zw;
					    u_xlat1.xy = u_xlat8.xy / u_xlat1.xy;
					    u_xlat8.xy = u_xlat1.xy + vec2(-0.5, -0.5);
					    u_xlat8.xy = u_xlat8.xy * u_xlat8.xy;
					    u_xlatb0.zw = greaterThanEqual(vec4(0.0, 0.0, 0.25, 0.25), u_xlat8.xxxy).zw;
					    u_xlat4.x = u_xlatb0.x ? float(1.0) : 0.0;
					    u_xlat4.y = u_xlatb0.z ? float(1.0) : 0.0;
					    u_xlat4.z = u_xlatb0.w ? float(1.0) : 0.0;
					;
					    u_xlat8.x = u_xlat4.z * u_xlat4.y;
					    u_xlat4.x = u_xlat8.x * u_xlat4.x;
					    u_xlat0.x = (u_xlatb0.x) ? 0.0 : u_xlat8.x;
					    u_xlat2 = texture(_FrontPageTex, u_xlat1.xy);
					    u_xlat8.x = u_xlat4.x * u_xlat2.w;
					    u_xlat4.x = (-u_xlat4.x) * u_xlat2.w + 1.0;
					    u_xlat2.xyz = u_xlat8.xxx * u_xlat2.xyz;
					    u_xlat3 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xxx + u_xlat2.xyz;
					    u_xlat1.z = (-u_xlat1.x) + 1.0;
					    u_xlat1 = texture(_BackPageTex, u_xlat1.zy);
					    u_xlat2.x = u_xlat0.x * u_xlat1.w;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat1.w + 1.0;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
					    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
					    u_xlat1 = texture(_LightBuffer, u_xlat1.xy);
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = (-u_xlat1.xyz) + vs_TEXCOORD7.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    SV_Target0.w = 1.0;
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
						vec4 unused_0_0[5];
						vec4 _UIAreaUV;
						vec4 unused_0_2[2];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_1_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_1_2[6];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _FrontPageTex;
					uniform  sampler2D _BackPageTex;
					uniform  sampler2D _LightBuffer;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD4;
					in  vec4 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD7;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					bvec4 u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec2 u_xlat8;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, unity_ObjectToWorld[1].xyz);
					    u_xlatb0.x = u_xlat0.x>=0.0;
					    u_xlat8.xy = vs_TEXCOORD0.xy + (-_UIAreaUV.xy);
					    u_xlat1.xy = (-_UIAreaUV.xy) + _UIAreaUV.zw;
					    u_xlat1.xy = u_xlat8.xy / u_xlat1.xy;
					    u_xlat8.xy = u_xlat1.xy + vec2(-0.5, -0.5);
					    u_xlat8.xy = u_xlat8.xy * u_xlat8.xy;
					    u_xlatb0.zw = greaterThanEqual(vec4(0.0, 0.0, 0.25, 0.25), u_xlat8.xxxy).zw;
					    u_xlat4.x = u_xlatb0.x ? float(1.0) : 0.0;
					    u_xlat4.y = u_xlatb0.z ? float(1.0) : 0.0;
					    u_xlat4.z = u_xlatb0.w ? float(1.0) : 0.0;
					;
					    u_xlat8.x = u_xlat4.z * u_xlat4.y;
					    u_xlat4.x = u_xlat8.x * u_xlat4.x;
					    u_xlat0.x = (u_xlatb0.x) ? 0.0 : u_xlat8.x;
					    u_xlat2 = texture(_FrontPageTex, u_xlat1.xy);
					    u_xlat8.x = u_xlat4.x * u_xlat2.w;
					    u_xlat4.x = (-u_xlat4.x) * u_xlat2.w + 1.0;
					    u_xlat2.xyz = u_xlat8.xxx * u_xlat2.xyz;
					    u_xlat3 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xxx + u_xlat2.xyz;
					    u_xlat1.z = (-u_xlat1.x) + 1.0;
					    u_xlat1 = texture(_BackPageTex, u_xlat1.zy);
					    u_xlat2.x = u_xlat0.x * u_xlat1.w;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat1.w + 1.0;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
					    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
					    u_xlat1 = texture(_LightBuffer, u_xlat1.xy);
					    u_xlat1.xyz = u_xlat1.xyz + vs_TEXCOORD7.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    SV_Target0.w = 1.0;
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
						vec4 unused_0_0[5];
						vec4 _UIAreaUV;
						vec4 unused_0_2[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unity_FogParams;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _FrontPageTex;
					uniform  sampler2D _BackPageTex;
					uniform  sampler2D _LightBuffer;
					in  vec2 vs_TEXCOORD0;
					in  float vs_TEXCOORD8;
					in  vec3 vs_TEXCOORD4;
					in  vec4 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD7;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					bvec4 u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec2 u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, unity_ObjectToWorld[1].xyz);
					    u_xlatb0.x = u_xlat0.x>=0.0;
					    u_xlat8.xy = vs_TEXCOORD0.xy + (-_UIAreaUV.xy);
					    u_xlat1.xy = (-_UIAreaUV.xy) + _UIAreaUV.zw;
					    u_xlat1.xy = u_xlat8.xy / u_xlat1.xy;
					    u_xlat8.xy = u_xlat1.xy + vec2(-0.5, -0.5);
					    u_xlat8.xy = u_xlat8.xy * u_xlat8.xy;
					    u_xlatb0.zw = greaterThanEqual(vec4(0.0, 0.0, 0.25, 0.25), u_xlat8.xxxy).zw;
					    u_xlat4.x = u_xlatb0.x ? float(1.0) : 0.0;
					    u_xlat4.y = u_xlatb0.z ? float(1.0) : 0.0;
					    u_xlat4.z = u_xlatb0.w ? float(1.0) : 0.0;
					;
					    u_xlat8.x = u_xlat4.z * u_xlat4.y;
					    u_xlat4.x = u_xlat8.x * u_xlat4.x;
					    u_xlat0.x = (u_xlatb0.x) ? 0.0 : u_xlat8.x;
					    u_xlat2 = texture(_FrontPageTex, u_xlat1.xy);
					    u_xlat8.x = u_xlat4.x * u_xlat2.w;
					    u_xlat4.x = (-u_xlat4.x) * u_xlat2.w + 1.0;
					    u_xlat2.xyz = u_xlat8.xxx * u_xlat2.xyz;
					    u_xlat3 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xxx + u_xlat2.xyz;
					    u_xlat1.z = (-u_xlat1.x) + 1.0;
					    u_xlat1 = texture(_BackPageTex, u_xlat1.zy);
					    u_xlat2.x = u_xlat0.x * u_xlat1.w;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat1.w + 1.0;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
					    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
					    u_xlat1 = texture(_LightBuffer, u_xlat1.xy);
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = (-u_xlat1.xyz) + vs_TEXCOORD7.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz + (-unity_FogColor.xyz);
					    u_xlat12 = vs_TEXCOORD8 / _ProjectionParams.y;
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat12 = u_xlat12 * _ProjectionParams.z;
					    u_xlat12 = max(u_xlat12, 0.0);
					    u_xlat12 = u_xlat12 * unity_FogParams.z + unity_FogParams.w;
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat12) * u_xlat0.xyz + unity_FogColor.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11 " {
					Keywords { "FOG_LINEAR" "UNITY_HDR_ON" }
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
						vec4 unused_0_0[5];
						vec4 _UIAreaUV;
						vec4 unused_0_2[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unity_FogParams;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _FrontPageTex;
					uniform  sampler2D _BackPageTex;
					uniform  sampler2D _LightBuffer;
					in  vec2 vs_TEXCOORD0;
					in  float vs_TEXCOORD8;
					in  vec3 vs_TEXCOORD4;
					in  vec4 vs_TEXCOORD5;
					in  vec3 vs_TEXCOORD7;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					bvec4 u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec2 u_xlat8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD4.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, unity_ObjectToWorld[1].xyz);
					    u_xlatb0.x = u_xlat0.x>=0.0;
					    u_xlat8.xy = vs_TEXCOORD0.xy + (-_UIAreaUV.xy);
					    u_xlat1.xy = (-_UIAreaUV.xy) + _UIAreaUV.zw;
					    u_xlat1.xy = u_xlat8.xy / u_xlat1.xy;
					    u_xlat8.xy = u_xlat1.xy + vec2(-0.5, -0.5);
					    u_xlat8.xy = u_xlat8.xy * u_xlat8.xy;
					    u_xlatb0.zw = greaterThanEqual(vec4(0.0, 0.0, 0.25, 0.25), u_xlat8.xxxy).zw;
					    u_xlat4.x = u_xlatb0.x ? float(1.0) : 0.0;
					    u_xlat4.y = u_xlatb0.z ? float(1.0) : 0.0;
					    u_xlat4.z = u_xlatb0.w ? float(1.0) : 0.0;
					;
					    u_xlat8.x = u_xlat4.z * u_xlat4.y;
					    u_xlat4.x = u_xlat8.x * u_xlat4.x;
					    u_xlat0.x = (u_xlatb0.x) ? 0.0 : u_xlat8.x;
					    u_xlat2 = texture(_FrontPageTex, u_xlat1.xy);
					    u_xlat8.x = u_xlat4.x * u_xlat2.w;
					    u_xlat4.x = (-u_xlat4.x) * u_xlat2.w + 1.0;
					    u_xlat2.xyz = u_xlat8.xxx * u_xlat2.xyz;
					    u_xlat3 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xxx + u_xlat2.xyz;
					    u_xlat1.z = (-u_xlat1.x) + 1.0;
					    u_xlat1 = texture(_BackPageTex, u_xlat1.zy);
					    u_xlat2.x = u_xlat0.x * u_xlat1.w;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat1.w + 1.0;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
					    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
					    u_xlat1 = texture(_LightBuffer, u_xlat1.xy);
					    u_xlat1.xyz = u_xlat1.xyz + vs_TEXCOORD7.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz + (-unity_FogColor.xyz);
					    u_xlat12 = vs_TEXCOORD8 / _ProjectionParams.y;
					    u_xlat12 = (-u_xlat12) + 1.0;
					    u_xlat12 = u_xlat12 * _ProjectionParams.z;
					    u_xlat12 = max(u_xlat12, 0.0);
					    u_xlat12 = u_xlat12 * unity_FogParams.z + unity_FogParams.w;
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat12) * u_xlat0.xyz + unity_FogColor.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
			}
		}
		Pass {
			Name "DEFERRED"
			Tags { "LIGHTMODE" = "Deferred" "RenderType" = "Diffuse" }
			ZClip Off
			Cull Off
			GpuProgramID 281585
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
						vec4 unused_0_0[4];
						vec4 _Color;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
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
						vec4 unused_3_4;
						vec4 unity_WorldTransformParams;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec4 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD1.w = u_xlat0.x;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    vs_TEXCOORD1.x = u_xlat1.x;
					    u_xlat12 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2 = vec4(u_xlat13) * u_xlat2.xyzz;
					    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.wxy;
					    u_xlat3.xyz = u_xlat2.ywx * u_xlat1.zxy + (-u_xlat3.xyz);
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    vs_TEXCOORD1.y = u_xlat3.x;
					    vs_TEXCOORD1.z = u_xlat2.x;
					    vs_TEXCOORD2.x = u_xlat1.y;
					    vs_TEXCOORD2.w = u_xlat0.y;
					    vs_TEXCOORD2.y = u_xlat3.y;
					    vs_TEXCOORD2.z = u_xlat2.y;
					    vs_TEXCOORD3.x = u_xlat1.z;
					    vs_TEXCOORD3.w = u_xlat0.z;
					    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    vs_TEXCOORD3.y = u_xlat3.z;
					    vs_TEXCOORD6.y = dot(u_xlat0.xyz, u_xlat3.xyz);
					    vs_TEXCOORD3.z = u_xlat2.w;
					    vs_TEXCOORD4 = in_COLOR0 * _Color;
					    vs_TEXCOORD5.xyz = in_TANGENT0.xyz;
					    vs_TEXCOORD6.x = dot(u_xlat0.xyz, u_xlat1.xyz);
					    vs_TEXCOORD6.z = dot(u_xlat0.xyz, u_xlat2.xyz);
					    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = u_xlat2.y * u_xlat2.y;
					    u_xlat0.x = u_xlat2.x * u_xlat2.x + (-u_xlat0.x);
					    u_xlat1 = u_xlat2.ywzx * u_xlat2;
					    u_xlat2.x = dot(unity_SHBr, u_xlat1);
					    u_xlat2.y = dot(unity_SHBg, u_xlat1);
					    u_xlat2.z = dot(unity_SHBb, u_xlat1);
					    vs_TEXCOORD8.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat2.xyz;
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
						vec4 unused_0_0[4];
						vec4 _Color;
						vec4 unused_0_2;
						vec4 _MainTex_ST;
						vec4 unused_0_4;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
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
						vec4 unused_3_4;
						vec4 unity_WorldTransformParams;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TANGENT0;
					in  vec3 in_NORMAL0;
					in  vec4 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					out vec3 vs_TEXCOORD6;
					out vec4 vs_TEXCOORD7;
					out vec3 vs_TEXCOORD8;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = u_xlat0 + glstate_matrix_mvp[3];
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
					    u_xlat0.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    vs_TEXCOORD1.w = u_xlat0.x;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    vs_TEXCOORD1.x = u_xlat1.x;
					    u_xlat12 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat13 = inversesqrt(u_xlat13);
					    u_xlat2 = vec4(u_xlat13) * u_xlat2.xyzz;
					    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.wxy;
					    u_xlat3.xyz = u_xlat2.ywx * u_xlat1.zxy + (-u_xlat3.xyz);
					    u_xlat3.xyz = vec3(u_xlat12) * u_xlat3.xyz;
					    vs_TEXCOORD1.y = u_xlat3.x;
					    vs_TEXCOORD1.z = u_xlat2.x;
					    vs_TEXCOORD2.x = u_xlat1.y;
					    vs_TEXCOORD2.w = u_xlat0.y;
					    vs_TEXCOORD2.y = u_xlat3.y;
					    vs_TEXCOORD2.z = u_xlat2.y;
					    vs_TEXCOORD3.x = u_xlat1.z;
					    vs_TEXCOORD3.w = u_xlat0.z;
					    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
					    vs_TEXCOORD3.y = u_xlat3.z;
					    vs_TEXCOORD6.y = dot(u_xlat0.xyz, u_xlat3.xyz);
					    vs_TEXCOORD3.z = u_xlat2.w;
					    vs_TEXCOORD4 = in_COLOR0 * _Color;
					    vs_TEXCOORD5.xyz = in_TANGENT0.xyz;
					    vs_TEXCOORD6.x = dot(u_xlat0.xyz, u_xlat1.xyz);
					    vs_TEXCOORD6.z = dot(u_xlat0.xyz, u_xlat2.xyz);
					    vs_TEXCOORD7 = vec4(0.0, 0.0, 0.0, 0.0);
					    u_xlat0.x = u_xlat2.y * u_xlat2.y;
					    u_xlat0.x = u_xlat2.x * u_xlat2.x + (-u_xlat0.x);
					    u_xlat1 = u_xlat2.ywzx * u_xlat2;
					    u_xlat2.x = dot(unity_SHBr, u_xlat1);
					    u_xlat2.y = dot(unity_SHBg, u_xlat1);
					    u_xlat2.z = dot(unity_SHBb, u_xlat1);
					    vs_TEXCOORD8.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat2.xyz;
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
						vec4 unused_0_0[5];
						vec4 _UIAreaUV;
						vec4 unused_0_2[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_1_0[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unused_1_4[4];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_3[2];
					};
					layout(std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _FrontPageTex;
					uniform  sampler2D _BackPageTex;
					uniform  sampler3D unity_ProbeVolumeSH;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD6;
					in  vec3 vs_TEXCOORD8;
					layout(location = 0) out vec4 SV_Target0;
					layout(location = 1) out vec4 SV_Target1;
					layout(location = 2) out vec4 SV_Target2;
					layout(location = 3) out vec4 SV_Target3;
					vec3 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec3 u_xlat5;
					float u_xlat7;
					vec3 u_xlat8;
					float u_xlat10;
					vec2 u_xlat12;
					float u_xlat15;
					bool u_xlatb15;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD6.xyz;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2.xy = vs_TEXCOORD0.xy + (-_UIAreaUV.xy);
					    u_xlat12.xy = (-_UIAreaUV.xy) + _UIAreaUV.zw;
					    u_xlat2.xy = u_xlat2.xy / u_xlat12.xy;
					    u_xlat3 = texture(_FrontPageTex, u_xlat2.xy);
					    u_xlat2.z = (-u_xlat2.x) + 1.0;
					    u_xlat4 = texture(_BackPageTex, u_xlat2.zy);
					    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
					    u_xlat2.xy = u_xlat2.xy * u_xlat2.xy;
					    u_xlatb2.xy = greaterThanEqual(vec4(0.25, 0.25, 0.0, 0.0), u_xlat2.xyxx).xy;
					    u_xlat2.x = u_xlatb2.x ? float(1.0) : 0.0;
					    u_xlat2.y = u_xlatb2.y ? float(1.0) : 0.0;
					;
					    u_xlat15 = u_xlat2.y * u_xlat2.x;
					    u_xlat0.x = dot(u_xlat0.xyz, unity_ObjectToWorld[1].xyz);
					    u_xlatb0 = u_xlat0.x>=0.0;
					    u_xlat5.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat5.x = u_xlat15 * u_xlat5.x;
					    u_xlat10 = u_xlat3.w * u_xlat5.x;
					    u_xlat0.x = (u_xlatb0) ? 0.0 : u_xlat15;
					    u_xlat15 = u_xlat4.w * u_xlat0.x;
					    u_xlat5.x = (-u_xlat5.x) * u_xlat3.w + 1.0;
					    u_xlat2.xyz = vec3(u_xlat10) * u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat5.xxx + u_xlat2.xyz;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat4.w + 1.0;
					    u_xlat5.xyz = vec3(u_xlat15) * u_xlat4.xyz;
					    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat5.xyz;
					    u_xlat1.x = dot(vs_TEXCOORD1.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.y = dot(vs_TEXCOORD2.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(vs_TEXCOORD3.xyz, unity_WorldToObject[1].xyz);
					    u_xlatb15 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb15){
					        u_xlatb15 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat2.xyz = vs_TEXCOORD2.www * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat2.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD1.www + u_xlat2.xyz;
					        u_xlat2.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD3.www + u_xlat2.xyz;
					        u_xlat2.xyz = u_xlat2.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat8.x = vs_TEXCOORD1.w;
					        u_xlat8.y = vs_TEXCOORD2.w;
					        u_xlat8.z = vs_TEXCOORD3.w;
					        u_xlat2.xyz = (bool(u_xlatb15)) ? u_xlat2.xyz : u_xlat8.xyz;
					        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat15 = u_xlat2.y * 0.25;
					        u_xlat7 = unity_ProbeVolumeParams.z * 0.5;
					        u_xlat3.x = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
					        u_xlat15 = max(u_xlat15, u_xlat7);
					        u_xlat2.x = min(u_xlat3.x, u_xlat15);
					        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
					        u_xlat4.xyz = u_xlat2.xzw + vec3(0.25, 0.0, 0.0);
					        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xyz);
					        u_xlat2.xyz = u_xlat2.xzw + vec3(0.5, 0.0, 0.0);
					        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xyz);
					        u_xlat1.w = 1.0;
					        u_xlat3.x = dot(u_xlat3, u_xlat1);
					        u_xlat3.y = dot(u_xlat4, u_xlat1);
					        u_xlat3.z = dot(u_xlat2, u_xlat1);
					    } else {
					        u_xlat1.w = 1.0;
					        u_xlat3.x = dot(unity_SHAr, u_xlat1);
					        u_xlat3.y = dot(unity_SHAg, u_xlat1);
					        u_xlat3.z = dot(unity_SHAb, u_xlat1);
					    }
					    u_xlat2.xyz = u_xlat3.xyz + vs_TEXCOORD8.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat2.xyz = log2(u_xlat2.xyz);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat2.xyz = exp2(u_xlat2.xyz);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target2.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
					    SV_Target3.xyz = exp2((-u_xlat1.xyz));
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
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
						vec4 unused_0_0[5];
						vec4 _UIAreaUV;
						vec4 unused_0_2[2];
					};
					layout(std140) uniform UnityLighting {
						vec4 unused_1_0[38];
						vec4 unity_SHAr;
						vec4 unity_SHAg;
						vec4 unity_SHAb;
						vec4 unused_1_4[4];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_3[2];
					};
					layout(std140) uniform UnityProbeVolume {
						vec4 unity_ProbeVolumeParams;
						mat4x4 unity_ProbeVolumeWorldToObject;
						vec3 unity_ProbeVolumeSizeInv;
						vec3 unity_ProbeVolumeMin;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _FrontPageTex;
					uniform  sampler2D _BackPageTex;
					uniform  sampler3D unity_ProbeVolumeSH;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD6;
					in  vec3 vs_TEXCOORD8;
					layout(location = 0) out vec4 SV_Target0;
					layout(location = 1) out vec4 SV_Target1;
					layout(location = 2) out vec4 SV_Target2;
					layout(location = 3) out vec4 SV_Target3;
					vec3 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					bvec2 u_xlatb2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec3 u_xlat5;
					float u_xlat7;
					vec3 u_xlat8;
					float u_xlat10;
					vec2 u_xlat12;
					float u_xlat15;
					bool u_xlatb15;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD6.xyz, vs_TEXCOORD6.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD6.xyz;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2.xy = vs_TEXCOORD0.xy + (-_UIAreaUV.xy);
					    u_xlat12.xy = (-_UIAreaUV.xy) + _UIAreaUV.zw;
					    u_xlat2.xy = u_xlat2.xy / u_xlat12.xy;
					    u_xlat3 = texture(_FrontPageTex, u_xlat2.xy);
					    u_xlat2.z = (-u_xlat2.x) + 1.0;
					    u_xlat4 = texture(_BackPageTex, u_xlat2.zy);
					    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
					    u_xlat2.xy = u_xlat2.xy * u_xlat2.xy;
					    u_xlatb2.xy = greaterThanEqual(vec4(0.25, 0.25, 0.0, 0.0), u_xlat2.xyxx).xy;
					    u_xlat2.x = u_xlatb2.x ? float(1.0) : 0.0;
					    u_xlat2.y = u_xlatb2.y ? float(1.0) : 0.0;
					;
					    u_xlat15 = u_xlat2.y * u_xlat2.x;
					    u_xlat0.x = dot(u_xlat0.xyz, unity_ObjectToWorld[1].xyz);
					    u_xlatb0 = u_xlat0.x>=0.0;
					    u_xlat5.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat5.x = u_xlat15 * u_xlat5.x;
					    u_xlat10 = u_xlat3.w * u_xlat5.x;
					    u_xlat0.x = (u_xlatb0) ? 0.0 : u_xlat15;
					    u_xlat15 = u_xlat4.w * u_xlat0.x;
					    u_xlat5.x = (-u_xlat5.x) * u_xlat3.w + 1.0;
					    u_xlat2.xyz = vec3(u_xlat10) * u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat5.xxx + u_xlat2.xyz;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat4.w + 1.0;
					    u_xlat5.xyz = vec3(u_xlat15) * u_xlat4.xyz;
					    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat5.xyz;
					    u_xlat1.x = dot(vs_TEXCOORD1.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.y = dot(vs_TEXCOORD2.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(vs_TEXCOORD3.xyz, unity_WorldToObject[1].xyz);
					    u_xlatb15 = unity_ProbeVolumeParams.x==1.0;
					    if(u_xlatb15){
					        u_xlatb15 = unity_ProbeVolumeParams.y==1.0;
					        u_xlat2.xyz = vs_TEXCOORD2.www * unity_ProbeVolumeWorldToObject[1].xyz;
					        u_xlat2.xyz = unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD1.www + u_xlat2.xyz;
					        u_xlat2.xyz = unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD3.www + u_xlat2.xyz;
					        u_xlat2.xyz = u_xlat2.xyz + unity_ProbeVolumeWorldToObject[3].xyz;
					        u_xlat8.x = vs_TEXCOORD1.w;
					        u_xlat8.y = vs_TEXCOORD2.w;
					        u_xlat8.z = vs_TEXCOORD3.w;
					        u_xlat2.xyz = (bool(u_xlatb15)) ? u_xlat2.xyz : u_xlat8.xyz;
					        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
					        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
					        u_xlat15 = u_xlat2.y * 0.25;
					        u_xlat7 = unity_ProbeVolumeParams.z * 0.5;
					        u_xlat3.x = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
					        u_xlat15 = max(u_xlat15, u_xlat7);
					        u_xlat2.x = min(u_xlat3.x, u_xlat15);
					        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
					        u_xlat4.xyz = u_xlat2.xzw + vec3(0.25, 0.0, 0.0);
					        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xyz);
					        u_xlat2.xyz = u_xlat2.xzw + vec3(0.5, 0.0, 0.0);
					        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xyz);
					        u_xlat1.w = 1.0;
					        u_xlat3.x = dot(u_xlat3, u_xlat1);
					        u_xlat3.y = dot(u_xlat4, u_xlat1);
					        u_xlat3.z = dot(u_xlat2, u_xlat1);
					    } else {
					        u_xlat1.w = 1.0;
					        u_xlat3.x = dot(unity_SHAr, u_xlat1);
					        u_xlat3.y = dot(unity_SHAg, u_xlat1);
					        u_xlat3.z = dot(unity_SHAb, u_xlat1);
					    }
					    u_xlat2.xyz = u_xlat3.xyz + vs_TEXCOORD8.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat2.xyz = log2(u_xlat2.xyz);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat2.xyz = exp2(u_xlat2.xyz);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    SV_Target2.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    SV_Target3.xyz = u_xlat0.xyz * u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    SV_Target2.w = 1.0;
					    SV_Target3.w = 1.0;
					    return;
					}"
				}
			}
		}
		Pass {
			Name "META"
			Tags { "LIGHTMODE" = "Meta" "RenderType" = "Diffuse" }
			ZClip Off
			Cull Off
			GpuProgramID 360702
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
						vec4 unused_0_0[4];
						vec4 _Color;
						vec4 unused_0_2[2];
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
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD4;
					out vec3 vs_TEXCOORD5;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					float u_xlat12;
					bool u_xlatb12;
					void main()
					{
					    u_xlatb0 = 0.0<in_POSITION0.z;
					    u_xlat0.z = u_xlatb0 ? 9.99999975e-05 : float(0.0);
					    u_xlat0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    u_xlat0.xyz = (unity_MetaVertexControl.x) ? u_xlat0.xyz : in_POSITION0.xyz;
					    u_xlatb12 = 0.0<u_xlat0.z;
					    u_xlat1.z = u_xlatb12 ? 9.99999975e-05 : float(0.0);
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
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    u_xlat1.xyz = in_TANGENT0.yyy * unity_ObjectToWorld[1].yzx;
					    u_xlat1.xyz = unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
					    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat2.xyz);
					    u_xlat12 = in_TANGENT0.w * unity_WorldTransformParams.w;
					    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
					    vs_TEXCOORD1.y = u_xlat2.x;
					    u_xlat3.xyz = in_POSITION0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat3.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat3.xyz;
					    u_xlat3.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat3.xyz;
					    vs_TEXCOORD1.w = u_xlat3.x;
					    vs_TEXCOORD1.x = u_xlat1.z;
					    vs_TEXCOORD1.z = u_xlat0.y;
					    vs_TEXCOORD2.x = u_xlat1.x;
					    vs_TEXCOORD3.x = u_xlat1.y;
					    vs_TEXCOORD2.z = u_xlat0.z;
					    vs_TEXCOORD3.z = u_xlat0.x;
					    vs_TEXCOORD2.w = u_xlat3.y;
					    vs_TEXCOORD3.w = u_xlat3.z;
					    vs_TEXCOORD2.y = u_xlat2.y;
					    vs_TEXCOORD3.y = u_xlat2.z;
					    vs_TEXCOORD4 = in_COLOR0 * _Color;
					    vs_TEXCOORD5.xyz = in_TANGENT0.xyz;
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
						vec4 unused_0_0[5];
						vec4 _UIAreaUV;
						float unity_OneOverOutputBoost;
						float unity_MaxOutputValue;
						vec4 unused_0_4;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[4];
						vec3 _WorldSpaceCameraPos;
						vec4 unused_1_2[4];
					};
					layout(std140) uniform UnityPerDraw {
						vec4 unused_2_0[12];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_2[6];
					};
					layout(std140) uniform UnityMetaPass {
						vec4 unused_3_0;
						bvec4 unity_MetaFragmentControl;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _FrontPageTex;
					uniform  sampler2D _BackPageTex;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bvec4 u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec2 u_xlat8;
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
					    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD2.xyz;
					    u_xlat0.xyw = vs_TEXCOORD1.xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat0.zzz + u_xlat0.xyw;
					    u_xlat0.x = dot(u_xlat0.xyz, unity_ObjectToWorld[1].xyz);
					    u_xlatb0.x = u_xlat0.x>=0.0;
					    u_xlat8.xy = vs_TEXCOORD0.xy + (-_UIAreaUV.xy);
					    u_xlat1.xy = (-_UIAreaUV.xy) + _UIAreaUV.zw;
					    u_xlat1.xy = u_xlat8.xy / u_xlat1.xy;
					    u_xlat8.xy = u_xlat1.xy + vec2(-0.5, -0.5);
					    u_xlat8.xy = u_xlat8.xy * u_xlat8.xy;
					    u_xlatb0.zw = greaterThanEqual(vec4(0.0, 0.0, 0.25, 0.25), u_xlat8.xxxy).zw;
					    u_xlat4.x = u_xlatb0.x ? float(1.0) : 0.0;
					    u_xlat4.y = u_xlatb0.z ? float(1.0) : 0.0;
					    u_xlat4.z = u_xlatb0.w ? float(1.0) : 0.0;
					;
					    u_xlat8.x = u_xlat4.z * u_xlat4.y;
					    u_xlat4.x = u_xlat8.x * u_xlat4.x;
					    u_xlat0.x = (u_xlatb0.x) ? 0.0 : u_xlat8.x;
					    u_xlat2 = texture(_FrontPageTex, u_xlat1.xy);
					    u_xlat8.x = u_xlat4.x * u_xlat2.w;
					    u_xlat4.x = (-u_xlat4.x) * u_xlat2.w + 1.0;
					    u_xlat2.xyz = u_xlat8.xxx * u_xlat2.xyz;
					    u_xlat3 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xxx + u_xlat2.xyz;
					    u_xlat1.z = (-u_xlat1.x) + 1.0;
					    u_xlat1 = texture(_BackPageTex, u_xlat1.zy);
					    u_xlat2.x = u_xlat0.x * u_xlat1.w;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat1.w + 1.0;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx;
					    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat12 = unity_OneOverOutputBoost;
					    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat12);
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