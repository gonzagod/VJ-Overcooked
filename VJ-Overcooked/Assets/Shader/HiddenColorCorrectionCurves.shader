Shader "Hidden/ColorCorrectionCurves" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "" {}
		_RgbTex ("_RgbTex (RGB)", 2D) = "" {}
		_ZCurve ("_ZCurve (RGB)", 2D) = "" {}
		_RgbDepthTex ("_RgbDepthTex (RGB)", 2D) = "" {}
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 59111
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
						vec4 _CameraDepthTexture_ST;
						vec4 _MainTex_TexelSize;
						vec4 unused_0_3;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec2 u_xlat1;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat1.xy = in_TEXCOORD0.xy * _CameraDepthTexture_ST.xy + _CameraDepthTexture_ST.zw;
					    u_xlat3 = (-u_xlat1.y) + 1.0;
					    vs_TEXCOORD1.y = (u_xlatb0) ? u_xlat3 : u_xlat1.y;
					    vs_TEXCOORD1.x = u_xlat1.x;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						vec4 _CameraDepthTexture_ST;
						vec4 _MainTex_TexelSize;
						vec4 unused_0_3;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec2 u_xlat1;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat1.xy = in_TEXCOORD0.xy * _CameraDepthTexture_ST.xy + _CameraDepthTexture_ST.zw;
					    u_xlat3 = (-u_xlat1.y) + 1.0;
					    vs_TEXCOORD1.y = (u_xlatb0) ? u_xlat3 : u_xlat1.y;
					    vs_TEXCOORD1.x = u_xlat1.x;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
						float _Saturation;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[7];
						vec4 _ZBufferParams;
						vec4 unused_1_2;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _RgbTex;
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _ZCurve;
					uniform  sampler2D _RgbDepthTex;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec2 u_xlat11;
					float u_xlat15;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy).xzyw;
					    u_xlat1.x = u_xlat0.y;
					    u_xlat1.y = float(0.625);
					    u_xlat11.y = float(0.5);
					    u_xlat2 = texture(_RgbDepthTex, u_xlat1.xy);
					    u_xlat3 = texture(_RgbTex, u_xlat1.xy);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0, 0.0, 1.0);
					    SV_Target0.w = u_xlat0.w;
					    u_xlat0.y = float(0.125);
					    u_xlat0.w = float(0.375);
					    u_xlat4 = texture(_RgbDepthTex, u_xlat0.xy);
					    u_xlat2.xyz = u_xlat4.xyz * vec3(1.0, 0.0, 0.0) + u_xlat2.xyz;
					    u_xlat4 = texture(_RgbDepthTex, u_xlat0.zw);
					    u_xlat2.xyz = u_xlat4.xyz * vec3(0.0, 1.0, 0.0) + u_xlat2.xyz;
					    u_xlat4 = texture(_RgbTex, u_xlat0.zw);
					    u_xlat0 = texture(_RgbTex, u_xlat0.xy);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.0, 1.0, 0.0);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.0, 0.0, 0.0) + u_xlat4.xyz;
					    u_xlat0.xyz = u_xlat3.xyz * vec3(0.0, 0.0, 1.0) + u_xlat0.xyz;
					    u_xlat2.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
					    u_xlat3 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy);
					    u_xlat15 = _ZBufferParams.x * u_xlat3.x + _ZBufferParams.y;
					    u_xlat11.x = float(1.0) / u_xlat15;
					    u_xlat1 = texture(_ZCurve, u_xlat11.xy);
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat15 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat0.xyz = (-vec3(u_xlat15)) + u_xlat0.xyz;
					    SV_Target0.xyz = vec3(_Saturation) * u_xlat0.xyz + vec3(u_xlat15);
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
						float _Saturation;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[7];
						vec4 _ZBufferParams;
						vec4 unused_1_2;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _RgbTex;
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _ZCurve;
					uniform  sampler2D _RgbDepthTex;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec2 u_xlat11;
					float u_xlat15;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy).xzyw;
					    u_xlat1.x = u_xlat0.y;
					    u_xlat1.y = float(0.625);
					    u_xlat11.y = float(0.5);
					    u_xlat2 = texture(_RgbDepthTex, u_xlat1.xy);
					    u_xlat3 = texture(_RgbTex, u_xlat1.xy);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0, 0.0, 1.0);
					    SV_Target0.w = u_xlat0.w;
					    u_xlat0.y = float(0.125);
					    u_xlat0.w = float(0.375);
					    u_xlat4 = texture(_RgbDepthTex, u_xlat0.xy);
					    u_xlat2.xyz = u_xlat4.xyz * vec3(1.0, 0.0, 0.0) + u_xlat2.xyz;
					    u_xlat4 = texture(_RgbDepthTex, u_xlat0.zw);
					    u_xlat2.xyz = u_xlat4.xyz * vec3(0.0, 1.0, 0.0) + u_xlat2.xyz;
					    u_xlat4 = texture(_RgbTex, u_xlat0.zw);
					    u_xlat0 = texture(_RgbTex, u_xlat0.xy);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.0, 1.0, 0.0);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.0, 0.0, 0.0) + u_xlat4.xyz;
					    u_xlat0.xyz = u_xlat3.xyz * vec3(0.0, 0.0, 1.0) + u_xlat0.xyz;
					    u_xlat2.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
					    u_xlat3 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy);
					    u_xlat15 = _ZBufferParams.x * u_xlat3.x + _ZBufferParams.y;
					    u_xlat11.x = float(1.0) / u_xlat15;
					    u_xlat1 = texture(_ZCurve, u_xlat11.xy);
					    u_xlat0.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat0.xyz;
					    u_xlat15 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat0.xyz = (-vec3(u_xlat15)) + u_xlat0.xyz;
					    SV_Target0.xyz = vec3(_Saturation) * u_xlat0.xyz + vec3(u_xlat15);
					    return;
					}"
				}
			}
		}
	}
}