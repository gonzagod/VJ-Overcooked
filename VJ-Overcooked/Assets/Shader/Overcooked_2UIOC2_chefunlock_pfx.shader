Shader "Overcooked_2/UI/OC2_chefunlock_pfx" {
	Properties {
		_GlowRotate1 ("Glow Rotate 1", Float) = -1
		_1 ("1", 2D) = "white" {}
		_GlowRotate2 ("Glow Rotate 2", Float) = 1
		_2 ("2", 2D) = "white" {}
		_COlourLayer1 ("COlour Layer 1", Vector) = (0.5,0.5,0.5,1)
		_ColourLayer2 ("Colour Layer 2", Vector) = (0.5,0.5,0.5,1)
		_3 ("3", 2D) = "white" {}
		_4 ("4", 2D) = "white" {}
		_StarRotateSpeed ("Star Rotate Speed", Float) = -0.1
		_StarBackgroundScroll ("Star Background Scroll", Float) = -1
		_StarBackgroundRotate ("Star Background Rotate", Float) = 0
		_node_1154 ("node_1154", Vector) = (0.5,0.5,0.5,1)
		[HideInInspector] _Cutoff ("Alpha cutoff", Range(0, 1)) = 0.5
		_Stencil ("Stencil ID", Float) = 0
		_StencilReadMask ("Stencil Read Mask", Float) = 255
		_StencilWriteMask ("Stencil Write Mask", Float) = 255
		_StencilComp ("Stencil Comparison", Float) = 8
		_StencilOp ("Stencil Operation", Float) = 0
		_StencilOpFail ("Stencil Fail Operation", Float) = 0
		_StencilOpZFail ("Stencil Z-Fail Operation", Float) = 0
	}
	SubShader {
		LOD 100
		Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			Name "FORWARD"
			LOD 100
			Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" "SHADOWSUPPORT" = "true" }
			Blend One OneMinusSrcColor, One OneMinusSrcColor
			ZWrite Off
			Stencil {
				ReadMask 0
				WriteMask 0
				Comp Disabled
				Pass Keep
				Fail Keep
				ZFail Keep
			}
			GpuProgramID 12424
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
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						vec4 unused_0_1[7];
					};
					layout(std140) uniform UnityPerFrame {
						vec4 unused_1_0[17];
						mat4x4 unity_MatrixVP;
						vec4 unused_1_2[2];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * unity_ObjectToWorld[1];
					    u_xlat0 = unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_ObjectToWorld[3];
					    u_xlat1 = u_xlat0.yyyy * unity_MatrixVP[1];
					    u_xlat1 = unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
					    gl_Position = unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						float _ControlledTime;
						float _GlowRotate1;
						vec4 _1_ST;
						float _GlowRotate2;
						vec4 _2_ST;
						vec4 _COlourLayer1;
						vec4 _ColourLayer2;
					};
					uniform  sampler2D _1;
					uniform  sampler2D _2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _ControlledTime * _GlowRotate1;
					    u_xlat1.x = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat2.z = u_xlat0.x;
					    u_xlat2.y = u_xlat1.x;
					    u_xlat2.x = (-u_xlat0.x);
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, u_xlat2.yz);
					    u_xlat1.y = dot(u_xlat0.xy, u_xlat2.xy);
					    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat8.xy = u_xlat8.xy * _1_ST.xy + _1_ST.zw;
					    u_xlat1 = texture(_1, u_xlat8.xy);
					    u_xlat8.x = (-u_xlat1.y) + 1.0;
					    u_xlat12 = _ControlledTime * _GlowRotate2;
					    u_xlat1.x = sin(u_xlat12);
					    u_xlat2.x = cos(u_xlat12);
					    u_xlat3.z = u_xlat1.x;
					    u_xlat3.y = u_xlat2.x;
					    u_xlat3.x = (-u_xlat1.x);
					    u_xlat2.y = dot(u_xlat0.xy, u_xlat3.xy);
					    u_xlat2.x = dot(u_xlat0.xy, u_xlat3.yz);
					    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat0.xy * _2_ST.xy + _2_ST.zw;
					    u_xlat2 = texture(_2, u_xlat0.xy);
					    u_xlat0.x = u_xlat2.x + -0.5;
					    u_xlat0.x = (-u_xlat0.x) * 2.0 + 1.0;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat8.x + 1.0;
					    u_xlat4 = dot(u_xlat1.yy, u_xlat2.xx);
					    u_xlatb8 = 0.5<u_xlat2.x;
					    u_xlat1.xzw = u_xlat2.xxx * _ColourLayer2.xyz;
					    SV_Target0.xyz = _COlourLayer1.xyz * u_xlat1.yyy + u_xlat1.xzw;
					    SV_Target0.w = (u_xlatb8) ? u_xlat0.x : u_xlat4;
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
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
						float _ControlledTime;
						float _GlowRotate1;
						vec4 _1_ST;
						float _GlowRotate2;
						vec4 _2_ST;
						vec4 _COlourLayer1;
						vec4 _ColourLayer2;
					};
					uniform  sampler2D _1;
					uniform  sampler2D _2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _ControlledTime * _GlowRotate1;
					    u_xlat1.x = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat2.z = u_xlat0.x;
					    u_xlat2.y = u_xlat1.x;
					    u_xlat2.x = (-u_xlat0.x);
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, u_xlat2.yz);
					    u_xlat1.y = dot(u_xlat0.xy, u_xlat2.xy);
					    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat8.xy = u_xlat8.xy * _1_ST.xy + _1_ST.zw;
					    u_xlat1 = texture(_1, u_xlat8.xy);
					    u_xlat8.x = (-u_xlat1.y) + 1.0;
					    u_xlat12 = _ControlledTime * _GlowRotate2;
					    u_xlat1.x = sin(u_xlat12);
					    u_xlat2.x = cos(u_xlat12);
					    u_xlat3.z = u_xlat1.x;
					    u_xlat3.y = u_xlat2.x;
					    u_xlat3.x = (-u_xlat1.x);
					    u_xlat2.y = dot(u_xlat0.xy, u_xlat3.xy);
					    u_xlat2.x = dot(u_xlat0.xy, u_xlat3.yz);
					    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat0.xy * _2_ST.xy + _2_ST.zw;
					    u_xlat2 = texture(_2, u_xlat0.xy);
					    u_xlat0.x = u_xlat2.x + -0.5;
					    u_xlat0.x = (-u_xlat0.x) * 2.0 + 1.0;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat8.x + 1.0;
					    u_xlat4 = dot(u_xlat1.yy, u_xlat2.xx);
					    u_xlatb8 = 0.5<u_xlat2.x;
					    u_xlat1.xzw = u_xlat2.xxx * _ColourLayer2.xyz;
					    SV_Target0.xyz = _COlourLayer1.xyz * u_xlat1.yyy + u_xlat1.xzw;
					    SV_Target0.w = (u_xlatb8) ? u_xlat0.x : u_xlat4;
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
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
						float _ControlledTime;
						float _GlowRotate1;
						vec4 _1_ST;
						float _GlowRotate2;
						vec4 _2_ST;
						vec4 _COlourLayer1;
						vec4 _ColourLayer2;
					};
					uniform  sampler2D _1;
					uniform  sampler2D _2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _ControlledTime * _GlowRotate1;
					    u_xlat1.x = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat2.z = u_xlat0.x;
					    u_xlat2.y = u_xlat1.x;
					    u_xlat2.x = (-u_xlat0.x);
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, u_xlat2.yz);
					    u_xlat1.y = dot(u_xlat0.xy, u_xlat2.xy);
					    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat8.xy = u_xlat8.xy * _1_ST.xy + _1_ST.zw;
					    u_xlat1 = texture(_1, u_xlat8.xy);
					    u_xlat8.x = (-u_xlat1.y) + 1.0;
					    u_xlat12 = _ControlledTime * _GlowRotate2;
					    u_xlat1.x = sin(u_xlat12);
					    u_xlat2.x = cos(u_xlat12);
					    u_xlat3.z = u_xlat1.x;
					    u_xlat3.y = u_xlat2.x;
					    u_xlat3.x = (-u_xlat1.x);
					    u_xlat2.y = dot(u_xlat0.xy, u_xlat3.xy);
					    u_xlat2.x = dot(u_xlat0.xy, u_xlat3.yz);
					    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat0.xy * _2_ST.xy + _2_ST.zw;
					    u_xlat2 = texture(_2, u_xlat0.xy);
					    u_xlat0.x = u_xlat2.x + -0.5;
					    u_xlat0.x = (-u_xlat0.x) * 2.0 + 1.0;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat8.x + 1.0;
					    u_xlat4 = dot(u_xlat1.yy, u_xlat2.xx);
					    u_xlatb8 = 0.5<u_xlat2.x;
					    u_xlat1.xzw = u_xlat2.xxx * _ColourLayer2.xyz;
					    SV_Target0.xyz = _COlourLayer1.xyz * u_xlat1.yyy + u_xlat1.xzw;
					    SV_Target0.w = (u_xlatb8) ? u_xlat0.x : u_xlat4;
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
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
						float _ControlledTime;
						float _GlowRotate1;
						vec4 _1_ST;
						float _GlowRotate2;
						vec4 _2_ST;
						vec4 _COlourLayer1;
						vec4 _ColourLayer2;
					};
					uniform  sampler2D _1;
					uniform  sampler2D _2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _ControlledTime * _GlowRotate1;
					    u_xlat1.x = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat2.z = u_xlat0.x;
					    u_xlat2.y = u_xlat1.x;
					    u_xlat2.x = (-u_xlat0.x);
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, u_xlat2.yz);
					    u_xlat1.y = dot(u_xlat0.xy, u_xlat2.xy);
					    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat8.xy = u_xlat8.xy * _1_ST.xy + _1_ST.zw;
					    u_xlat1 = texture(_1, u_xlat8.xy);
					    u_xlat8.x = (-u_xlat1.y) + 1.0;
					    u_xlat12 = _ControlledTime * _GlowRotate2;
					    u_xlat1.x = sin(u_xlat12);
					    u_xlat2.x = cos(u_xlat12);
					    u_xlat3.z = u_xlat1.x;
					    u_xlat3.y = u_xlat2.x;
					    u_xlat3.x = (-u_xlat1.x);
					    u_xlat2.y = dot(u_xlat0.xy, u_xlat3.xy);
					    u_xlat2.x = dot(u_xlat0.xy, u_xlat3.yz);
					    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat0.xy * _2_ST.xy + _2_ST.zw;
					    u_xlat2 = texture(_2, u_xlat0.xy);
					    u_xlat0.x = u_xlat2.x + -0.5;
					    u_xlat0.x = (-u_xlat0.x) * 2.0 + 1.0;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat8.x + 1.0;
					    u_xlat4 = dot(u_xlat1.yy, u_xlat2.xx);
					    u_xlatb8 = 0.5<u_xlat2.x;
					    u_xlat1.xzw = u_xlat2.xxx * _ColourLayer2.xyz;
					    SV_Target0.xyz = _COlourLayer1.xyz * u_xlat1.yyy + u_xlat1.xzw;
					    SV_Target0.w = (u_xlatb8) ? u_xlat0.x : u_xlat4;
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
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
						float _ControlledTime;
						float _GlowRotate1;
						vec4 _1_ST;
						float _GlowRotate2;
						vec4 _2_ST;
						vec4 _COlourLayer1;
						vec4 _ColourLayer2;
					};
					uniform  sampler2D _1;
					uniform  sampler2D _2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _ControlledTime * _GlowRotate1;
					    u_xlat1.x = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat2.z = u_xlat0.x;
					    u_xlat2.y = u_xlat1.x;
					    u_xlat2.x = (-u_xlat0.x);
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, u_xlat2.yz);
					    u_xlat1.y = dot(u_xlat0.xy, u_xlat2.xy);
					    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat8.xy = u_xlat8.xy * _1_ST.xy + _1_ST.zw;
					    u_xlat1 = texture(_1, u_xlat8.xy);
					    u_xlat8.x = (-u_xlat1.y) + 1.0;
					    u_xlat12 = _ControlledTime * _GlowRotate2;
					    u_xlat1.x = sin(u_xlat12);
					    u_xlat2.x = cos(u_xlat12);
					    u_xlat3.z = u_xlat1.x;
					    u_xlat3.y = u_xlat2.x;
					    u_xlat3.x = (-u_xlat1.x);
					    u_xlat2.y = dot(u_xlat0.xy, u_xlat3.xy);
					    u_xlat2.x = dot(u_xlat0.xy, u_xlat3.yz);
					    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat0.xy * _2_ST.xy + _2_ST.zw;
					    u_xlat2 = texture(_2, u_xlat0.xy);
					    u_xlat0.x = u_xlat2.x + -0.5;
					    u_xlat0.x = (-u_xlat0.x) * 2.0 + 1.0;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat8.x + 1.0;
					    u_xlat4 = dot(u_xlat1.yy, u_xlat2.xx);
					    u_xlatb8 = 0.5<u_xlat2.x;
					    u_xlat1.xzw = u_xlat2.xxx * _ColourLayer2.xyz;
					    SV_Target0.xyz = _COlourLayer1.xyz * u_xlat1.yyy + u_xlat1.xzw;
					    SV_Target0.w = (u_xlatb8) ? u_xlat0.x : u_xlat4;
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
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
						float _ControlledTime;
						float _GlowRotate1;
						vec4 _1_ST;
						float _GlowRotate2;
						vec4 _2_ST;
						vec4 _COlourLayer1;
						vec4 _ColourLayer2;
					};
					uniform  sampler2D _1;
					uniform  sampler2D _2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _ControlledTime * _GlowRotate1;
					    u_xlat1.x = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat2.z = u_xlat0.x;
					    u_xlat2.y = u_xlat1.x;
					    u_xlat2.x = (-u_xlat0.x);
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, u_xlat2.yz);
					    u_xlat1.y = dot(u_xlat0.xy, u_xlat2.xy);
					    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat8.xy = u_xlat8.xy * _1_ST.xy + _1_ST.zw;
					    u_xlat1 = texture(_1, u_xlat8.xy);
					    u_xlat8.x = (-u_xlat1.y) + 1.0;
					    u_xlat12 = _ControlledTime * _GlowRotate2;
					    u_xlat1.x = sin(u_xlat12);
					    u_xlat2.x = cos(u_xlat12);
					    u_xlat3.z = u_xlat1.x;
					    u_xlat3.y = u_xlat2.x;
					    u_xlat3.x = (-u_xlat1.x);
					    u_xlat2.y = dot(u_xlat0.xy, u_xlat3.xy);
					    u_xlat2.x = dot(u_xlat0.xy, u_xlat3.yz);
					    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat0.xy * _2_ST.xy + _2_ST.zw;
					    u_xlat2 = texture(_2, u_xlat0.xy);
					    u_xlat0.x = u_xlat2.x + -0.5;
					    u_xlat0.x = (-u_xlat0.x) * 2.0 + 1.0;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat8.x + 1.0;
					    u_xlat4 = dot(u_xlat1.yy, u_xlat2.xx);
					    u_xlatb8 = 0.5<u_xlat2.x;
					    u_xlat1.xzw = u_xlat2.xxx * _ColourLayer2.xyz;
					    SV_Target0.xyz = _COlourLayer1.xyz * u_xlat1.yyy + u_xlat1.xzw;
					    SV_Target0.w = (u_xlatb8) ? u_xlat0.x : u_xlat4;
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
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
						float _ControlledTime;
						float _GlowRotate1;
						vec4 _1_ST;
						float _GlowRotate2;
						vec4 _2_ST;
						vec4 _COlourLayer1;
						vec4 _ColourLayer2;
					};
					uniform  sampler2D _1;
					uniform  sampler2D _2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _ControlledTime * _GlowRotate1;
					    u_xlat1.x = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat2.z = u_xlat0.x;
					    u_xlat2.y = u_xlat1.x;
					    u_xlat2.x = (-u_xlat0.x);
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, u_xlat2.yz);
					    u_xlat1.y = dot(u_xlat0.xy, u_xlat2.xy);
					    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat8.xy = u_xlat8.xy * _1_ST.xy + _1_ST.zw;
					    u_xlat1 = texture(_1, u_xlat8.xy);
					    u_xlat8.x = (-u_xlat1.y) + 1.0;
					    u_xlat12 = _ControlledTime * _GlowRotate2;
					    u_xlat1.x = sin(u_xlat12);
					    u_xlat2.x = cos(u_xlat12);
					    u_xlat3.z = u_xlat1.x;
					    u_xlat3.y = u_xlat2.x;
					    u_xlat3.x = (-u_xlat1.x);
					    u_xlat2.y = dot(u_xlat0.xy, u_xlat3.xy);
					    u_xlat2.x = dot(u_xlat0.xy, u_xlat3.yz);
					    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat0.xy * _2_ST.xy + _2_ST.zw;
					    u_xlat2 = texture(_2, u_xlat0.xy);
					    u_xlat0.x = u_xlat2.x + -0.5;
					    u_xlat0.x = (-u_xlat0.x) * 2.0 + 1.0;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat8.x + 1.0;
					    u_xlat4 = dot(u_xlat1.yy, u_xlat2.xx);
					    u_xlatb8 = 0.5<u_xlat2.x;
					    u_xlat1.xzw = u_xlat2.xxx * _ColourLayer2.xyz;
					    SV_Target0.xyz = _COlourLayer1.xyz * u_xlat1.yyy + u_xlat1.xzw;
					    SV_Target0.w = (u_xlatb8) ? u_xlat0.x : u_xlat4;
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
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
						float _ControlledTime;
						float _GlowRotate1;
						vec4 _1_ST;
						float _GlowRotate2;
						vec4 _2_ST;
						vec4 _COlourLayer1;
						vec4 _ColourLayer2;
					};
					uniform  sampler2D _1;
					uniform  sampler2D _2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _ControlledTime * _GlowRotate1;
					    u_xlat1.x = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat2.z = u_xlat0.x;
					    u_xlat2.y = u_xlat1.x;
					    u_xlat2.x = (-u_xlat0.x);
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, u_xlat2.yz);
					    u_xlat1.y = dot(u_xlat0.xy, u_xlat2.xy);
					    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat8.xy = u_xlat8.xy * _1_ST.xy + _1_ST.zw;
					    u_xlat1 = texture(_1, u_xlat8.xy);
					    u_xlat8.x = (-u_xlat1.y) + 1.0;
					    u_xlat12 = _ControlledTime * _GlowRotate2;
					    u_xlat1.x = sin(u_xlat12);
					    u_xlat2.x = cos(u_xlat12);
					    u_xlat3.z = u_xlat1.x;
					    u_xlat3.y = u_xlat2.x;
					    u_xlat3.x = (-u_xlat1.x);
					    u_xlat2.y = dot(u_xlat0.xy, u_xlat3.xy);
					    u_xlat2.x = dot(u_xlat0.xy, u_xlat3.yz);
					    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat0.xy * _2_ST.xy + _2_ST.zw;
					    u_xlat2 = texture(_2, u_xlat0.xy);
					    u_xlat0.x = u_xlat2.x + -0.5;
					    u_xlat0.x = (-u_xlat0.x) * 2.0 + 1.0;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat8.x + 1.0;
					    u_xlat4 = dot(u_xlat1.yy, u_xlat2.xx);
					    u_xlatb8 = 0.5<u_xlat2.x;
					    u_xlat1.xzw = u_xlat2.xxx * _ColourLayer2.xyz;
					    SV_Target0.xyz = _COlourLayer1.xyz * u_xlat1.yyy + u_xlat1.xzw;
					    SV_Target0.w = (u_xlatb8) ? u_xlat0.x : u_xlat4;
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
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
						float _ControlledTime;
						float _GlowRotate1;
						vec4 _1_ST;
						float _GlowRotate2;
						vec4 _2_ST;
						vec4 _COlourLayer1;
						vec4 _ColourLayer2;
					};
					uniform  sampler2D _1;
					uniform  sampler2D _2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _ControlledTime * _GlowRotate1;
					    u_xlat1.x = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat2.z = u_xlat0.x;
					    u_xlat2.y = u_xlat1.x;
					    u_xlat2.x = (-u_xlat0.x);
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, u_xlat2.yz);
					    u_xlat1.y = dot(u_xlat0.xy, u_xlat2.xy);
					    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat8.xy = u_xlat8.xy * _1_ST.xy + _1_ST.zw;
					    u_xlat1 = texture(_1, u_xlat8.xy);
					    u_xlat8.x = (-u_xlat1.y) + 1.0;
					    u_xlat12 = _ControlledTime * _GlowRotate2;
					    u_xlat1.x = sin(u_xlat12);
					    u_xlat2.x = cos(u_xlat12);
					    u_xlat3.z = u_xlat1.x;
					    u_xlat3.y = u_xlat2.x;
					    u_xlat3.x = (-u_xlat1.x);
					    u_xlat2.y = dot(u_xlat0.xy, u_xlat3.xy);
					    u_xlat2.x = dot(u_xlat0.xy, u_xlat3.yz);
					    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat0.xy * _2_ST.xy + _2_ST.zw;
					    u_xlat2 = texture(_2, u_xlat0.xy);
					    u_xlat0.x = u_xlat2.x + -0.5;
					    u_xlat0.x = (-u_xlat0.x) * 2.0 + 1.0;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat8.x + 1.0;
					    u_xlat4 = dot(u_xlat1.yy, u_xlat2.xx);
					    u_xlatb8 = 0.5<u_xlat2.x;
					    u_xlat1.xzw = u_xlat2.xxx * _ColourLayer2.xyz;
					    SV_Target0.xyz = _COlourLayer1.xyz * u_xlat1.yyy + u_xlat1.xzw;
					    SV_Target0.w = (u_xlatb8) ? u_xlat0.x : u_xlat4;
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
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
						float _ControlledTime;
						float _GlowRotate1;
						vec4 _1_ST;
						float _GlowRotate2;
						vec4 _2_ST;
						vec4 _COlourLayer1;
						vec4 _ColourLayer2;
					};
					uniform  sampler2D _1;
					uniform  sampler2D _2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _ControlledTime * _GlowRotate1;
					    u_xlat1.x = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat2.z = u_xlat0.x;
					    u_xlat2.y = u_xlat1.x;
					    u_xlat2.x = (-u_xlat0.x);
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, u_xlat2.yz);
					    u_xlat1.y = dot(u_xlat0.xy, u_xlat2.xy);
					    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat8.xy = u_xlat8.xy * _1_ST.xy + _1_ST.zw;
					    u_xlat1 = texture(_1, u_xlat8.xy);
					    u_xlat8.x = (-u_xlat1.y) + 1.0;
					    u_xlat12 = _ControlledTime * _GlowRotate2;
					    u_xlat1.x = sin(u_xlat12);
					    u_xlat2.x = cos(u_xlat12);
					    u_xlat3.z = u_xlat1.x;
					    u_xlat3.y = u_xlat2.x;
					    u_xlat3.x = (-u_xlat1.x);
					    u_xlat2.y = dot(u_xlat0.xy, u_xlat3.xy);
					    u_xlat2.x = dot(u_xlat0.xy, u_xlat3.yz);
					    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat0.xy * _2_ST.xy + _2_ST.zw;
					    u_xlat2 = texture(_2, u_xlat0.xy);
					    u_xlat0.x = u_xlat2.x + -0.5;
					    u_xlat0.x = (-u_xlat0.x) * 2.0 + 1.0;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat8.x + 1.0;
					    u_xlat4 = dot(u_xlat1.yy, u_xlat2.xx);
					    u_xlatb8 = 0.5<u_xlat2.x;
					    u_xlat1.xzw = u_xlat2.xxx * _ColourLayer2.xyz;
					    SV_Target0.xyz = _COlourLayer1.xyz * u_xlat1.yyy + u_xlat1.xzw;
					    SV_Target0.w = (u_xlatb8) ? u_xlat0.x : u_xlat4;
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
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
						float _ControlledTime;
						float _GlowRotate1;
						vec4 _1_ST;
						float _GlowRotate2;
						vec4 _2_ST;
						vec4 _COlourLayer1;
						vec4 _ColourLayer2;
					};
					uniform  sampler2D _1;
					uniform  sampler2D _2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _ControlledTime * _GlowRotate1;
					    u_xlat1.x = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat2.z = u_xlat0.x;
					    u_xlat2.y = u_xlat1.x;
					    u_xlat2.x = (-u_xlat0.x);
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, u_xlat2.yz);
					    u_xlat1.y = dot(u_xlat0.xy, u_xlat2.xy);
					    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat8.xy = u_xlat8.xy * _1_ST.xy + _1_ST.zw;
					    u_xlat1 = texture(_1, u_xlat8.xy);
					    u_xlat8.x = (-u_xlat1.y) + 1.0;
					    u_xlat12 = _ControlledTime * _GlowRotate2;
					    u_xlat1.x = sin(u_xlat12);
					    u_xlat2.x = cos(u_xlat12);
					    u_xlat3.z = u_xlat1.x;
					    u_xlat3.y = u_xlat2.x;
					    u_xlat3.x = (-u_xlat1.x);
					    u_xlat2.y = dot(u_xlat0.xy, u_xlat3.xy);
					    u_xlat2.x = dot(u_xlat0.xy, u_xlat3.yz);
					    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat0.xy * _2_ST.xy + _2_ST.zw;
					    u_xlat2 = texture(_2, u_xlat0.xy);
					    u_xlat0.x = u_xlat2.x + -0.5;
					    u_xlat0.x = (-u_xlat0.x) * 2.0 + 1.0;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat8.x + 1.0;
					    u_xlat4 = dot(u_xlat1.yy, u_xlat2.xx);
					    u_xlatb8 = 0.5<u_xlat2.x;
					    u_xlat1.xzw = u_xlat2.xxx * _ColourLayer2.xyz;
					    SV_Target0.xyz = _COlourLayer1.xyz * u_xlat1.yyy + u_xlat1.xzw;
					    SV_Target0.w = (u_xlatb8) ? u_xlat0.x : u_xlat4;
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
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
						float _ControlledTime;
						float _GlowRotate1;
						vec4 _1_ST;
						float _GlowRotate2;
						vec4 _2_ST;
						vec4 _COlourLayer1;
						vec4 _ColourLayer2;
					};
					uniform  sampler2D _1;
					uniform  sampler2D _2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _ControlledTime * _GlowRotate1;
					    u_xlat1.x = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat2.z = u_xlat0.x;
					    u_xlat2.y = u_xlat1.x;
					    u_xlat2.x = (-u_xlat0.x);
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, u_xlat2.yz);
					    u_xlat1.y = dot(u_xlat0.xy, u_xlat2.xy);
					    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat8.xy = u_xlat8.xy * _1_ST.xy + _1_ST.zw;
					    u_xlat1 = texture(_1, u_xlat8.xy);
					    u_xlat8.x = (-u_xlat1.y) + 1.0;
					    u_xlat12 = _ControlledTime * _GlowRotate2;
					    u_xlat1.x = sin(u_xlat12);
					    u_xlat2.x = cos(u_xlat12);
					    u_xlat3.z = u_xlat1.x;
					    u_xlat3.y = u_xlat2.x;
					    u_xlat3.x = (-u_xlat1.x);
					    u_xlat2.y = dot(u_xlat0.xy, u_xlat3.xy);
					    u_xlat2.x = dot(u_xlat0.xy, u_xlat3.yz);
					    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat0.xy * _2_ST.xy + _2_ST.zw;
					    u_xlat2 = texture(_2, u_xlat0.xy);
					    u_xlat0.x = u_xlat2.x + -0.5;
					    u_xlat0.x = (-u_xlat0.x) * 2.0 + 1.0;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat8.x + 1.0;
					    u_xlat4 = dot(u_xlat1.yy, u_xlat2.xx);
					    u_xlatb8 = 0.5<u_xlat2.x;
					    u_xlat1.xzw = u_xlat2.xxx * _ColourLayer2.xyz;
					    SV_Target0.xyz = _COlourLayer1.xyz * u_xlat1.yyy + u_xlat1.xzw;
					    SV_Target0.w = (u_xlatb8) ? u_xlat0.x : u_xlat4;
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
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
						float _ControlledTime;
						float _GlowRotate1;
						vec4 _1_ST;
						float _GlowRotate2;
						vec4 _2_ST;
						vec4 _COlourLayer1;
						vec4 _ColourLayer2;
					};
					uniform  sampler2D _1;
					uniform  sampler2D _2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _ControlledTime * _GlowRotate1;
					    u_xlat1.x = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat2.z = u_xlat0.x;
					    u_xlat2.y = u_xlat1.x;
					    u_xlat2.x = (-u_xlat0.x);
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, u_xlat2.yz);
					    u_xlat1.y = dot(u_xlat0.xy, u_xlat2.xy);
					    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat8.xy = u_xlat8.xy * _1_ST.xy + _1_ST.zw;
					    u_xlat1 = texture(_1, u_xlat8.xy);
					    u_xlat8.x = (-u_xlat1.y) + 1.0;
					    u_xlat12 = _ControlledTime * _GlowRotate2;
					    u_xlat1.x = sin(u_xlat12);
					    u_xlat2.x = cos(u_xlat12);
					    u_xlat3.z = u_xlat1.x;
					    u_xlat3.y = u_xlat2.x;
					    u_xlat3.x = (-u_xlat1.x);
					    u_xlat2.y = dot(u_xlat0.xy, u_xlat3.xy);
					    u_xlat2.x = dot(u_xlat0.xy, u_xlat3.yz);
					    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat0.xy * _2_ST.xy + _2_ST.zw;
					    u_xlat2 = texture(_2, u_xlat0.xy);
					    u_xlat0.x = u_xlat2.x + -0.5;
					    u_xlat0.x = (-u_xlat0.x) * 2.0 + 1.0;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat8.x + 1.0;
					    u_xlat4 = dot(u_xlat1.yy, u_xlat2.xx);
					    u_xlatb8 = 0.5<u_xlat2.x;
					    u_xlat1.xzw = u_xlat2.xxx * _ColourLayer2.xyz;
					    SV_Target0.xyz = _COlourLayer1.xyz * u_xlat1.yyy + u_xlat1.xzw;
					    SV_Target0.w = (u_xlatb8) ? u_xlat0.x : u_xlat4;
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
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
						float _ControlledTime;
						float _GlowRotate1;
						vec4 _1_ST;
						float _GlowRotate2;
						vec4 _2_ST;
						vec4 _COlourLayer1;
						vec4 _ColourLayer2;
					};
					uniform  sampler2D _1;
					uniform  sampler2D _2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _ControlledTime * _GlowRotate1;
					    u_xlat1.x = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat2.z = u_xlat0.x;
					    u_xlat2.y = u_xlat1.x;
					    u_xlat2.x = (-u_xlat0.x);
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, u_xlat2.yz);
					    u_xlat1.y = dot(u_xlat0.xy, u_xlat2.xy);
					    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat8.xy = u_xlat8.xy * _1_ST.xy + _1_ST.zw;
					    u_xlat1 = texture(_1, u_xlat8.xy);
					    u_xlat8.x = (-u_xlat1.y) + 1.0;
					    u_xlat12 = _ControlledTime * _GlowRotate2;
					    u_xlat1.x = sin(u_xlat12);
					    u_xlat2.x = cos(u_xlat12);
					    u_xlat3.z = u_xlat1.x;
					    u_xlat3.y = u_xlat2.x;
					    u_xlat3.x = (-u_xlat1.x);
					    u_xlat2.y = dot(u_xlat0.xy, u_xlat3.xy);
					    u_xlat2.x = dot(u_xlat0.xy, u_xlat3.yz);
					    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat0.xy * _2_ST.xy + _2_ST.zw;
					    u_xlat2 = texture(_2, u_xlat0.xy);
					    u_xlat0.x = u_xlat2.x + -0.5;
					    u_xlat0.x = (-u_xlat0.x) * 2.0 + 1.0;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat8.x + 1.0;
					    u_xlat4 = dot(u_xlat1.yy, u_xlat2.xx);
					    u_xlatb8 = 0.5<u_xlat2.x;
					    u_xlat1.xzw = u_xlat2.xxx * _ColourLayer2.xyz;
					    SV_Target0.xyz = _COlourLayer1.xyz * u_xlat1.yyy + u_xlat1.xzw;
					    SV_Target0.w = (u_xlatb8) ? u_xlat0.x : u_xlat4;
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
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
						float _ControlledTime;
						float _GlowRotate1;
						vec4 _1_ST;
						float _GlowRotate2;
						vec4 _2_ST;
						vec4 _COlourLayer1;
						vec4 _ColourLayer2;
					};
					uniform  sampler2D _1;
					uniform  sampler2D _2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _ControlledTime * _GlowRotate1;
					    u_xlat1.x = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat2.z = u_xlat0.x;
					    u_xlat2.y = u_xlat1.x;
					    u_xlat2.x = (-u_xlat0.x);
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, u_xlat2.yz);
					    u_xlat1.y = dot(u_xlat0.xy, u_xlat2.xy);
					    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat8.xy = u_xlat8.xy * _1_ST.xy + _1_ST.zw;
					    u_xlat1 = texture(_1, u_xlat8.xy);
					    u_xlat8.x = (-u_xlat1.y) + 1.0;
					    u_xlat12 = _ControlledTime * _GlowRotate2;
					    u_xlat1.x = sin(u_xlat12);
					    u_xlat2.x = cos(u_xlat12);
					    u_xlat3.z = u_xlat1.x;
					    u_xlat3.y = u_xlat2.x;
					    u_xlat3.x = (-u_xlat1.x);
					    u_xlat2.y = dot(u_xlat0.xy, u_xlat3.xy);
					    u_xlat2.x = dot(u_xlat0.xy, u_xlat3.yz);
					    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat0.xy * _2_ST.xy + _2_ST.zw;
					    u_xlat2 = texture(_2, u_xlat0.xy);
					    u_xlat0.x = u_xlat2.x + -0.5;
					    u_xlat0.x = (-u_xlat0.x) * 2.0 + 1.0;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat8.x + 1.0;
					    u_xlat4 = dot(u_xlat1.yy, u_xlat2.xx);
					    u_xlatb8 = 0.5<u_xlat2.x;
					    u_xlat1.xzw = u_xlat2.xxx * _ColourLayer2.xyz;
					    SV_Target0.xyz = _COlourLayer1.xyz * u_xlat1.yyy + u_xlat1.xzw;
					    SV_Target0.w = (u_xlatb8) ? u_xlat0.x : u_xlat4;
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
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
						float _ControlledTime;
						float _GlowRotate1;
						vec4 _1_ST;
						float _GlowRotate2;
						vec4 _2_ST;
						vec4 _COlourLayer1;
						vec4 _ColourLayer2;
					};
					uniform  sampler2D _1;
					uniform  sampler2D _2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _ControlledTime * _GlowRotate1;
					    u_xlat1.x = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat2.z = u_xlat0.x;
					    u_xlat2.y = u_xlat1.x;
					    u_xlat2.x = (-u_xlat0.x);
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, u_xlat2.yz);
					    u_xlat1.y = dot(u_xlat0.xy, u_xlat2.xy);
					    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat8.xy = u_xlat8.xy * _1_ST.xy + _1_ST.zw;
					    u_xlat1 = texture(_1, u_xlat8.xy);
					    u_xlat8.x = (-u_xlat1.y) + 1.0;
					    u_xlat12 = _ControlledTime * _GlowRotate2;
					    u_xlat1.x = sin(u_xlat12);
					    u_xlat2.x = cos(u_xlat12);
					    u_xlat3.z = u_xlat1.x;
					    u_xlat3.y = u_xlat2.x;
					    u_xlat3.x = (-u_xlat1.x);
					    u_xlat2.y = dot(u_xlat0.xy, u_xlat3.xy);
					    u_xlat2.x = dot(u_xlat0.xy, u_xlat3.yz);
					    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat0.xy * _2_ST.xy + _2_ST.zw;
					    u_xlat2 = texture(_2, u_xlat0.xy);
					    u_xlat0.x = u_xlat2.x + -0.5;
					    u_xlat0.x = (-u_xlat0.x) * 2.0 + 1.0;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat8.x + 1.0;
					    u_xlat4 = dot(u_xlat1.yy, u_xlat2.xx);
					    u_xlatb8 = 0.5<u_xlat2.x;
					    u_xlat1.xzw = u_xlat2.xxx * _ColourLayer2.xyz;
					    SV_Target0.xyz = _COlourLayer1.xyz * u_xlat1.yyy + u_xlat1.xzw;
					    SV_Target0.w = (u_xlatb8) ? u_xlat0.x : u_xlat4;
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
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
						float _ControlledTime;
						float _GlowRotate1;
						vec4 _1_ST;
						float _GlowRotate2;
						vec4 _2_ST;
						vec4 _COlourLayer1;
						vec4 _ColourLayer2;
					};
					uniform  sampler2D _1;
					uniform  sampler2D _2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _ControlledTime * _GlowRotate1;
					    u_xlat1.x = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat2.z = u_xlat0.x;
					    u_xlat2.y = u_xlat1.x;
					    u_xlat2.x = (-u_xlat0.x);
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, u_xlat2.yz);
					    u_xlat1.y = dot(u_xlat0.xy, u_xlat2.xy);
					    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat8.xy = u_xlat8.xy * _1_ST.xy + _1_ST.zw;
					    u_xlat1 = texture(_1, u_xlat8.xy);
					    u_xlat8.x = (-u_xlat1.y) + 1.0;
					    u_xlat12 = _ControlledTime * _GlowRotate2;
					    u_xlat1.x = sin(u_xlat12);
					    u_xlat2.x = cos(u_xlat12);
					    u_xlat3.z = u_xlat1.x;
					    u_xlat3.y = u_xlat2.x;
					    u_xlat3.x = (-u_xlat1.x);
					    u_xlat2.y = dot(u_xlat0.xy, u_xlat3.xy);
					    u_xlat2.x = dot(u_xlat0.xy, u_xlat3.yz);
					    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat0.xy * _2_ST.xy + _2_ST.zw;
					    u_xlat2 = texture(_2, u_xlat0.xy);
					    u_xlat0.x = u_xlat2.x + -0.5;
					    u_xlat0.x = (-u_xlat0.x) * 2.0 + 1.0;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat8.x + 1.0;
					    u_xlat4 = dot(u_xlat1.yy, u_xlat2.xx);
					    u_xlatb8 = 0.5<u_xlat2.x;
					    u_xlat1.xzw = u_xlat2.xxx * _ColourLayer2.xyz;
					    SV_Target0.xyz = _COlourLayer1.xyz * u_xlat1.yyy + u_xlat1.xzw;
					    SV_Target0.w = (u_xlatb8) ? u_xlat0.x : u_xlat4;
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
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
						float _ControlledTime;
						float _GlowRotate1;
						vec4 _1_ST;
						float _GlowRotate2;
						vec4 _2_ST;
						vec4 _COlourLayer1;
						vec4 _ColourLayer2;
					};
					uniform  sampler2D _1;
					uniform  sampler2D _2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _ControlledTime * _GlowRotate1;
					    u_xlat1.x = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat2.z = u_xlat0.x;
					    u_xlat2.y = u_xlat1.x;
					    u_xlat2.x = (-u_xlat0.x);
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, u_xlat2.yz);
					    u_xlat1.y = dot(u_xlat0.xy, u_xlat2.xy);
					    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat8.xy = u_xlat8.xy * _1_ST.xy + _1_ST.zw;
					    u_xlat1 = texture(_1, u_xlat8.xy);
					    u_xlat8.x = (-u_xlat1.y) + 1.0;
					    u_xlat12 = _ControlledTime * _GlowRotate2;
					    u_xlat1.x = sin(u_xlat12);
					    u_xlat2.x = cos(u_xlat12);
					    u_xlat3.z = u_xlat1.x;
					    u_xlat3.y = u_xlat2.x;
					    u_xlat3.x = (-u_xlat1.x);
					    u_xlat2.y = dot(u_xlat0.xy, u_xlat3.xy);
					    u_xlat2.x = dot(u_xlat0.xy, u_xlat3.yz);
					    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat0.xy * _2_ST.xy + _2_ST.zw;
					    u_xlat2 = texture(_2, u_xlat0.xy);
					    u_xlat0.x = u_xlat2.x + -0.5;
					    u_xlat0.x = (-u_xlat0.x) * 2.0 + 1.0;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat8.x + 1.0;
					    u_xlat4 = dot(u_xlat1.yy, u_xlat2.xx);
					    u_xlatb8 = 0.5<u_xlat2.x;
					    u_xlat1.xzw = u_xlat2.xxx * _ColourLayer2.xyz;
					    SV_Target0.xyz = _COlourLayer1.xyz * u_xlat1.yyy + u_xlat1.xzw;
					    SV_Target0.w = (u_xlatb8) ? u_xlat0.x : u_xlat4;
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
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
						float _ControlledTime;
						float _GlowRotate1;
						vec4 _1_ST;
						float _GlowRotate2;
						vec4 _2_ST;
						vec4 _COlourLayer1;
						vec4 _ColourLayer2;
					};
					uniform  sampler2D _1;
					uniform  sampler2D _2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _ControlledTime * _GlowRotate1;
					    u_xlat1.x = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat2.z = u_xlat0.x;
					    u_xlat2.y = u_xlat1.x;
					    u_xlat2.x = (-u_xlat0.x);
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, u_xlat2.yz);
					    u_xlat1.y = dot(u_xlat0.xy, u_xlat2.xy);
					    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat8.xy = u_xlat8.xy * _1_ST.xy + _1_ST.zw;
					    u_xlat1 = texture(_1, u_xlat8.xy);
					    u_xlat8.x = (-u_xlat1.y) + 1.0;
					    u_xlat12 = _ControlledTime * _GlowRotate2;
					    u_xlat1.x = sin(u_xlat12);
					    u_xlat2.x = cos(u_xlat12);
					    u_xlat3.z = u_xlat1.x;
					    u_xlat3.y = u_xlat2.x;
					    u_xlat3.x = (-u_xlat1.x);
					    u_xlat2.y = dot(u_xlat0.xy, u_xlat3.xy);
					    u_xlat2.x = dot(u_xlat0.xy, u_xlat3.yz);
					    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat0.xy * _2_ST.xy + _2_ST.zw;
					    u_xlat2 = texture(_2, u_xlat0.xy);
					    u_xlat0.x = u_xlat2.x + -0.5;
					    u_xlat0.x = (-u_xlat0.x) * 2.0 + 1.0;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat8.x + 1.0;
					    u_xlat4 = dot(u_xlat1.yy, u_xlat2.xx);
					    u_xlatb8 = 0.5<u_xlat2.x;
					    u_xlat1.xzw = u_xlat2.xxx * _ColourLayer2.xyz;
					    SV_Target0.xyz = _COlourLayer1.xyz * u_xlat1.yyy + u_xlat1.xzw;
					    SV_Target0.w = (u_xlatb8) ? u_xlat0.x : u_xlat4;
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
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
						float _ControlledTime;
						float _GlowRotate1;
						vec4 _1_ST;
						float _GlowRotate2;
						vec4 _2_ST;
						vec4 _COlourLayer1;
						vec4 _ColourLayer2;
					};
					uniform  sampler2D _1;
					uniform  sampler2D _2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _ControlledTime * _GlowRotate1;
					    u_xlat1.x = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat2.z = u_xlat0.x;
					    u_xlat2.y = u_xlat1.x;
					    u_xlat2.x = (-u_xlat0.x);
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, u_xlat2.yz);
					    u_xlat1.y = dot(u_xlat0.xy, u_xlat2.xy);
					    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat8.xy = u_xlat8.xy * _1_ST.xy + _1_ST.zw;
					    u_xlat1 = texture(_1, u_xlat8.xy);
					    u_xlat8.x = (-u_xlat1.y) + 1.0;
					    u_xlat12 = _ControlledTime * _GlowRotate2;
					    u_xlat1.x = sin(u_xlat12);
					    u_xlat2.x = cos(u_xlat12);
					    u_xlat3.z = u_xlat1.x;
					    u_xlat3.y = u_xlat2.x;
					    u_xlat3.x = (-u_xlat1.x);
					    u_xlat2.y = dot(u_xlat0.xy, u_xlat3.xy);
					    u_xlat2.x = dot(u_xlat0.xy, u_xlat3.yz);
					    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat0.xy * _2_ST.xy + _2_ST.zw;
					    u_xlat2 = texture(_2, u_xlat0.xy);
					    u_xlat0.x = u_xlat2.x + -0.5;
					    u_xlat0.x = (-u_xlat0.x) * 2.0 + 1.0;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat8.x + 1.0;
					    u_xlat4 = dot(u_xlat1.yy, u_xlat2.xx);
					    u_xlatb8 = 0.5<u_xlat2.x;
					    u_xlat1.xzw = u_xlat2.xxx * _ColourLayer2.xyz;
					    SV_Target0.xyz = _COlourLayer1.xyz * u_xlat1.yyy + u_xlat1.xzw;
					    SV_Target0.w = (u_xlatb8) ? u_xlat0.x : u_xlat4;
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
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
						float _ControlledTime;
						float _GlowRotate1;
						vec4 _1_ST;
						float _GlowRotate2;
						vec4 _2_ST;
						vec4 _COlourLayer1;
						vec4 _ColourLayer2;
					};
					uniform  sampler2D _1;
					uniform  sampler2D _2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _ControlledTime * _GlowRotate1;
					    u_xlat1.x = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat2.z = u_xlat0.x;
					    u_xlat2.y = u_xlat1.x;
					    u_xlat2.x = (-u_xlat0.x);
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, u_xlat2.yz);
					    u_xlat1.y = dot(u_xlat0.xy, u_xlat2.xy);
					    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat8.xy = u_xlat8.xy * _1_ST.xy + _1_ST.zw;
					    u_xlat1 = texture(_1, u_xlat8.xy);
					    u_xlat8.x = (-u_xlat1.y) + 1.0;
					    u_xlat12 = _ControlledTime * _GlowRotate2;
					    u_xlat1.x = sin(u_xlat12);
					    u_xlat2.x = cos(u_xlat12);
					    u_xlat3.z = u_xlat1.x;
					    u_xlat3.y = u_xlat2.x;
					    u_xlat3.x = (-u_xlat1.x);
					    u_xlat2.y = dot(u_xlat0.xy, u_xlat3.xy);
					    u_xlat2.x = dot(u_xlat0.xy, u_xlat3.yz);
					    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat0.xy * _2_ST.xy + _2_ST.zw;
					    u_xlat2 = texture(_2, u_xlat0.xy);
					    u_xlat0.x = u_xlat2.x + -0.5;
					    u_xlat0.x = (-u_xlat0.x) * 2.0 + 1.0;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat8.x + 1.0;
					    u_xlat4 = dot(u_xlat1.yy, u_xlat2.xx);
					    u_xlatb8 = 0.5<u_xlat2.x;
					    u_xlat1.xzw = u_xlat2.xxx * _ColourLayer2.xyz;
					    SV_Target0.xyz = _COlourLayer1.xyz * u_xlat1.yyy + u_xlat1.xzw;
					    SV_Target0.w = (u_xlatb8) ? u_xlat0.x : u_xlat4;
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
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
						float _ControlledTime;
						float _GlowRotate1;
						vec4 _1_ST;
						float _GlowRotate2;
						vec4 _2_ST;
						vec4 _COlourLayer1;
						vec4 _ColourLayer2;
					};
					uniform  sampler2D _1;
					uniform  sampler2D _2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _ControlledTime * _GlowRotate1;
					    u_xlat1.x = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat2.z = u_xlat0.x;
					    u_xlat2.y = u_xlat1.x;
					    u_xlat2.x = (-u_xlat0.x);
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, u_xlat2.yz);
					    u_xlat1.y = dot(u_xlat0.xy, u_xlat2.xy);
					    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat8.xy = u_xlat8.xy * _1_ST.xy + _1_ST.zw;
					    u_xlat1 = texture(_1, u_xlat8.xy);
					    u_xlat8.x = (-u_xlat1.y) + 1.0;
					    u_xlat12 = _ControlledTime * _GlowRotate2;
					    u_xlat1.x = sin(u_xlat12);
					    u_xlat2.x = cos(u_xlat12);
					    u_xlat3.z = u_xlat1.x;
					    u_xlat3.y = u_xlat2.x;
					    u_xlat3.x = (-u_xlat1.x);
					    u_xlat2.y = dot(u_xlat0.xy, u_xlat3.xy);
					    u_xlat2.x = dot(u_xlat0.xy, u_xlat3.yz);
					    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat0.xy * _2_ST.xy + _2_ST.zw;
					    u_xlat2 = texture(_2, u_xlat0.xy);
					    u_xlat0.x = u_xlat2.x + -0.5;
					    u_xlat0.x = (-u_xlat0.x) * 2.0 + 1.0;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat8.x + 1.0;
					    u_xlat4 = dot(u_xlat1.yy, u_xlat2.xx);
					    u_xlatb8 = 0.5<u_xlat2.x;
					    u_xlat1.xzw = u_xlat2.xxx * _ColourLayer2.xyz;
					    SV_Target0.xyz = _COlourLayer1.xyz * u_xlat1.yyy + u_xlat1.xzw;
					    SV_Target0.w = (u_xlatb8) ? u_xlat0.x : u_xlat4;
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
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
						float _ControlledTime;
						float _GlowRotate1;
						vec4 _1_ST;
						float _GlowRotate2;
						vec4 _2_ST;
						vec4 _COlourLayer1;
						vec4 _ColourLayer2;
					};
					uniform  sampler2D _1;
					uniform  sampler2D _2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _ControlledTime * _GlowRotate1;
					    u_xlat1.x = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat2.z = u_xlat0.x;
					    u_xlat2.y = u_xlat1.x;
					    u_xlat2.x = (-u_xlat0.x);
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, u_xlat2.yz);
					    u_xlat1.y = dot(u_xlat0.xy, u_xlat2.xy);
					    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat8.xy = u_xlat8.xy * _1_ST.xy + _1_ST.zw;
					    u_xlat1 = texture(_1, u_xlat8.xy);
					    u_xlat8.x = (-u_xlat1.y) + 1.0;
					    u_xlat12 = _ControlledTime * _GlowRotate2;
					    u_xlat1.x = sin(u_xlat12);
					    u_xlat2.x = cos(u_xlat12);
					    u_xlat3.z = u_xlat1.x;
					    u_xlat3.y = u_xlat2.x;
					    u_xlat3.x = (-u_xlat1.x);
					    u_xlat2.y = dot(u_xlat0.xy, u_xlat3.xy);
					    u_xlat2.x = dot(u_xlat0.xy, u_xlat3.yz);
					    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat0.xy * _2_ST.xy + _2_ST.zw;
					    u_xlat2 = texture(_2, u_xlat0.xy);
					    u_xlat0.x = u_xlat2.x + -0.5;
					    u_xlat0.x = (-u_xlat0.x) * 2.0 + 1.0;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat8.x + 1.0;
					    u_xlat4 = dot(u_xlat1.yy, u_xlat2.xx);
					    u_xlatb8 = 0.5<u_xlat2.x;
					    u_xlat1.xzw = u_xlat2.xxx * _ColourLayer2.xyz;
					    SV_Target0.xyz = _COlourLayer1.xyz * u_xlat1.yyy + u_xlat1.xzw;
					    SV_Target0.w = (u_xlatb8) ? u_xlat0.x : u_xlat4;
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
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
						float _ControlledTime;
						float _GlowRotate1;
						vec4 _1_ST;
						float _GlowRotate2;
						vec4 _2_ST;
						vec4 _COlourLayer1;
						vec4 _ColourLayer2;
					};
					uniform  sampler2D _1;
					uniform  sampler2D _2;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					vec2 u_xlat8;
					bool u_xlatb8;
					float u_xlat12;
					void main()
					{
					    u_xlat0.x = _ControlledTime * _GlowRotate1;
					    u_xlat1.x = cos(u_xlat0.x);
					    u_xlat0.x = sin(u_xlat0.x);
					    u_xlat2.z = u_xlat0.x;
					    u_xlat2.y = u_xlat1.x;
					    u_xlat2.x = (-u_xlat0.x);
					    u_xlat0.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
					    u_xlat1.x = dot(u_xlat0.xy, u_xlat2.yz);
					    u_xlat1.y = dot(u_xlat0.xy, u_xlat2.xy);
					    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat8.xy = u_xlat8.xy * _1_ST.xy + _1_ST.zw;
					    u_xlat1 = texture(_1, u_xlat8.xy);
					    u_xlat8.x = (-u_xlat1.y) + 1.0;
					    u_xlat12 = _ControlledTime * _GlowRotate2;
					    u_xlat1.x = sin(u_xlat12);
					    u_xlat2.x = cos(u_xlat12);
					    u_xlat3.z = u_xlat1.x;
					    u_xlat3.y = u_xlat2.x;
					    u_xlat3.x = (-u_xlat1.x);
					    u_xlat2.y = dot(u_xlat0.xy, u_xlat3.xy);
					    u_xlat2.x = dot(u_xlat0.xy, u_xlat3.yz);
					    u_xlat0.xy = u_xlat2.xy + vec2(0.5, 0.5);
					    u_xlat0.xy = u_xlat0.xy * _2_ST.xy + _2_ST.zw;
					    u_xlat2 = texture(_2, u_xlat0.xy);
					    u_xlat0.x = u_xlat2.x + -0.5;
					    u_xlat0.x = (-u_xlat0.x) * 2.0 + 1.0;
					    u_xlat0.x = (-u_xlat0.x) * u_xlat8.x + 1.0;
					    u_xlat4 = dot(u_xlat1.yy, u_xlat2.xx);
					    u_xlatb8 = 0.5<u_xlat2.x;
					    u_xlat1.xzw = u_xlat2.xxx * _ColourLayer2.xyz;
					    SV_Target0.xyz = _COlourLayer1.xyz * u_xlat1.yyy + u_xlat1.xzw;
					    SV_Target0.w = (u_xlatb8) ? u_xlat0.x : u_xlat4;
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
					    return;
					}"
				}
			}
		}
	}
	Fallback "Diffuse"
	CustomEditor "ShaderForgeMaterialInspector"
}