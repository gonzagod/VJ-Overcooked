Shader "Overcooked2_Medieval/OC2_GhostFX" {
	Properties {
		_node_7244 ("node_7244", 2D) = "white" {}
		_USpeed ("U Speed", Float) = 0
		_VSpeed ("V Speed", Float) = 0
		_ScreenScale ("Screen Scale", Float) = 0
		_uvscale ("uv scale", Float) = 0
		_Brightness ("Brightness", Float) = 0
		_Speed2 ("Speed 2", Float) = -0.02
		[HideInInspector] _Cutoff ("Alpha cutoff", Range(0, 1)) = 0.5
	}
	SubShader {
		LOD 200
		Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			Name "FORWARD"
			LOD 200
			Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" "SHADOWSUPPORT" = "true" }
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			ZWrite Off
			GpuProgramID 10513
			Program "vp" {
				SubProgram "d3d11 hw_tier00 " {
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
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier01 " {
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
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier02 " {
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
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
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
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
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
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
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
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
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
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
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
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
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
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
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
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
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
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
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
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier00 " {
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
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier01 " {
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
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier02 " {
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
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
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
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
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
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
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
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
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
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
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
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
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
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
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
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
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
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
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
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier00 " {
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
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier01 " {
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
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier02 " {
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
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
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
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
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
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
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
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier00 " {
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
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier01 " {
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
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier02 " {
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
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
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
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
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
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
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
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
			}
			Program "fp" {
				SubProgram "d3d11 hw_tier00 " {
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
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_3_1[22];
					};
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat1.y = dot(u_xlat0.xy, vec2(0.756802499, -0.653643608));
					    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat4.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat0.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat0.xy + u_xlat4.xy;
					    u_xlat0.xy = u_xlat0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat0 = texture(_node_7244, u_xlat0.xy);
					    u_xlat2.x = _Speed2 * _Time.y;
					    u_xlat2.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + u_xlat2.xx;
					    u_xlat2.xy = u_xlat2.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x + u_xlat1.x;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * _Brightness;
					    SV_Target0.w = u_xlat0.x * vs_COLOR0.w;
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat2.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz + u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + vs_COLOR0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier01 " {
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
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_3_1[22];
					};
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat1.y = dot(u_xlat0.xy, vec2(0.756802499, -0.653643608));
					    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat4.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat0.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat0.xy + u_xlat4.xy;
					    u_xlat0.xy = u_xlat0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat0 = texture(_node_7244, u_xlat0.xy);
					    u_xlat2.x = _Speed2 * _Time.y;
					    u_xlat2.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + u_xlat2.xx;
					    u_xlat2.xy = u_xlat2.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x + u_xlat1.x;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * _Brightness;
					    SV_Target0.w = u_xlat0.x * vs_COLOR0.w;
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat2.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz + u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + vs_COLOR0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier02 " {
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
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_3_1[22];
					};
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat1.y = dot(u_xlat0.xy, vec2(0.756802499, -0.653643608));
					    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat4.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat0.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat0.xy + u_xlat4.xy;
					    u_xlat0.xy = u_xlat0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat0 = texture(_node_7244, u_xlat0.xy);
					    u_xlat2.x = _Speed2 * _Time.y;
					    u_xlat2.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + u_xlat2.xx;
					    u_xlat2.xy = u_xlat2.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x + u_xlat1.x;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * _Brightness;
					    SV_Target0.w = u_xlat0.x * vs_COLOR0.w;
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat2.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz + u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + vs_COLOR0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
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
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_3_1[22];
					};
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat1.y = dot(u_xlat0.xy, vec2(0.756802499, -0.653643608));
					    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat4.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat0.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat0.xy + u_xlat4.xy;
					    u_xlat0.xy = u_xlat0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat0 = texture(_node_7244, u_xlat0.xy);
					    u_xlat2.x = _Speed2 * _Time.y;
					    u_xlat2.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + u_xlat2.xx;
					    u_xlat2.xy = u_xlat2.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x + u_xlat1.x;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * _Brightness;
					    SV_Target0.w = u_xlat0.x * vs_COLOR0.w;
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat2.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz + u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + vs_COLOR0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
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
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_3_1[22];
					};
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat1.y = dot(u_xlat0.xy, vec2(0.756802499, -0.653643608));
					    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat4.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat0.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat0.xy + u_xlat4.xy;
					    u_xlat0.xy = u_xlat0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat0 = texture(_node_7244, u_xlat0.xy);
					    u_xlat2.x = _Speed2 * _Time.y;
					    u_xlat2.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + u_xlat2.xx;
					    u_xlat2.xy = u_xlat2.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x + u_xlat1.x;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * _Brightness;
					    SV_Target0.w = u_xlat0.x * vs_COLOR0.w;
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat2.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz + u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + vs_COLOR0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
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
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_3_1[22];
					};
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat1.y = dot(u_xlat0.xy, vec2(0.756802499, -0.653643608));
					    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat4.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat0.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat0.xy + u_xlat4.xy;
					    u_xlat0.xy = u_xlat0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat0 = texture(_node_7244, u_xlat0.xy);
					    u_xlat2.x = _Speed2 * _Time.y;
					    u_xlat2.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + u_xlat2.xx;
					    u_xlat2.xy = u_xlat2.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x + u_xlat1.x;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * _Brightness;
					    SV_Target0.w = u_xlat0.x * vs_COLOR0.w;
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat2.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz + u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + vs_COLOR0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
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
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_3_1[22];
					};
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat1.y = dot(u_xlat0.xy, vec2(0.756802499, -0.653643608));
					    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat4.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat0.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat0.xy + u_xlat4.xy;
					    u_xlat0.xy = u_xlat0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat0 = texture(_node_7244, u_xlat0.xy);
					    u_xlat2.x = _Speed2 * _Time.y;
					    u_xlat2.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + u_xlat2.xx;
					    u_xlat2.xy = u_xlat2.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x + u_xlat1.x;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * _Brightness;
					    SV_Target0.w = u_xlat0.x * vs_COLOR0.w;
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat2.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz + u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + vs_COLOR0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
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
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_3_1[22];
					};
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat1.y = dot(u_xlat0.xy, vec2(0.756802499, -0.653643608));
					    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat4.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat0.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat0.xy + u_xlat4.xy;
					    u_xlat0.xy = u_xlat0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat0 = texture(_node_7244, u_xlat0.xy);
					    u_xlat2.x = _Speed2 * _Time.y;
					    u_xlat2.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + u_xlat2.xx;
					    u_xlat2.xy = u_xlat2.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x + u_xlat1.x;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * _Brightness;
					    SV_Target0.w = u_xlat0.x * vs_COLOR0.w;
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat2.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz + u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + vs_COLOR0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" }
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
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_3_1[22];
					};
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat1.y = dot(u_xlat0.xy, vec2(0.756802499, -0.653643608));
					    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat4.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat0.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat0.xy + u_xlat4.xy;
					    u_xlat0.xy = u_xlat0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat0 = texture(_node_7244, u_xlat0.xy);
					    u_xlat2.x = _Speed2 * _Time.y;
					    u_xlat2.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + u_xlat2.xx;
					    u_xlat2.xy = u_xlat2.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x + u_xlat1.x;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * _Brightness;
					    SV_Target0.w = u_xlat0.x * vs_COLOR0.w;
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat2.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz + u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + vs_COLOR0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
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
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_3_1[22];
					};
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat1.y = dot(u_xlat0.xy, vec2(0.756802499, -0.653643608));
					    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat4.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat0.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat0.xy + u_xlat4.xy;
					    u_xlat0.xy = u_xlat0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat0 = texture(_node_7244, u_xlat0.xy);
					    u_xlat2.x = _Speed2 * _Time.y;
					    u_xlat2.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + u_xlat2.xx;
					    u_xlat2.xy = u_xlat2.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x + u_xlat1.x;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * _Brightness;
					    SV_Target0.w = u_xlat0.x * vs_COLOR0.w;
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat2.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz + u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + vs_COLOR0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
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
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_3_1[22];
					};
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat1.y = dot(u_xlat0.xy, vec2(0.756802499, -0.653643608));
					    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat4.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat0.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat0.xy + u_xlat4.xy;
					    u_xlat0.xy = u_xlat0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat0 = texture(_node_7244, u_xlat0.xy);
					    u_xlat2.x = _Speed2 * _Time.y;
					    u_xlat2.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + u_xlat2.xx;
					    u_xlat2.xy = u_xlat2.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x + u_xlat1.x;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * _Brightness;
					    SV_Target0.w = u_xlat0.x * vs_COLOR0.w;
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat2.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz + u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + vs_COLOR0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" }
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
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_3_1[22];
					};
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat1.y = dot(u_xlat0.xy, vec2(0.756802499, -0.653643608));
					    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat4.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat0.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat0.xy + u_xlat4.xy;
					    u_xlat0.xy = u_xlat0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat0 = texture(_node_7244, u_xlat0.xy);
					    u_xlat2.x = _Speed2 * _Time.y;
					    u_xlat2.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + u_xlat2.xx;
					    u_xlat2.xy = u_xlat2.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x + u_xlat1.x;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * _Brightness;
					    SV_Target0.w = u_xlat0.x * vs_COLOR0.w;
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat2.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz + u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + vs_COLOR0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier00 " {
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
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_3_1[22];
					};
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat1.y = dot(u_xlat0.xy, vec2(0.756802499, -0.653643608));
					    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat4.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat0.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat0.xy + u_xlat4.xy;
					    u_xlat0.xy = u_xlat0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat0 = texture(_node_7244, u_xlat0.xy);
					    u_xlat2.x = _Speed2 * _Time.y;
					    u_xlat2.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + u_xlat2.xx;
					    u_xlat2.xy = u_xlat2.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x + u_xlat1.x;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * _Brightness;
					    SV_Target0.w = u_xlat0.x * vs_COLOR0.w;
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat2.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz + u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + vs_COLOR0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier01 " {
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
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_3_1[22];
					};
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat1.y = dot(u_xlat0.xy, vec2(0.756802499, -0.653643608));
					    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat4.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat0.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat0.xy + u_xlat4.xy;
					    u_xlat0.xy = u_xlat0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat0 = texture(_node_7244, u_xlat0.xy);
					    u_xlat2.x = _Speed2 * _Time.y;
					    u_xlat2.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + u_xlat2.xx;
					    u_xlat2.xy = u_xlat2.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x + u_xlat1.x;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * _Brightness;
					    SV_Target0.w = u_xlat0.x * vs_COLOR0.w;
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat2.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz + u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + vs_COLOR0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier02 " {
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
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_3_1[22];
					};
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat1.y = dot(u_xlat0.xy, vec2(0.756802499, -0.653643608));
					    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat4.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat0.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat0.xy + u_xlat4.xy;
					    u_xlat0.xy = u_xlat0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat0 = texture(_node_7244, u_xlat0.xy);
					    u_xlat2.x = _Speed2 * _Time.y;
					    u_xlat2.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + u_xlat2.xx;
					    u_xlat2.xy = u_xlat2.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x + u_xlat1.x;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * _Brightness;
					    SV_Target0.w = u_xlat0.x * vs_COLOR0.w;
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat2.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz + u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + vs_COLOR0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
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
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_3_1[22];
					};
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat1.y = dot(u_xlat0.xy, vec2(0.756802499, -0.653643608));
					    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat4.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat0.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat0.xy + u_xlat4.xy;
					    u_xlat0.xy = u_xlat0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat0 = texture(_node_7244, u_xlat0.xy);
					    u_xlat2.x = _Speed2 * _Time.y;
					    u_xlat2.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + u_xlat2.xx;
					    u_xlat2.xy = u_xlat2.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x + u_xlat1.x;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * _Brightness;
					    SV_Target0.w = u_xlat0.x * vs_COLOR0.w;
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat2.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz + u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + vs_COLOR0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
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
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_3_1[22];
					};
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat1.y = dot(u_xlat0.xy, vec2(0.756802499, -0.653643608));
					    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat4.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat0.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat0.xy + u_xlat4.xy;
					    u_xlat0.xy = u_xlat0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat0 = texture(_node_7244, u_xlat0.xy);
					    u_xlat2.x = _Speed2 * _Time.y;
					    u_xlat2.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + u_xlat2.xx;
					    u_xlat2.xy = u_xlat2.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x + u_xlat1.x;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * _Brightness;
					    SV_Target0.w = u_xlat0.x * vs_COLOR0.w;
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat2.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz + u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + vs_COLOR0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
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
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_3_1[22];
					};
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat1.y = dot(u_xlat0.xy, vec2(0.756802499, -0.653643608));
					    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat4.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat0.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat0.xy + u_xlat4.xy;
					    u_xlat0.xy = u_xlat0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat0 = texture(_node_7244, u_xlat0.xy);
					    u_xlat2.x = _Speed2 * _Time.y;
					    u_xlat2.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + u_xlat2.xx;
					    u_xlat2.xy = u_xlat2.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x + u_xlat1.x;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * _Brightness;
					    SV_Target0.w = u_xlat0.x * vs_COLOR0.w;
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat2.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz + u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + vs_COLOR0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
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
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_3_1[22];
					};
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat1.y = dot(u_xlat0.xy, vec2(0.756802499, -0.653643608));
					    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat4.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat0.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat0.xy + u_xlat4.xy;
					    u_xlat0.xy = u_xlat0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat0 = texture(_node_7244, u_xlat0.xy);
					    u_xlat2.x = _Speed2 * _Time.y;
					    u_xlat2.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + u_xlat2.xx;
					    u_xlat2.xy = u_xlat2.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x + u_xlat1.x;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * _Brightness;
					    SV_Target0.w = u_xlat0.x * vs_COLOR0.w;
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat2.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz + u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + vs_COLOR0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
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
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_3_1[22];
					};
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat1.y = dot(u_xlat0.xy, vec2(0.756802499, -0.653643608));
					    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat4.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat0.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat0.xy + u_xlat4.xy;
					    u_xlat0.xy = u_xlat0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat0 = texture(_node_7244, u_xlat0.xy);
					    u_xlat2.x = _Speed2 * _Time.y;
					    u_xlat2.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + u_xlat2.xx;
					    u_xlat2.xy = u_xlat2.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x + u_xlat1.x;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * _Brightness;
					    SV_Target0.w = u_xlat0.x * vs_COLOR0.w;
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat2.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz + u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + vs_COLOR0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "SHADOWS_SCREEN" }
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
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_3_1[22];
					};
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat1.y = dot(u_xlat0.xy, vec2(0.756802499, -0.653643608));
					    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat4.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat0.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat0.xy + u_xlat4.xy;
					    u_xlat0.xy = u_xlat0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat0 = texture(_node_7244, u_xlat0.xy);
					    u_xlat2.x = _Speed2 * _Time.y;
					    u_xlat2.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + u_xlat2.xx;
					    u_xlat2.xy = u_xlat2.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x + u_xlat1.x;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * _Brightness;
					    SV_Target0.w = u_xlat0.x * vs_COLOR0.w;
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat2.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz + u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + vs_COLOR0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier00 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
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
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_3_1[22];
					};
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat1.y = dot(u_xlat0.xy, vec2(0.756802499, -0.653643608));
					    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat4.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat0.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat0.xy + u_xlat4.xy;
					    u_xlat0.xy = u_xlat0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat0 = texture(_node_7244, u_xlat0.xy);
					    u_xlat2.x = _Speed2 * _Time.y;
					    u_xlat2.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + u_xlat2.xx;
					    u_xlat2.xy = u_xlat2.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x + u_xlat1.x;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * _Brightness;
					    SV_Target0.w = u_xlat0.x * vs_COLOR0.w;
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat2.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz + u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + vs_COLOR0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier01 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
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
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_3_1[22];
					};
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat1.y = dot(u_xlat0.xy, vec2(0.756802499, -0.653643608));
					    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat4.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat0.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat0.xy + u_xlat4.xy;
					    u_xlat0.xy = u_xlat0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat0 = texture(_node_7244, u_xlat0.xy);
					    u_xlat2.x = _Speed2 * _Time.y;
					    u_xlat2.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + u_xlat2.xx;
					    u_xlat2.xy = u_xlat2.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x + u_xlat1.x;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * _Brightness;
					    SV_Target0.w = u_xlat0.x * vs_COLOR0.w;
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat2.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz + u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + vs_COLOR0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier02 " {
					Keywords { "DIRECTIONAL" "LIGHTMAP_ON" "LIGHTPROBE_SH" "SHADOWS_SCREEN" }
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
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 glstate_lightmodel_ambient;
						vec4 unused_3_1[22];
					};
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat1.y = dot(u_xlat0.xy, vec2(0.756802499, -0.653643608));
					    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat4.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat0.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat0.xy + u_xlat4.xy;
					    u_xlat0.xy = u_xlat0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat0 = texture(_node_7244, u_xlat0.xy);
					    u_xlat2.x = _Speed2 * _Time.y;
					    u_xlat2.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + u_xlat2.xx;
					    u_xlat2.xy = u_xlat2.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x + u_xlat1.x;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * _Brightness;
					    SV_Target0.w = u_xlat0.x * vs_COLOR0.w;
					    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat0.x = inversesqrt(u_xlat0.x);
					    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
					    u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat2.xyz = glstate_lightmodel_ambient.xyz + glstate_lightmodel_ambient.xyz;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz + u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz + vs_COLOR0.xyz;
					    return;
					}"
				}
			}
		}
		Pass {
			Name "FORWARD_DELTA"
			LOD 200
			Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDADD" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Blend One One, One One
			ZWrite Off
			GpuProgramID 98856
			Program "vp" {
				SubProgram "d3d11 hw_tier00 " {
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
						vec4 unused_0_0[2];
						mat4x4 unity_WorldToLight;
						vec4 unused_0_2[4];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					out vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    vs_TEXCOORD2.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    vs_COLOR0 = in_COLOR0;
					    u_xlat1.xyz = u_xlat0.yyy * unity_WorldToLight[1].xyz;
					    u_xlat1.xyz = unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier01 " {
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
						vec4 unused_0_0[2];
						mat4x4 unity_WorldToLight;
						vec4 unused_0_2[4];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					out vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    vs_TEXCOORD2.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    vs_COLOR0 = in_COLOR0;
					    u_xlat1.xyz = u_xlat0.yyy * unity_WorldToLight[1].xyz;
					    u_xlat1.xyz = unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier02 " {
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
						vec4 unused_0_0[2];
						mat4x4 unity_WorldToLight;
						vec4 unused_0_2[4];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					out vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    vs_TEXCOORD2.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    vs_COLOR0 = in_COLOR0;
					    u_xlat1.xyz = u_xlat0.yyy * unity_WorldToLight[1].xyz;
					    u_xlat1.xyz = unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier00 " {
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
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier01 " {
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
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier02 " {
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
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    vs_TEXCOORD1 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat0 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
					    u_xlat0 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    vs_TEXCOORD2.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier00 " {
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
						vec4 unused_0_0[2];
						mat4x4 unity_WorldToLight;
						vec4 unused_0_2[4];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					out vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    vs_TEXCOORD2.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    vs_COLOR0 = in_COLOR0;
					    u_xlat1 = u_xlat0.yyyy * unity_WorldToLight[1];
					    u_xlat1 = unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD3 = unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier01 " {
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
						vec4 unused_0_0[2];
						mat4x4 unity_WorldToLight;
						vec4 unused_0_2[4];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					out vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    vs_TEXCOORD2.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    vs_COLOR0 = in_COLOR0;
					    u_xlat1 = u_xlat0.yyyy * unity_WorldToLight[1];
					    u_xlat1 = unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD3 = unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier02 " {
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
						vec4 unused_0_0[2];
						mat4x4 unity_WorldToLight;
						vec4 unused_0_2[4];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					out vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    vs_TEXCOORD2.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    vs_COLOR0 = in_COLOR0;
					    u_xlat1 = u_xlat0.yyyy * unity_WorldToLight[1];
					    u_xlat1 = unity_WorldToLight[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_WorldToLight[2] * u_xlat0.zzzz + u_xlat1;
					    vs_TEXCOORD3 = unity_WorldToLight[3] * u_xlat0.wwww + u_xlat1;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier00 " {
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
						vec4 unused_0_0[2];
						mat4x4 unity_WorldToLight;
						vec4 unused_0_2[4];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					out vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    vs_TEXCOORD2.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    vs_COLOR0 = in_COLOR0;
					    u_xlat1.xyz = u_xlat0.yyy * unity_WorldToLight[1].xyz;
					    u_xlat1.xyz = unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier01 " {
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
						vec4 unused_0_0[2];
						mat4x4 unity_WorldToLight;
						vec4 unused_0_2[4];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					out vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    vs_TEXCOORD2.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    vs_COLOR0 = in_COLOR0;
					    u_xlat1.xyz = u_xlat0.yyy * unity_WorldToLight[1].xyz;
					    u_xlat1.xyz = unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier02 " {
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
						vec4 unused_0_0[2];
						mat4x4 unity_WorldToLight;
						vec4 unused_0_2[4];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					out vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat10 = inversesqrt(u_xlat10);
					    vs_TEXCOORD2.xyz = vec3(u_xlat10) * u_xlat1.xyz;
					    vs_COLOR0 = in_COLOR0;
					    u_xlat1.xyz = u_xlat0.yyy * unity_WorldToLight[1].xyz;
					    u_xlat1.xyz = unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat0.xyz = unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
					    vs_TEXCOORD3.xyz = unity_WorldToLight[3].xyz * u_xlat0.www + u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier00 " {
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
						vec4 unused_0_0[2];
						mat4x4 unity_WorldToLight;
						vec4 unused_0_2[4];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat1.xy = u_xlat0.yy * unity_WorldToLight[1].xy;
					    u_xlat1.xy = unity_WorldToLight[0].xy * u_xlat0.xx + u_xlat1.xy;
					    u_xlat1.xy = unity_WorldToLight[2].xy * u_xlat0.zz + u_xlat1.xy;
					    vs_TEXCOORD3.xy = unity_WorldToLight[3].xy * u_xlat0.ww + u_xlat1.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    vs_TEXCOORD2.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier01 " {
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
						vec4 unused_0_0[2];
						mat4x4 unity_WorldToLight;
						vec4 unused_0_2[4];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat1.xy = u_xlat0.yy * unity_WorldToLight[1].xy;
					    u_xlat1.xy = unity_WorldToLight[0].xy * u_xlat0.xx + u_xlat1.xy;
					    u_xlat1.xy = unity_WorldToLight[2].xy * u_xlat0.zz + u_xlat1.xy;
					    vs_TEXCOORD3.xy = unity_WorldToLight[3].xy * u_xlat0.ww + u_xlat1.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    vs_TEXCOORD2.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier02 " {
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
						vec4 unused_0_0[2];
						mat4x4 unity_WorldToLight;
						vec4 unused_0_2[4];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_1_2[3];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_2_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_2_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					in  vec2 in_TEXCOORD0;
					in  vec4 in_COLOR0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD3;
					out vec4 vs_TEXCOORD1;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat9;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat1 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat0 = unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat2 = u_xlat1.yyyy * unity_MatrixVP[1];
					    u_xlat2 = unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
					    u_xlat2 = unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
					    gl_Position = unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
					    u_xlat1.xy = u_xlat0.yy * unity_WorldToLight[1].xy;
					    u_xlat1.xy = unity_WorldToLight[0].xy * u_xlat0.xx + u_xlat1.xy;
					    u_xlat1.xy = unity_WorldToLight[2].xy * u_xlat0.zz + u_xlat1.xy;
					    vs_TEXCOORD3.xy = unity_WorldToLight[3].xy * u_xlat0.ww + u_xlat1.xy;
					    vs_TEXCOORD1 = u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    vs_TEXCOORD2.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    vs_COLOR0 = in_COLOR0;
					    return;
					}"
				}
			}
			Program "fp" {
				SubProgram "d3d11 hw_tier00 " {
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
						vec4 unused_0_0[6];
						vec4 _LightColor0;
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					in  vec3 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat1.y = dot(u_xlat0.xy, vec2(0.756802499, -0.653643608));
					    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat4.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat0.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat0.xy + u_xlat4.xy;
					    u_xlat0.xy = u_xlat0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat0 = texture(_node_7244, u_xlat0.xy);
					    u_xlat2.x = _Speed2 * _Time.y;
					    u_xlat2.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + u_xlat2.xx;
					    u_xlat2.xy = u_xlat2.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x + u_xlat1.x;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * _Brightness;
					    u_xlat2.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
					    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
					    u_xlat2.x = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlat2.x = max(u_xlat2.x, 0.0);
					    u_xlat4.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat1 = texture(_LightTexture0, u_xlat4.xx);
					    u_xlat1.xyz = u_xlat1.xxx * _LightColor0.xyz;
					    u_xlat0.yzw = u_xlat2.xxx * u_xlat1.xyz;
					    u_xlat0 = u_xlat0 * vs_COLOR0.wxyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat0.yzw;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier01 " {
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
						vec4 unused_0_0[6];
						vec4 _LightColor0;
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					in  vec3 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat1.y = dot(u_xlat0.xy, vec2(0.756802499, -0.653643608));
					    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat4.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat0.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat0.xy + u_xlat4.xy;
					    u_xlat0.xy = u_xlat0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat0 = texture(_node_7244, u_xlat0.xy);
					    u_xlat2.x = _Speed2 * _Time.y;
					    u_xlat2.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + u_xlat2.xx;
					    u_xlat2.xy = u_xlat2.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x + u_xlat1.x;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * _Brightness;
					    u_xlat2.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
					    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
					    u_xlat2.x = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlat2.x = max(u_xlat2.x, 0.0);
					    u_xlat4.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat1 = texture(_LightTexture0, u_xlat4.xx);
					    u_xlat1.xyz = u_xlat1.xxx * _LightColor0.xyz;
					    u_xlat0.yzw = u_xlat2.xxx * u_xlat1.xyz;
					    u_xlat0 = u_xlat0 * vs_COLOR0.wxyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat0.yzw;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier02 " {
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
						vec4 unused_0_0[6];
						vec4 _LightColor0;
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					in  vec3 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat1.y = dot(u_xlat0.xy, vec2(0.756802499, -0.653643608));
					    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat4.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat0.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat0.xy + u_xlat4.xy;
					    u_xlat0.xy = u_xlat0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat0 = texture(_node_7244, u_xlat0.xy);
					    u_xlat2.x = _Speed2 * _Time.y;
					    u_xlat2.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + u_xlat2.xx;
					    u_xlat2.xy = u_xlat2.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x + u_xlat1.x;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * _Brightness;
					    u_xlat2.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
					    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
					    u_xlat2.x = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlat2.x = max(u_xlat2.x, 0.0);
					    u_xlat4.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat1 = texture(_LightTexture0, u_xlat4.xx);
					    u_xlat1.xyz = u_xlat1.xxx * _LightColor0.xyz;
					    u_xlat0.yzw = u_xlat2.xxx * u_xlat1.xyz;
					    u_xlat0 = u_xlat0 * vs_COLOR0.wxyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat0.yzw;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier00 " {
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
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat1.y = dot(u_xlat0.xy, vec2(0.756802499, -0.653643608));
					    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat4.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat0.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat0.xy + u_xlat4.xy;
					    u_xlat0.xy = u_xlat0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat0 = texture(_node_7244, u_xlat0.xy);
					    u_xlat2.x = _Speed2 * _Time.y;
					    u_xlat2.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + u_xlat2.xx;
					    u_xlat2.xy = u_xlat2.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x + u_xlat1.x;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * _Brightness;
					    u_xlat2.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
					    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
					    u_xlat2.x = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlat2.x = max(u_xlat2.x, 0.0);
					    u_xlat0.yzw = u_xlat2.xxx * _LightColor0.xyz;
					    u_xlat0 = u_xlat0 * vs_COLOR0.wxyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat0.yzw;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier01 " {
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
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat1.y = dot(u_xlat0.xy, vec2(0.756802499, -0.653643608));
					    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat4.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat0.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat0.xy + u_xlat4.xy;
					    u_xlat0.xy = u_xlat0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat0 = texture(_node_7244, u_xlat0.xy);
					    u_xlat2.x = _Speed2 * _Time.y;
					    u_xlat2.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + u_xlat2.xx;
					    u_xlat2.xy = u_xlat2.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x + u_xlat1.x;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * _Brightness;
					    u_xlat2.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
					    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
					    u_xlat2.x = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlat2.x = max(u_xlat2.x, 0.0);
					    u_xlat0.yzw = u_xlat2.xxx * _LightColor0.xyz;
					    u_xlat0 = u_xlat0 * vs_COLOR0.wxyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat0.yzw;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier02 " {
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
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat1.y = dot(u_xlat0.xy, vec2(0.756802499, -0.653643608));
					    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat4.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat0.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat0.xy + u_xlat4.xy;
					    u_xlat0.xy = u_xlat0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat0 = texture(_node_7244, u_xlat0.xy);
					    u_xlat2.x = _Speed2 * _Time.y;
					    u_xlat2.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + u_xlat2.xx;
					    u_xlat2.xy = u_xlat2.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x + u_xlat1.x;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * _Brightness;
					    u_xlat2.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
					    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
					    u_xlat2.x = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlat2.x = max(u_xlat2.x, 0.0);
					    u_xlat0.yzw = u_xlat2.xxx * _LightColor0.xyz;
					    u_xlat0 = u_xlat0 * vs_COLOR0.wxyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat0.yzw;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier00 " {
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
						vec4 unused_0_0[6];
						vec4 _LightColor0;
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat3;
					vec2 u_xlat4;
					vec2 u_xlat7;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
					    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
					    u_xlat0 = texture(_LightTexture0, u_xlat0.xy);
					    u_xlatb0 = 0.0<vs_TEXCOORD3.z;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat0.x = u_xlat0.w * u_xlat0.x;
					    u_xlat3 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat1 = texture(_LightTextureB0, vec2(u_xlat3));
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
					    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
					    u_xlat9 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat2.xyz = vec3(u_xlat9) * vs_TEXCOORD2.xyz;
					    u_xlat9 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat9 = max(u_xlat9, 0.0);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9);
					    u_xlat1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat2.x = dot(u_xlat1.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat2.y = dot(u_xlat1.xy, vec2(0.756802499, -0.653643608));
					    u_xlat1.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat7.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat1.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat1.xy + u_xlat7.xy;
					    u_xlat1.xy = u_xlat1.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat1.xy);
					    u_xlat9 = _Speed2 * _Time.y;
					    u_xlat4.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + vec2(u_xlat9);
					    u_xlat4.xy = u_xlat4.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat2 = texture(_node_7244, u_xlat4.xy);
					    u_xlat9 = u_xlat1.x + u_xlat2.x;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat1.xy);
					    u_xlat9 = u_xlat9 * u_xlat1.y;
					    u_xlat0.w = u_xlat9 * _Brightness;
					    u_xlat0 = u_xlat0 * vs_COLOR0;
					    SV_Target0.xyz = u_xlat0.www * u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier01 " {
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
						vec4 unused_0_0[6];
						vec4 _LightColor0;
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat3;
					vec2 u_xlat4;
					vec2 u_xlat7;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
					    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
					    u_xlat0 = texture(_LightTexture0, u_xlat0.xy);
					    u_xlatb0 = 0.0<vs_TEXCOORD3.z;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat0.x = u_xlat0.w * u_xlat0.x;
					    u_xlat3 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat1 = texture(_LightTextureB0, vec2(u_xlat3));
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
					    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
					    u_xlat9 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat2.xyz = vec3(u_xlat9) * vs_TEXCOORD2.xyz;
					    u_xlat9 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat9 = max(u_xlat9, 0.0);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9);
					    u_xlat1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat2.x = dot(u_xlat1.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat2.y = dot(u_xlat1.xy, vec2(0.756802499, -0.653643608));
					    u_xlat1.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat7.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat1.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat1.xy + u_xlat7.xy;
					    u_xlat1.xy = u_xlat1.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat1.xy);
					    u_xlat9 = _Speed2 * _Time.y;
					    u_xlat4.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + vec2(u_xlat9);
					    u_xlat4.xy = u_xlat4.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat2 = texture(_node_7244, u_xlat4.xy);
					    u_xlat9 = u_xlat1.x + u_xlat2.x;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat1.xy);
					    u_xlat9 = u_xlat9 * u_xlat1.y;
					    u_xlat0.w = u_xlat9 * _Brightness;
					    u_xlat0 = u_xlat0 * vs_COLOR0;
					    SV_Target0.xyz = u_xlat0.www * u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier02 " {
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
						vec4 unused_0_0[6];
						vec4 _LightColor0;
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat3;
					vec2 u_xlat4;
					vec2 u_xlat7;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
					    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
					    u_xlat0 = texture(_LightTexture0, u_xlat0.xy);
					    u_xlatb0 = 0.0<vs_TEXCOORD3.z;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat0.x = u_xlat0.w * u_xlat0.x;
					    u_xlat3 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat1 = texture(_LightTextureB0, vec2(u_xlat3));
					    u_xlat0.x = u_xlat0.x * u_xlat1.x;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
					    u_xlat1.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
					    u_xlat9 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat2.xyz = vec3(u_xlat9) * vs_TEXCOORD2.xyz;
					    u_xlat9 = dot(u_xlat2.xyz, u_xlat1.xyz);
					    u_xlat9 = max(u_xlat9, 0.0);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9);
					    u_xlat1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat2.x = dot(u_xlat1.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat2.y = dot(u_xlat1.xy, vec2(0.756802499, -0.653643608));
					    u_xlat1.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat7.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat1.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat1.xy + u_xlat7.xy;
					    u_xlat1.xy = u_xlat1.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat1.xy);
					    u_xlat9 = _Speed2 * _Time.y;
					    u_xlat4.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + vec2(u_xlat9);
					    u_xlat4.xy = u_xlat4.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat2 = texture(_node_7244, u_xlat4.xy);
					    u_xlat9 = u_xlat1.x + u_xlat2.x;
					    u_xlat1.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat1.xy);
					    u_xlat9 = u_xlat9 * u_xlat1.y;
					    u_xlat0.w = u_xlat9 * _Brightness;
					    u_xlat0 = u_xlat0 * vs_COLOR0;
					    SV_Target0.xyz = u_xlat0.www * u_xlat0.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier00 " {
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
						vec4 unused_0_0[6];
						vec4 _LightColor0;
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					in  vec3 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec2 u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat1.y = dot(u_xlat0.xy, vec2(0.756802499, -0.653643608));
					    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat6.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat0.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat0.xy + u_xlat6.xy;
					    u_xlat0.xy = u_xlat0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat0 = texture(_node_7244, u_xlat0.xy);
					    u_xlat3.x = _Speed2 * _Time.y;
					    u_xlat3.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + u_xlat3.xx;
					    u_xlat3.xy = u_xlat3.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat3.xy);
					    u_xlat0.x = u_xlat0.x + u_xlat1.x;
					    u_xlat3.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat3.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * _Brightness;
					    u_xlat3.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat3.xyz = u_xlat3.xyz * u_xlat1.xxx;
					    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
					    u_xlat3.x = dot(u_xlat1.xyz, u_xlat3.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlat6.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat1 = texture(_LightTextureB0, u_xlat6.xx);
					    u_xlat2 = texture(_LightTexture0, vs_TEXCOORD3.xyz);
					    u_xlat6.x = u_xlat1.x * u_xlat2.w;
					    u_xlat1.xyz = u_xlat6.xxx * _LightColor0.xyz;
					    u_xlat0.yzw = u_xlat3.xxx * u_xlat1.xyz;
					    u_xlat0 = u_xlat0 * vs_COLOR0.wxyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat0.yzw;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier01 " {
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
						vec4 unused_0_0[6];
						vec4 _LightColor0;
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					in  vec3 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec2 u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat1.y = dot(u_xlat0.xy, vec2(0.756802499, -0.653643608));
					    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat6.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat0.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat0.xy + u_xlat6.xy;
					    u_xlat0.xy = u_xlat0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat0 = texture(_node_7244, u_xlat0.xy);
					    u_xlat3.x = _Speed2 * _Time.y;
					    u_xlat3.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + u_xlat3.xx;
					    u_xlat3.xy = u_xlat3.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat3.xy);
					    u_xlat0.x = u_xlat0.x + u_xlat1.x;
					    u_xlat3.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat3.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * _Brightness;
					    u_xlat3.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat3.xyz = u_xlat3.xyz * u_xlat1.xxx;
					    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
					    u_xlat3.x = dot(u_xlat1.xyz, u_xlat3.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlat6.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat1 = texture(_LightTextureB0, u_xlat6.xx);
					    u_xlat2 = texture(_LightTexture0, vs_TEXCOORD3.xyz);
					    u_xlat6.x = u_xlat1.x * u_xlat2.w;
					    u_xlat1.xyz = u_xlat6.xxx * _LightColor0.xyz;
					    u_xlat0.yzw = u_xlat3.xxx * u_xlat1.xyz;
					    u_xlat0 = u_xlat0 * vs_COLOR0.wxyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat0.yzw;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier02 " {
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
						vec4 unused_0_0[6];
						vec4 _LightColor0;
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					in  vec3 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					vec2 u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat1.y = dot(u_xlat0.xy, vec2(0.756802499, -0.653643608));
					    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat6.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat0.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat0.xy + u_xlat6.xy;
					    u_xlat0.xy = u_xlat0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat0 = texture(_node_7244, u_xlat0.xy);
					    u_xlat3.x = _Speed2 * _Time.y;
					    u_xlat3.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + u_xlat3.xx;
					    u_xlat3.xy = u_xlat3.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat3.xy);
					    u_xlat0.x = u_xlat0.x + u_xlat1.x;
					    u_xlat3.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat3.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * _Brightness;
					    u_xlat3.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat3.xyz = u_xlat3.xyz * u_xlat1.xxx;
					    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
					    u_xlat3.x = dot(u_xlat1.xyz, u_xlat3.xyz);
					    u_xlat3.x = max(u_xlat3.x, 0.0);
					    u_xlat6.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
					    u_xlat1 = texture(_LightTextureB0, u_xlat6.xx);
					    u_xlat2 = texture(_LightTexture0, vs_TEXCOORD3.xyz);
					    u_xlat6.x = u_xlat1.x * u_xlat2.w;
					    u_xlat1.xyz = u_xlat6.xxx * _LightColor0.xyz;
					    u_xlat0.yzw = u_xlat3.xxx * u_xlat1.xyz;
					    u_xlat0 = u_xlat0 * vs_COLOR0.wxyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat0.yzw;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier00 " {
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
						vec4 unused_0_0[6];
						vec4 _LightColor0;
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD3;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat1.y = dot(u_xlat0.xy, vec2(0.756802499, -0.653643608));
					    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat4.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat0.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat0.xy + u_xlat4.xy;
					    u_xlat0.xy = u_xlat0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat0 = texture(_node_7244, u_xlat0.xy);
					    u_xlat2.x = _Speed2 * _Time.y;
					    u_xlat2.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + u_xlat2.xx;
					    u_xlat2.xy = u_xlat2.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x + u_xlat1.x;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * _Brightness;
					    u_xlat2.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
					    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
					    u_xlat2.x = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlat2.x = max(u_xlat2.x, 0.0);
					    u_xlat1 = texture(_LightTexture0, vs_TEXCOORD3.xy);
					    u_xlat1.xyz = u_xlat1.www * _LightColor0.xyz;
					    u_xlat0.yzw = u_xlat2.xxx * u_xlat1.xyz;
					    u_xlat0 = u_xlat0 * vs_COLOR0.wxyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat0.yzw;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier01 " {
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
						vec4 unused_0_0[6];
						vec4 _LightColor0;
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD3;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat1.y = dot(u_xlat0.xy, vec2(0.756802499, -0.653643608));
					    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat4.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat0.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat0.xy + u_xlat4.xy;
					    u_xlat0.xy = u_xlat0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat0 = texture(_node_7244, u_xlat0.xy);
					    u_xlat2.x = _Speed2 * _Time.y;
					    u_xlat2.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + u_xlat2.xx;
					    u_xlat2.xy = u_xlat2.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x + u_xlat1.x;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * _Brightness;
					    u_xlat2.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
					    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
					    u_xlat2.x = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlat2.x = max(u_xlat2.x, 0.0);
					    u_xlat1 = texture(_LightTexture0, vs_TEXCOORD3.xy);
					    u_xlat1.xyz = u_xlat1.www * _LightColor0.xyz;
					    u_xlat0.yzw = u_xlat2.xxx * u_xlat1.xyz;
					    u_xlat0 = u_xlat0 * vs_COLOR0.wxyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat0.yzw;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11 hw_tier02 " {
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
						vec4 unused_0_0[6];
						vec4 _LightColor0;
						vec4 _node_7244_ST;
						float _USpeed;
						float _VSpeed;
						float _ScreenScale;
						float _uvscale;
						float _Brightness;
						float _Speed2;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_2_1[47];
					};
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _node_7244;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD3;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, vec2(-0.653643608, -0.756802499));
					    u_xlat1.y = dot(u_xlat0.xy, vec2(0.756802499, -0.653643608));
					    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat4.xy = vec2(_USpeed, _VSpeed) * _Time.yy;
					    u_xlat0.xy = vec2(vec2(_ScreenScale, _ScreenScale)) * u_xlat0.xy + u_xlat4.xy;
					    u_xlat0.xy = u_xlat0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat0 = texture(_node_7244, u_xlat0.xy);
					    u_xlat2.x = _Speed2 * _Time.y;
					    u_xlat2.xy = vec2(vec2(_uvscale, _uvscale)) * vs_TEXCOORD0.xy + u_xlat2.xx;
					    u_xlat2.xy = u_xlat2.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x + u_xlat1.x;
					    u_xlat2.xy = vs_TEXCOORD0.xy * _node_7244_ST.xy + _node_7244_ST.zw;
					    u_xlat1 = texture(_node_7244, u_xlat2.xy);
					    u_xlat0.x = u_xlat0.x * u_xlat1.y;
					    u_xlat0.x = u_xlat0.x * _Brightness;
					    u_xlat2.xyz = _WorldSpaceLightPos0.www * (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat2.xyz = u_xlat2.xyz * u_xlat1.xxx;
					    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
					    u_xlat1.x = inversesqrt(u_xlat1.x);
					    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
					    u_xlat2.x = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlat2.x = max(u_xlat2.x, 0.0);
					    u_xlat1 = texture(_LightTexture0, vs_TEXCOORD3.xy);
					    u_xlat1.xyz = u_xlat1.www * _LightColor0.xyz;
					    u_xlat0.yzw = u_xlat2.xxx * u_xlat1.xyz;
					    u_xlat0 = u_xlat0 * vs_COLOR0.wxyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat0.yzw;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
			}
		}
	}
	Fallback "Diffuse"
	CustomEditor "ShaderForgeMaterialInspector"
}