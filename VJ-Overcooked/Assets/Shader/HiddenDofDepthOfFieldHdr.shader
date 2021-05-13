Shader "Hidden/Dof/DepthOfFieldHdr" {
	Properties {
		_MainTex ("-", 2D) = "black" {}
		_FgOverlap ("-", 2D) = "black" {}
		_LowRez ("-", 2D) = "black" {}
	}
	SubShader {
		Pass {
			ColorMask A -1
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 36740
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
						vec4 unused_0_0[3];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat1 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.y = (u_xlatb0) ? u_xlat1 : in_TEXCOORD0.y;
					    phase0_Output0_1.xzw = in_TEXCOORD0.xxy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
						vec4 _CurveParams;
						vec4 unused_0_2[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[7];
						vec4 _ZBufferParams;
						vec4 unused_1_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat1 = u_xlat0.x + (-_CurveParams.w);
					    u_xlat0.x = u_xlat0.x + 9.99999975e-06;
					    u_xlat1 = abs(u_xlat1) * _CurveParams.z;
					    u_xlat0.x = u_xlat1 / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-_CurveParams.y);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    SV_Target0.w = min(u_xlat0.x, _CurveParams.x);
					    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
					    return;
					}"
				}
			}
		}
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 112445
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
						vec4 unused_0_0[3];
						vec4 _MainTex_TexelSize;
						vec4 _Offsets;
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
					out vec4 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = 1.0;
					    u_xlat0.zw = _MainTex_TexelSize.xy;
					    u_xlat0 = u_xlat0.xxzw * _Offsets.xyxy;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_TexelSize.xy;
					    vs_TEXCOORD1 = u_xlat0 * vec4(0.166666672, 0.166666672, -0.166666672, -0.166666672) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2 = u_xlat0.zwzw * vec4(0.333333343, 0.333333343, -0.333333343, -0.333333343) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = u_xlat0.zwzw * vec4(0.5, 0.5, -0.5, -0.5) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD4 = u_xlat0.zwzw * vec4(0.666666687, 0.666666687, -0.666666687, -0.666666687) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD5 = u_xlat0.zwzw * vec4(0.833333373, 0.833333373, -0.833333373, -0.833333373) + in_TEXCOORD0.xyxy;
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
					in  vec4 vs_TEXCOORD4;
					in  vec4 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat1.x = u_xlat0.w * 0.800000012;
					    u_xlat1 = u_xlat0 * u_xlat1.xxxx;
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1 = u_xlat2 * u_xlat2.wwww + u_xlat1;
					    u_xlat0.x = u_xlat0.w * 0.800000012 + u_xlat2.w;
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat3 = u_xlat2.w * 0.800000012;
					    u_xlat1 = u_xlat2 * vec4(u_xlat3) + u_xlat1;
					    u_xlat0.x = u_xlat2.w * 0.800000012 + u_xlat0.x;
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat3 = u_xlat2.w * 0.649999976;
					    u_xlat1 = u_xlat2 * vec4(u_xlat3) + u_xlat1;
					    u_xlat0.x = u_xlat2.w * 0.649999976 + u_xlat0.x;
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat3 = u_xlat2.w * 0.649999976;
					    u_xlat1 = u_xlat2 * vec4(u_xlat3) + u_xlat1;
					    u_xlat0.x = u_xlat2.w * 0.649999976 + u_xlat0.x;
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat3 = u_xlat2.w * 0.5;
					    u_xlat1 = u_xlat2 * vec4(u_xlat3) + u_xlat1;
					    u_xlat0.x = u_xlat2.w * 0.5 + u_xlat0.x;
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat3 = u_xlat2.w * 0.5;
					    u_xlat1 = u_xlat2 * vec4(u_xlat3) + u_xlat1;
					    u_xlat0.x = u_xlat2.w * 0.5 + u_xlat0.x;
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat3 = u_xlat2.w * 0.400000006;
					    u_xlat1 = u_xlat2 * vec4(u_xlat3) + u_xlat1;
					    u_xlat0.x = u_xlat2.w * 0.400000006 + u_xlat0.x;
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD4.zw);
					    u_xlat3 = u_xlat2.w * 0.400000006;
					    u_xlat1 = u_xlat2 * vec4(u_xlat3) + u_xlat1;
					    u_xlat0.x = u_xlat2.w * 0.400000006 + u_xlat0.x;
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD5.xy);
					    u_xlat3 = u_xlat2.w * 0.200000003;
					    u_xlat1 = u_xlat2 * vec4(u_xlat3) + u_xlat1;
					    u_xlat0.x = u_xlat2.w * 0.200000003 + u_xlat0.x;
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD5.zw);
					    u_xlat3 = u_xlat2.w * 0.200000003;
					    u_xlat1 = u_xlat2 * vec4(u_xlat3) + u_xlat1;
					    u_xlat0.x = u_xlat2.w * 0.200000003 + u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + 9.99999975e-05;
					    SV_Target0 = u_xlat1 / u_xlat0.xxxx;
					    return;
					}"
				}
			}
		}
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 145293
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
						vec4 unused_0_0[3];
						vec4 _MainTex_TexelSize;
						vec4 _Offsets;
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
					out vec4 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = 1.0;
					    u_xlat0.zw = _MainTex_TexelSize.xy;
					    u_xlat0 = u_xlat0.xxzw * _Offsets.xyxy;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_TexelSize.xy;
					    vs_TEXCOORD1 = u_xlat0 * vec4(0.166666672, 0.166666672, -0.166666672, -0.166666672) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2 = u_xlat0.zwzw * vec4(0.333333343, 0.333333343, -0.333333343, -0.333333343) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = u_xlat0.zwzw * vec4(0.5, 0.5, -0.5, -0.5) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD4 = u_xlat0.zwzw * vec4(0.666666687, 0.666666687, -0.666666687, -0.666666687) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD5 = u_xlat0.zwzw * vec4(0.833333373, 0.833333373, -0.833333373, -0.833333373) + in_TEXCOORD0.xyxy;
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
					in  vec4 vs_TEXCOORD4;
					in  vec4 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat3;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3 = u_xlat1.w + (-u_xlat2.w);
					    u_xlat3 = u_xlat3 + 0.5;
					    u_xlat3 = u_xlat3 + u_xlat3;
					    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
					    u_xlat7 = u_xlat3 * -2.0 + 3.0;
					    u_xlat3 = u_xlat3 * u_xlat3;
					    u_xlat3 = u_xlat3 * u_xlat7;
					    u_xlat7 = u_xlat3 * 0.800000012;
					    u_xlat3 = u_xlat3 * 0.800000012 + u_xlat2.w;
					    u_xlat1 = u_xlat1 * vec4(u_xlat7);
					    u_xlat1 = u_xlat2 * u_xlat2.wwww + u_xlat1;
					    u_xlat2.x = u_xlat0.w + (-u_xlat2.w);
					    u_xlat2.x = u_xlat2.x + 0.5;
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat6 = u_xlat2.x * -2.0 + 3.0;
					    u_xlat2.x = u_xlat2.x * u_xlat2.x;
					    u_xlat2.x = u_xlat2.x * u_xlat6;
					    u_xlat6 = u_xlat2.x * 0.800000012;
					    u_xlat2.x = u_xlat2.x * 0.800000012 + u_xlat3;
					    u_xlat0 = u_xlat0 * vec4(u_xlat6) + u_xlat1;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat6 = (-u_xlat2.w) + u_xlat1.w;
					    u_xlat6 = u_xlat6 + 0.5;
					    u_xlat6 = u_xlat6 + u_xlat6;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    u_xlat10 = u_xlat6 * -2.0 + 3.0;
					    u_xlat6 = u_xlat6 * u_xlat6;
					    u_xlat6 = u_xlat6 * u_xlat10;
					    u_xlat10 = u_xlat6 * 0.675000012;
					    u_xlat2.x = u_xlat6 * 0.675000012 + u_xlat2.x;
					    u_xlat0 = u_xlat1 * vec4(u_xlat10) + u_xlat0;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat6 = (-u_xlat2.w) + u_xlat1.w;
					    u_xlat6 = u_xlat6 + 0.5;
					    u_xlat6 = u_xlat6 + u_xlat6;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    u_xlat10 = u_xlat6 * -2.0 + 3.0;
					    u_xlat6 = u_xlat6 * u_xlat6;
					    u_xlat6 = u_xlat6 * u_xlat10;
					    u_xlat10 = u_xlat6 * 0.675000012;
					    u_xlat2.x = u_xlat6 * 0.675000012 + u_xlat2.x;
					    u_xlat0 = u_xlat1 * vec4(u_xlat10) + u_xlat0;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat6 = (-u_xlat2.w) + u_xlat1.w;
					    u_xlat6 = u_xlat6 + 0.5;
					    u_xlat6 = u_xlat6 + u_xlat6;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    u_xlat10 = u_xlat6 * -2.0 + 3.0;
					    u_xlat6 = u_xlat6 * u_xlat6;
					    u_xlat6 = u_xlat6 * u_xlat10;
					    u_xlat10 = u_xlat6 * 0.5;
					    u_xlat2.x = u_xlat6 * 0.5 + u_xlat2.x;
					    u_xlat0 = u_xlat1 * vec4(u_xlat10) + u_xlat0;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat6 = (-u_xlat2.w) + u_xlat1.w;
					    u_xlat6 = u_xlat6 + 0.5;
					    u_xlat6 = u_xlat6 + u_xlat6;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    u_xlat10 = u_xlat6 * -2.0 + 3.0;
					    u_xlat6 = u_xlat6 * u_xlat6;
					    u_xlat6 = u_xlat6 * u_xlat10;
					    u_xlat10 = u_xlat6 * 0.5;
					    u_xlat2.x = u_xlat6 * 0.5 + u_xlat2.x;
					    u_xlat0 = u_xlat1 * vec4(u_xlat10) + u_xlat0;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat6 = (-u_xlat2.w) + u_xlat1.w;
					    u_xlat6 = u_xlat6 + 0.5;
					    u_xlat6 = u_xlat6 + u_xlat6;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    u_xlat10 = u_xlat6 * -2.0 + 3.0;
					    u_xlat6 = u_xlat6 * u_xlat6;
					    u_xlat6 = u_xlat6 * u_xlat10;
					    u_xlat10 = u_xlat6 * 0.200000003;
					    u_xlat2.x = u_xlat6 * 0.200000003 + u_xlat2.x;
					    u_xlat0 = u_xlat1 * vec4(u_xlat10) + u_xlat0;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD4.zw);
					    u_xlat6 = (-u_xlat2.w) + u_xlat1.w;
					    u_xlat6 = u_xlat6 + 0.5;
					    u_xlat6 = u_xlat6 + u_xlat6;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    u_xlat10 = u_xlat6 * -2.0 + 3.0;
					    u_xlat6 = u_xlat6 * u_xlat6;
					    u_xlat6 = u_xlat6 * u_xlat10;
					    u_xlat10 = u_xlat6 * 0.200000003;
					    u_xlat2.x = u_xlat6 * 0.200000003 + u_xlat2.x;
					    u_xlat0 = u_xlat1 * vec4(u_xlat10) + u_xlat0;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD5.xy);
					    u_xlat6 = (-u_xlat2.w) + u_xlat1.w;
					    u_xlat6 = u_xlat6 + 0.5;
					    u_xlat6 = u_xlat6 + u_xlat6;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    u_xlat10 = u_xlat6 * -2.0 + 3.0;
					    u_xlat6 = u_xlat6 * u_xlat6;
					    u_xlat6 = u_xlat6 * u_xlat10;
					    u_xlat10 = u_xlat6 * 0.075000003;
					    u_xlat2.x = u_xlat6 * 0.075000003 + u_xlat2.x;
					    u_xlat0 = u_xlat1 * vec4(u_xlat10) + u_xlat0;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD5.zw);
					    u_xlat6 = (-u_xlat2.w) + u_xlat1.w;
					    u_xlat6 = u_xlat6 + 0.5;
					    u_xlat6 = u_xlat6 + u_xlat6;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    u_xlat10 = u_xlat6 * -2.0 + 3.0;
					    u_xlat6 = u_xlat6 * u_xlat6;
					    u_xlat6 = u_xlat6 * u_xlat10;
					    u_xlat10 = u_xlat6 * 0.075000003;
					    u_xlat2.x = u_xlat6 * 0.075000003 + u_xlat2.x;
					    u_xlat2.x = u_xlat2.x + 9.99999975e-05;
					    u_xlat0 = u_xlat1 * vec4(u_xlat10) + u_xlat0;
					    SV_Target0 = u_xlat0 / u_xlat2.xxxx;
					    return;
					}"
				}
			}
		}
		Pass {
			Blend One One, One One
			BlendOp Max, Max
			ColorMask A -1
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 237590
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
						vec4 unused_0_0[3];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat1 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.y = (u_xlatb0) ? u_xlat1 : in_TEXCOORD0.y;
					    phase0_Output0_1.xzw = in_TEXCOORD0.xxy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    return;
					}"
				}
			}
		}
		Pass {
			ColorMask A -1
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 323966
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
						vec4 unused_0_0[3];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat1 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.y = (u_xlatb0) ? u_xlat1 : in_TEXCOORD0.y;
					    phase0_Output0_1.xzw = in_TEXCOORD0.xxy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
						vec4 _CurveParams;
						vec4 unused_0_2[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[7];
						vec4 _ZBufferParams;
						vec4 unused_1_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat1 = (-u_xlat0.x) + _CurveParams.w;
					    u_xlat0.x = u_xlat0.x + 9.99999975e-06;
					    u_xlat1 = u_xlat1 * _CurveParams.z;
					    u_xlat0.x = u_xlat1 / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-_CurveParams.y);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    SV_Target0.w = min(u_xlat0.x, _CurveParams.x);
					    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
					    return;
					}"
				}
			}
		}
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 361949
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
						vec4 unused_0_0[3];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat1 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.y = (u_xlatb0) ? u_xlat1 : in_TEXCOORD0.y;
					    phase0_Output0_1.xzw = in_TEXCOORD0.xxy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
						vec4 _MainTex_TexelSize;
						vec4 _Offsets;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec2 u_xlat4;
					bool u_xlatb4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec2 u_xlat7;
					float u_xlat8;
					int u_xlati16;
					vec2 u_xlat20;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat1 = u_xlat0.wwww * u_xlat0;
					    u_xlat0.x = u_xlat0.w * 0.0909090936;
					    u_xlat2 = _MainTex_TexelSize.xyxy * _Offsets.xyxy;
					    u_xlat2 = u_xlat0.xxxx * u_xlat2;
					    u_xlat2 = u_xlat2 * vec4(1.0, 1.0, -1.0, -1.0);
					    u_xlat3 = u_xlat1;
					    u_xlat8 = u_xlat0.w;
					    for(int u_xlati_loop_1 = 1 ; u_xlati_loop_1<12 ; u_xlati_loop_1++)
					    {
					        u_xlat4.x = float(u_xlati_loop_1);
					        u_xlat5 = u_xlat2 * u_xlat4.xxxx + vs_TEXCOORD1.xyxy;
					        u_xlat6 = texture(_MainTex, u_xlat5.xy);
					        u_xlat5 = texture(_MainTex, u_xlat5.zw);
					        u_xlat7.x = u_xlat6.w;
					        u_xlat7.y = u_xlat5.w;
					        u_xlat4.xy = (-u_xlat0.xx) * u_xlat4.xx + u_xlat7.xy;
					        u_xlat4.xy = u_xlat4.xy + vec2(0.400000006, 0.400000006);
					        u_xlat4.xy = u_xlat4.xy * vec2(2.5, 2.5);
					        u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
					        u_xlat20.xy = u_xlat4.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
					        u_xlat4.xy = u_xlat4.xy * u_xlat4.xy;
					        u_xlat4.xy = u_xlat4.xy * u_xlat20.xy;
					        u_xlat5 = u_xlat4.yyyy * u_xlat5;
					        u_xlat5 = u_xlat6 * u_xlat4.xxxx + u_xlat5;
					        u_xlat3 = u_xlat3 + u_xlat5;
					        u_xlat4.x = dot(u_xlat4.xy, vec2(1.0, 1.0));
					        u_xlat8 = u_xlat8 + u_xlat4.x;
					    }
					    u_xlat0.x = u_xlat8 + 9.99999975e-06;
					    SV_Target0 = u_xlat3 / u_xlat0.xxxx;
					    return;
					}"
				}
			}
		}
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 405244
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
						vec4 unused_0_0[3];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat1 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.y = (u_xlatb0) ? u_xlat1 : in_TEXCOORD0.y;
					    phase0_Output0_1.xzw = in_TEXCOORD0.xxy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat15;
					bool u_xlatb15;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(0.75, 0.75, 0.75, -0.75) + vs_TEXCOORD0.xyxy;
					    u_xlat1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat2.x = u_xlat1.w;
					    u_xlat3 = (-_MainTex_TexelSize.xyxy) * vec4(0.75, 0.75, 0.75, -0.75) + vs_TEXCOORD0.xyxy;
					    u_xlat4 = texture(_MainTex, u_xlat3.xy);
					    u_xlat3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat2.y = u_xlat4.w;
					    u_xlat2.z = u_xlat0.w;
					    u_xlat2.w = u_xlat3.w;
					    u_xlat2 = u_xlat2 * vec4(10.0, 10.0, 10.0, 10.0);
					    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
					    u_xlat4.xyz = u_xlat2.yyy * u_xlat4.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xxx + u_xlat4.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.zzz + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat3.xyz * u_xlat2.www + u_xlat0.xyz;
					    u_xlat15 = dot(u_xlat2, vec4(1.0, 1.0, 1.0, 1.0));
					    u_xlat0.xyz = u_xlat0.xyz / vec3(u_xlat15);
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat15 = u_xlat15 * u_xlat1.w;
					    u_xlatb15 = 1.24999997e-06<u_xlat15;
					    SV_Target0.xyz = (bool(u_xlatb15)) ? u_xlat0.xyz : u_xlat1.xyz;
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
			}
		}
		Pass {
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			ColorMask RGB -1
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 506222
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
						vec4 unused_0_0[3];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat1 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.y = (u_xlatb0) ? u_xlat1 : in_TEXCOORD0.y;
					    phase0_Output0_1.xzw = in_TEXCOORD0.xxy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3 = u_xlat0.w * 5.0;
					    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target0.w = (-u_xlat3) + 1.0;
					    return;
					}"
				}
			}
		}
		Pass {
			ColorMask A -1
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 528249
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
						vec4 unused_0_0[3];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat1 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.y = (u_xlatb0) ? u_xlat1 : in_TEXCOORD0.y;
					    phase0_Output0_1.xzw = in_TEXCOORD0.xxy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
						vec4 _CurveParams;
						vec4 unused_0_2[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[7];
						vec4 _ZBufferParams;
						vec4 unused_1_2;
					};
					uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat1 = (-u_xlat0.x) + _CurveParams.w;
					    u_xlat0.x = u_xlat0.x + 9.99999975e-06;
					    u_xlat1 = u_xlat1 * _CurveParams.z;
					    u_xlat0.x = u_xlat1 / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-_CurveParams.y);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = min(u_xlat0.x, _CurveParams.x);
					    u_xlatb0 = 0.0<u_xlat0.x;
					    SV_Target0 = bool(u_xlatb0) ? vec4(1.0, 1.0, 1.0, 1.0) : vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
			}
		}
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 604881
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
						vec4 unused_0_0[3];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat1 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.y = (u_xlatb0) ? u_xlat1 : in_TEXCOORD0.y;
					    phase0_Output0_1.xzw = in_TEXCOORD0.xxy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					uniform  sampler2D _LowRez;
					uniform  sampler2D _FgOverlap;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					void main()
					{
					    u_xlat0 = texture(_FgOverlap, vs_TEXCOORD1.xy);
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat0.x = max(u_xlat0.w, u_xlat1.w);
					    u_xlat0.x = u_xlat0.x * 8.0;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat2 = texture(_LowRez, vs_TEXCOORD1.xy);
					    u_xlat3.xyz = (-u_xlat1.xyz) + u_xlat2.xyz;
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat1.xyz;
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
			}
		}
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 705498
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
						vec4 unused_0_0[3];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat1 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.y = (u_xlatb0) ? u_xlat1 : in_TEXCOORD0.y;
					    phase0_Output0_1.xzw = in_TEXCOORD0.xxy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
						vec4 _CurveParams;
						vec4 unused_0_2[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[7];
						vec4 _ZBufferParams;
						vec4 unused_1_2;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					int u_xlati0;
					float u_xlat1;
					float u_xlat2;
					int u_xlati2;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat1 = u_xlat0.x + 9.99999975e-06;
					    u_xlat0.x = u_xlat0.x + (-_CurveParams.w);
					    u_xlat2 = abs(u_xlat0.x) * _CurveParams.z;
					    u_xlat1 = u_xlat2 / u_xlat1;
					    u_xlat1 = u_xlat1 + (-_CurveParams.y);
					    u_xlat1 = max(u_xlat1, 0.0);
					    u_xlat1 = min(u_xlat1, _CurveParams.x);
					    u_xlati2 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0));
					    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0));
					    u_xlati0 = (-u_xlati2) + u_xlati0;
					    u_xlat0.x = float(u_xlati0);
					    SV_Target0.w = u_xlat0.x * u_xlat1;
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    SV_Target0.xyz = u_xlat0.xyz;
					    return;
					}"
				}
			}
		}
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 753806
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
						vec4 unused_0_0[3];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat1 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.y = (u_xlatb0) ? u_xlat1 : in_TEXCOORD0.y;
					    phase0_Output0_1.xzw = in_TEXCOORD0.xxy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					vec2 ImmCB_0_0_0[28];
					float ImmCB_0_0_2[28];
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[3];
						vec4 _MainTex_TexelSize;
						vec4 _Offsets;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec2 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					bool u_xlatb3;
					float u_xlat4;
					bool u_xlatb4;
					float u_xlat9;
					float u_xlat11;
					float u_xlat16;
					int u_xlati17;
					float u_xlat18;
					void main()
					{
						ImmCB_0_0_0[0] = vec2(0.624629974, 0.543370008);
						ImmCB_0_0_0[1] = vec2(-0.13414, -0.944880009);
						ImmCB_0_0_0[2] = vec2(0.387719989, -0.434749991);
						ImmCB_0_0_0[3] = vec2(0.121260002, -0.192819998);
						ImmCB_0_0_0[4] = vec2(-0.203879997, 0.111330003);
						ImmCB_0_0_0[5] = vec2(0.831139982, -0.292180002);
						ImmCB_0_0_0[6] = vec2(0.107589997, -0.578390002);
						ImmCB_0_0_0[7] = vec2(0.282849997, 0.790359974);
						ImmCB_0_0_0[8] = vec2(-0.366219997, 0.39515999);
						ImmCB_0_0_0[9] = vec2(0.755909979, 0.219160005);
						ImmCB_0_0_0[10] = vec2(-0.52609998, 0.0238600001);
						ImmCB_0_0_0[11] = vec2(-0.882160008, -0.244709998);
						ImmCB_0_0_0[12] = vec2(-0.488880008, -0.293300003);
						ImmCB_0_0_0[13] = vec2(0.440140009, -0.0855799988);
						ImmCB_0_0_0[14] = vec2(0.211789995, 0.51372999);
						ImmCB_0_0_0[15] = vec2(0.0548299998, 0.957009971);
						ImmCB_0_0_0[16] = vec2(-0.590009987, -0.705089986);
						ImmCB_0_0_0[17] = vec2(-0.800650001, 0.246309996);
						ImmCB_0_0_0[18] = vec2(-0.194240004, -0.184019998);
						ImmCB_0_0_0[19] = vec2(-0.436670005, 0.767509997);
						ImmCB_0_0_0[20] = vec2(0.216659993, 0.116020001);
						ImmCB_0_0_0[21] = vec2(0.156959996, -0.856000006);
						ImmCB_0_0_0[22] = vec2(-0.758210003, 0.583630025);
						ImmCB_0_0_0[23] = vec2(0.992839992, -0.0290399995);
						ImmCB_0_0_0[24] = vec2(-0.222340003, -0.579069972);
						ImmCB_0_0_0[25] = vec2(0.550520003, -0.669839978);
						ImmCB_0_0_0[26] = vec2(0.46430999, 0.281150013);
						ImmCB_0_0_0[27] = vec2(-0.0721400008, 0.605539978);
						ImmCB_0_0_2[0] = 0.827899992;
						ImmCB_0_0_2[1] = 0.954349995;
						ImmCB_0_0_2[2] = 0.582530022;
						ImmCB_0_0_2[3] = 0.227779999;
						ImmCB_0_0_2[4] = 0.232299998;
						ImmCB_0_0_2[5] = 0.880999982;
						ImmCB_0_0_2[6] = 0.588310003;
						ImmCB_0_0_2[7] = 0.839450002;
						ImmCB_0_0_2[8] = 0.538760006;
						ImmCB_0_0_2[9] = 0.787039995;
						ImmCB_0_0_2[10] = 0.526639998;
						ImmCB_0_0_2[11] = 0.915470004;
						ImmCB_0_0_2[12] = 0.570110023;
						ImmCB_0_0_2[13] = 0.448379993;
						ImmCB_0_0_2[14] = 0.555670023;
						ImmCB_0_0_2[15] = 0.958580017;
						ImmCB_0_0_2[16] = 0.919380009;
						ImmCB_0_0_2[17] = 0.837679982;
						ImmCB_0_0_2[18] = 0.267569989;
						ImmCB_0_0_2[19] = 0.883040011;
						ImmCB_0_0_2[20] = 0.245770007;
						ImmCB_0_0_2[21] = 0.870270014;
						ImmCB_0_0_2[22] = 0.956820011;
						ImmCB_0_0_2[23] = 0.99326998;
						ImmCB_0_0_2[24] = 0.620289981;
						ImmCB_0_0_2[25] = 0.867039979;
						ImmCB_0_0_2[26] = 0.542800009;
						ImmCB_0_0_2[27] = 0.609820008;
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat1.xy = u_xlat0.ww * _MainTex_TexelSize.xy;
					    u_xlat1.xy = u_xlat1.xy * _Offsets.ww;
					    u_xlat11 = u_xlat0.w * 0.25;
					    u_xlat11 = max(u_xlat11, _Offsets.z);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat11);
					    u_xlat2.xyz = u_xlat0.xyz;
					    u_xlat16 = u_xlat11;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<28 ; u_xlati_loop_1++)
					    {
					        u_xlat3.xy = ImmCB_0_0_0[u_xlati_loop_1].xy * u_xlat1.xy + vs_TEXCOORD1.xy;
					        u_xlat3 = texture(_MainTex, u_xlat3.xy);
					        u_xlatb4 = 0.0<u_xlat3.w;
					        if(u_xlatb4){
					            u_xlat18 = (-u_xlat0.w) * ImmCB_0_0_2[u_xlati_loop_1] + u_xlat3.w;
					            u_xlat18 = u_xlat18 + 0.264999986;
					            u_xlat18 = u_xlat18 * 3.77358508;
					            u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
					            u_xlat4 = u_xlat18 * -2.0 + 3.0;
					            u_xlat18 = u_xlat18 * u_xlat18;
					            u_xlat9 = u_xlat18 * u_xlat4;
					            u_xlat2.xyz = u_xlat3.xyz * vec3(u_xlat9) + u_xlat2.xyz;
					            u_xlat16 = u_xlat4 * u_xlat18 + u_xlat16;
					        }
					    }
					    SV_Target0.xyz = u_xlat2.xyz / vec3(u_xlat16);
					    SV_Target0.w = u_xlat0.w;
					    return;
					}"
				}
			}
		}
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 832274
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
						vec4 unused_0_0[3];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat1 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.y = (u_xlatb0) ? u_xlat1 : in_TEXCOORD0.y;
					    phase0_Output0_1.xzw = in_TEXCOORD0.xxy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					vec2 ImmCB_0_0_0[12];
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[3];
						vec4 _MainTex_TexelSize;
						vec4 _Offsets;
					};
					uniform  sampler2D _LowRez;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					bool u_xlatb2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec2 u_xlat6;
					float u_xlat16;
					float u_xlat21;
					float u_xlat23;
					int u_xlati23;
					float u_xlat24;
					bool u_xlatb24;
					float u_xlat25;
					float u_xlat26;
					void main()
					{
						ImmCB_0_0_0[0] = vec2(-0.326211989, -0.405809999);
						ImmCB_0_0_0[1] = vec2(-0.840143979, -0.0735799968);
						ImmCB_0_0_0[2] = vec2(-0.69591397, 0.457136989);
						ImmCB_0_0_0[3] = vec2(-0.203345001, 0.620715976);
						ImmCB_0_0_0[4] = vec2(0.962339997, -0.194983006);
						ImmCB_0_0_0[5] = vec2(0.473434001, -0.480026007);
						ImmCB_0_0_0[6] = vec2(0.519456029, 0.767022014);
						ImmCB_0_0_0[7] = vec2(0.185461, -0.893123984);
						ImmCB_0_0_0[8] = vec2(0.507430971, 0.0644249991);
						ImmCB_0_0_0[9] = vec2(0.896420002, 0.412458003);
						ImmCB_0_0_0[10] = vec2(-0.321940005, -0.932614982);
						ImmCB_0_0_0[11] = vec2(-0.791558981, -0.597710013);
					    u_xlat0 = texture(_LowRez, vs_TEXCOORD1.xy);
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat2.xy = u_xlat1.ww * _MainTex_TexelSize.xy;
					    u_xlat2.xy = u_xlat2.xy * _Offsets.ww;
					    u_xlat21 = u_xlat1.w * 0.25;
					    u_xlat21 = max(u_xlat21, 0.100000001);
					    u_xlat3.xyz = vec3(u_xlat21) * u_xlat1.xyz;
					    u_xlat4.xyz = u_xlat3.xyz;
					    u_xlat16 = u_xlat21;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<12 ; u_xlati_loop_1++)
					    {
					        u_xlat5.xy = u_xlat2.xy * ImmCB_0_0_0[u_xlati_loop_1].xy;
					        u_xlat5.xy = u_xlat5.xy * vec2(1.10000002, 1.10000002) + vs_TEXCOORD1.xy;
					        u_xlat5 = texture(_MainTex, u_xlat5.xy);
					        u_xlat6.xy = vec2(1.10000002, 1.10000002) * ImmCB_0_0_0[u_xlati_loop_1].xy;
					        u_xlat24 = dot(u_xlat6.xy, u_xlat6.xy);
					        u_xlat24 = sqrt(u_xlat24);
					        u_xlat24 = (-u_xlat1.w) * u_xlat24 + u_xlat5.w;
					        u_xlat24 = u_xlat24 + 0.264999986;
					        u_xlat24 = u_xlat24 * 3.77358508;
					        u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
					        u_xlat25 = u_xlat24 * -2.0 + 3.0;
					        u_xlat24 = u_xlat24 * u_xlat24;
					        u_xlat26 = u_xlat24 * u_xlat25;
					        u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat26) + u_xlat4.xyz;
					        u_xlat16 = u_xlat25 * u_xlat24 + u_xlat16;
					    }
					    u_xlat21 = u_xlat16 + 9.99999975e-06;
					    u_xlat2.xyz = u_xlat4.xyz / vec3(u_xlat21);
					    u_xlat21 = u_xlat1.w + -0.400000006;
					    u_xlat21 = u_xlat21 * 4.99999952;
					    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
					    u_xlat23 = u_xlat21 * -2.0 + 3.0;
					    u_xlat21 = u_xlat21 * u_xlat21;
					    u_xlat21 = u_xlat21 * u_xlat23;
					    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat2.xyz);
					    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz + u_xlat2.xyz;
					    u_xlatb2 = u_xlat1.w<0.00999999978;
					    u_xlat0.w = u_xlat1.w;
					    SV_Target0 = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
					    return;
					}"
				}
			}
		}
		Pass {
			ColorMask A -1
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 893668
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
						vec4 unused_0_0[3];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat1 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.y = (u_xlatb0) ? u_xlat1 : in_TEXCOORD0.y;
					    phase0_Output0_1.xzw = in_TEXCOORD0.xxy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
						vec4 _CurveParams;
						vec4 unused_0_2[2];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[7];
						vec4 _ZBufferParams;
						vec4 unused_1_2;
					};
					uniform  sampler2D _FgOverlap;
					uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy);
					    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlat0.x = float(1.0) / u_xlat0.x;
					    u_xlat2 = u_xlat0.x + (-_CurveParams.w);
					    u_xlat0.x = u_xlat0.x + 9.99999975e-06;
					    u_xlat2 = abs(u_xlat2) * _CurveParams.z;
					    u_xlat0.x = u_xlat2 / u_xlat0.x;
					    u_xlat0.x = u_xlat0.x + (-_CurveParams.y);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat0.x = min(u_xlat0.x, _CurveParams.x);
					    u_xlat1 = texture(_FgOverlap, vs_TEXCOORD1.xy);
					    SV_Target0 = max(u_xlat0.xxxx, u_xlat1.wwww);
					    return;
					}"
				}
			}
		}
		Pass {
			Blend One One, One One
			BlendOp Max, Max
			ColorMask A -1
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 979686
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
						vec4 unused_0_0[3];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat1 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.y = (u_xlatb0) ? u_xlat1 : in_TEXCOORD0.y;
					    phase0_Output0_1.xzw = in_TEXCOORD0.xxy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					uniform  sampler2D _FgOverlap;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					float u_xlat2;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlatb0 = u_xlat0.w<0.00999999978;
					    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
					    u_xlat1 = texture(_FgOverlap, vs_TEXCOORD1.xy);
					    u_xlat2 = (-u_xlat0.w) + u_xlat1.w;
					    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
					    SV_Target0 = vec4(u_xlat2) * u_xlat0.xxxx;
					    return;
					}"
				}
			}
		}
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 1011929
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
						vec4 unused_0_0[3];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat1 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.y = (u_xlatb0) ? u_xlat1 : in_TEXCOORD0.y;
					    phase0_Output0_1.xzw = in_TEXCOORD0.xxy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(0.75, 0.75, 0.75, -0.75) + vs_TEXCOORD1.xyxy;
					    u_xlat1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat2 = (-_MainTex_TexelSize.xyxy) * vec4(0.75, 0.75, 0.75, -0.75) + vs_TEXCOORD1.xyxy;
					    u_xlat3 = texture(_MainTex, u_xlat2.xy);
					    u_xlat2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat1 = u_xlat1 + u_xlat3;
					    u_xlat0 = u_xlat0 + u_xlat1;
					    u_xlat0 = u_xlat2 + u_xlat0;
					    SV_Target0 = u_xlat0 * vec4(0.25, 0.25, 0.25, 0.25);
					    return;
					}"
				}
			}
		}
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 1059013
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
						vec4 unused_0_0[3];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat1 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.y = (u_xlatb0) ? u_xlat1 : in_TEXCOORD0.y;
					    phase0_Output0_1.xzw = in_TEXCOORD0.xxy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
						vec4 _CurveParams;
						vec4 unused_0_2[2];
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat0.x = u_xlat0.w / _CurveParams.x;
					    SV_Target0.w = u_xlat0.w;
					    SV_Target0.xyz = u_xlat0.xxx;
					    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
					    return;
					}"
				}
			}
		}
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 1122572
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
						vec4 unused_0_0[3];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat1 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.y = (u_xlatb0) ? u_xlat1 : in_TEXCOORD0.y;
					    phase0_Output0_1.xzw = in_TEXCOORD0.xxy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					vec2 ImmCB_0_0_0[28];
					float ImmCB_0_0_2[28];
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[3];
						vec4 _MainTex_TexelSize;
						vec4 _Offsets;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec2 u_xlat7;
					vec3 u_xlat10;
					vec2 u_xlat11;
					bool u_xlatb11;
					float u_xlat16;
					int u_xlati24;
					void main()
					{
						ImmCB_0_0_0[0] = vec2(0.624629974, 0.543370008);
						ImmCB_0_0_0[1] = vec2(-0.13414, -0.944880009);
						ImmCB_0_0_0[2] = vec2(0.387719989, -0.434749991);
						ImmCB_0_0_0[3] = vec2(0.121260002, -0.192819998);
						ImmCB_0_0_0[4] = vec2(-0.203879997, 0.111330003);
						ImmCB_0_0_0[5] = vec2(0.831139982, -0.292180002);
						ImmCB_0_0_0[6] = vec2(0.107589997, -0.578390002);
						ImmCB_0_0_0[7] = vec2(0.282849997, 0.790359974);
						ImmCB_0_0_0[8] = vec2(-0.366219997, 0.39515999);
						ImmCB_0_0_0[9] = vec2(0.755909979, 0.219160005);
						ImmCB_0_0_0[10] = vec2(-0.52609998, 0.0238600001);
						ImmCB_0_0_0[11] = vec2(-0.882160008, -0.244709998);
						ImmCB_0_0_0[12] = vec2(-0.488880008, -0.293300003);
						ImmCB_0_0_0[13] = vec2(0.440140009, -0.0855799988);
						ImmCB_0_0_0[14] = vec2(0.211789995, 0.51372999);
						ImmCB_0_0_0[15] = vec2(0.0548299998, 0.957009971);
						ImmCB_0_0_0[16] = vec2(-0.590009987, -0.705089986);
						ImmCB_0_0_0[17] = vec2(-0.800650001, 0.246309996);
						ImmCB_0_0_0[18] = vec2(-0.194240004, -0.184019998);
						ImmCB_0_0_0[19] = vec2(-0.436670005, 0.767509997);
						ImmCB_0_0_0[20] = vec2(0.216659993, 0.116020001);
						ImmCB_0_0_0[21] = vec2(0.156959996, -0.856000006);
						ImmCB_0_0_0[22] = vec2(-0.758210003, 0.583630025);
						ImmCB_0_0_0[23] = vec2(0.992839992, -0.0290399995);
						ImmCB_0_0_0[24] = vec2(-0.222340003, -0.579069972);
						ImmCB_0_0_0[25] = vec2(0.550520003, -0.669839978);
						ImmCB_0_0_0[26] = vec2(0.46430999, 0.281150013);
						ImmCB_0_0_0[27] = vec2(-0.0721400008, 0.605539978);
						ImmCB_0_0_2[0] = 0.827899992;
						ImmCB_0_0_2[1] = 0.954349995;
						ImmCB_0_0_2[2] = 0.582530022;
						ImmCB_0_0_2[3] = 0.227779999;
						ImmCB_0_0_2[4] = 0.232299998;
						ImmCB_0_0_2[5] = 0.880999982;
						ImmCB_0_0_2[6] = 0.588310003;
						ImmCB_0_0_2[7] = 0.839450002;
						ImmCB_0_0_2[8] = 0.538760006;
						ImmCB_0_0_2[9] = 0.787039995;
						ImmCB_0_0_2[10] = 0.526639998;
						ImmCB_0_0_2[11] = 0.915470004;
						ImmCB_0_0_2[12] = 0.570110023;
						ImmCB_0_0_2[13] = 0.448379993;
						ImmCB_0_0_2[14] = 0.555670023;
						ImmCB_0_0_2[15] = 0.958580017;
						ImmCB_0_0_2[16] = 0.919380009;
						ImmCB_0_0_2[17] = 0.837679982;
						ImmCB_0_0_2[18] = 0.267569989;
						ImmCB_0_0_2[19] = 0.883040011;
						ImmCB_0_0_2[20] = 0.245770007;
						ImmCB_0_0_2[21] = 0.870270014;
						ImmCB_0_0_2[22] = 0.956820011;
						ImmCB_0_0_2[23] = 0.99326998;
						ImmCB_0_0_2[24] = 0.620289981;
						ImmCB_0_0_2[25] = 0.867039979;
						ImmCB_0_0_2[26] = 0.542800009;
						ImmCB_0_0_2[27] = 0.609820008;
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD1.xy).xwyz;
					    u_xlat1 = u_xlat0.yyyy * _MainTex_TexelSize.xyxy;
					    u_xlat1 = u_xlat1 * _Offsets.wwww;
					    u_xlat2 = u_xlat0.y * 0.25;
					    u_xlat2 = max(u_xlat2, _Offsets.z);
					    u_xlat10.xyz = u_xlat0.xzw * vec3(u_xlat2);
					    u_xlat3.x = 1.20000005;
					    u_xlat4.xyz = u_xlat10.xyz;
					    u_xlat16 = u_xlat2;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<28 ; u_xlati_loop_1++)
					    {
					        u_xlat5 = u_xlat1 * ImmCB_0_0_0[u_xlati_loop_1].xyxy;
					        u_xlat3.z = ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat5 = u_xlat5 / u_xlat3.xxzz;
					        u_xlat5 = u_xlat5 + vs_TEXCOORD1.xyxy;
					        u_xlat6 = texture(_MainTex, u_xlat5.xy);
					        u_xlat5 = texture(_MainTex, u_xlat5.zw);
					        u_xlat11.x = u_xlat5.w + u_xlat6.w;
					        u_xlatb11 = 0.0<u_xlat11.x;
					        if(u_xlatb11){
					            u_xlat0.x = u_xlat0.y * ImmCB_0_0_2[u_xlati_loop_1];
					            u_xlat7.x = u_xlat6.w;
					            u_xlat7.y = u_xlat5.w;
					            u_xlat11.xy = (-u_xlat0.xy) * vec2(0.833333313, 1.0) + u_xlat7.xy;
					            u_xlat11.xy = u_xlat11.xy + vec2(0.264999986, 0.264999986);
					            u_xlat11.xy = u_xlat11.xy * vec2(3.77358508, 3.77358508);
					            u_xlat11.xy = clamp(u_xlat11.xy, 0.0, 1.0);
					            u_xlat7.xy = u_xlat11.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
					            u_xlat11.xy = u_xlat11.xy * u_xlat11.xy;
					            u_xlat11.xy = u_xlat11.xy * u_xlat7.xy;
					            u_xlat5.xyz = u_xlat11.yyy * u_xlat5.xyz;
					            u_xlat5.xyz = u_xlat6.xyz * u_xlat11.xxx + u_xlat5.xyz;
					            u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					            u_xlat0.x = dot(u_xlat11.xy, vec2(1.0, 1.0));
					            u_xlat16 = u_xlat0.x + u_xlat16;
					        }
					    }
					    SV_Target0.xyz = u_xlat4.xyz / vec3(u_xlat16);
					    SV_Target0.w = u_xlat0.y;
					    return;
					}"
				}
			}
		}
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 1205854
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
						vec4 unused_0_0[3];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat1 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.y = (u_xlatb0) ? u_xlat1 : in_TEXCOORD0.y;
					    phase0_Output0_1.xzw = in_TEXCOORD0.xxy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					vec2 ImmCB_0_0_0[28];
					float ImmCB_0_0_2[28];
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[3];
						vec4 _MainTex_TexelSize;
						vec4 _Offsets;
					};
					uniform  sampler2D _LowRez;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					bool u_xlatb2;
					vec3 u_xlat3;
					vec3 u_xlat4;
					vec4 u_xlat5;
					float u_xlat14;
					float u_xlat18;
					float u_xlat20;
					int u_xlati20;
					float u_xlat21;
					bool u_xlatb21;
					float u_xlat22;
					float u_xlat23;
					void main()
					{
						ImmCB_0_0_0[0] = vec2(0.624629974, 0.543370008);
						ImmCB_0_0_0[1] = vec2(-0.13414, -0.944880009);
						ImmCB_0_0_0[2] = vec2(0.387719989, -0.434749991);
						ImmCB_0_0_0[3] = vec2(0.121260002, -0.192819998);
						ImmCB_0_0_0[4] = vec2(-0.203879997, 0.111330003);
						ImmCB_0_0_0[5] = vec2(0.831139982, -0.292180002);
						ImmCB_0_0_0[6] = vec2(0.107589997, -0.578390002);
						ImmCB_0_0_0[7] = vec2(0.282849997, 0.790359974);
						ImmCB_0_0_0[8] = vec2(-0.366219997, 0.39515999);
						ImmCB_0_0_0[9] = vec2(0.755909979, 0.219160005);
						ImmCB_0_0_0[10] = vec2(-0.52609998, 0.0238600001);
						ImmCB_0_0_0[11] = vec2(-0.882160008, -0.244709998);
						ImmCB_0_0_0[12] = vec2(-0.488880008, -0.293300003);
						ImmCB_0_0_0[13] = vec2(0.440140009, -0.0855799988);
						ImmCB_0_0_0[14] = vec2(0.211789995, 0.51372999);
						ImmCB_0_0_0[15] = vec2(0.0548299998, 0.957009971);
						ImmCB_0_0_0[16] = vec2(-0.590009987, -0.705089986);
						ImmCB_0_0_0[17] = vec2(-0.800650001, 0.246309996);
						ImmCB_0_0_0[18] = vec2(-0.194240004, -0.184019998);
						ImmCB_0_0_0[19] = vec2(-0.436670005, 0.767509997);
						ImmCB_0_0_0[20] = vec2(0.216659993, 0.116020001);
						ImmCB_0_0_0[21] = vec2(0.156959996, -0.856000006);
						ImmCB_0_0_0[22] = vec2(-0.758210003, 0.583630025);
						ImmCB_0_0_0[23] = vec2(0.992839992, -0.0290399995);
						ImmCB_0_0_0[24] = vec2(-0.222340003, -0.579069972);
						ImmCB_0_0_0[25] = vec2(0.550520003, -0.669839978);
						ImmCB_0_0_0[26] = vec2(0.46430999, 0.281150013);
						ImmCB_0_0_0[27] = vec2(-0.0721400008, 0.605539978);
						ImmCB_0_0_2[0] = 0.827899992;
						ImmCB_0_0_2[1] = 0.954349995;
						ImmCB_0_0_2[2] = 0.582530022;
						ImmCB_0_0_2[3] = 0.227779999;
						ImmCB_0_0_2[4] = 0.232299998;
						ImmCB_0_0_2[5] = 0.880999982;
						ImmCB_0_0_2[6] = 0.588310003;
						ImmCB_0_0_2[7] = 0.839450002;
						ImmCB_0_0_2[8] = 0.538760006;
						ImmCB_0_0_2[9] = 0.787039995;
						ImmCB_0_0_2[10] = 0.526639998;
						ImmCB_0_0_2[11] = 0.915470004;
						ImmCB_0_0_2[12] = 0.570110023;
						ImmCB_0_0_2[13] = 0.448379993;
						ImmCB_0_0_2[14] = 0.555670023;
						ImmCB_0_0_2[15] = 0.958580017;
						ImmCB_0_0_2[16] = 0.919380009;
						ImmCB_0_0_2[17] = 0.837679982;
						ImmCB_0_0_2[18] = 0.267569989;
						ImmCB_0_0_2[19] = 0.883040011;
						ImmCB_0_0_2[20] = 0.245770007;
						ImmCB_0_0_2[21] = 0.870270014;
						ImmCB_0_0_2[22] = 0.956820011;
						ImmCB_0_0_2[23] = 0.99326998;
						ImmCB_0_0_2[24] = 0.620289981;
						ImmCB_0_0_2[25] = 0.867039979;
						ImmCB_0_0_2[26] = 0.542800009;
						ImmCB_0_0_2[27] = 0.609820008;
					    u_xlat0 = texture(_LowRez, vs_TEXCOORD1.xy);
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat2.xy = u_xlat1.ww * _MainTex_TexelSize.xy;
					    u_xlat2.xy = u_xlat2.xy * _Offsets.ww;
					    u_xlat18 = u_xlat1.w * 0.25;
					    u_xlat18 = max(u_xlat18, 0.100000001);
					    u_xlat3.xyz = vec3(u_xlat18) * u_xlat1.xyz;
					    u_xlat4.xyz = u_xlat3.xyz;
					    u_xlat14 = u_xlat18;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<28 ; u_xlati_loop_1++)
					    {
					        u_xlat5.xy = ImmCB_0_0_0[u_xlati_loop_1].xy * u_xlat2.xy + vs_TEXCOORD1.xy;
					        u_xlat5 = texture(_MainTex, u_xlat5.xy);
					        u_xlat21 = (-u_xlat1.w) * ImmCB_0_0_2[u_xlati_loop_1] + u_xlat5.w;
					        u_xlat21 = u_xlat21 + 0.264999986;
					        u_xlat21 = u_xlat21 * 3.77358508;
					        u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
					        u_xlat22 = u_xlat21 * -2.0 + 3.0;
					        u_xlat21 = u_xlat21 * u_xlat21;
					        u_xlat23 = u_xlat21 * u_xlat22;
					        u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat23) + u_xlat4.xyz;
					        u_xlat14 = u_xlat22 * u_xlat21 + u_xlat14;
					    }
					    u_xlat18 = u_xlat14 + 9.99999975e-06;
					    u_xlat2.xyz = u_xlat4.xyz / vec3(u_xlat18);
					    u_xlat18 = u_xlat1.w + -0.649999976;
					    u_xlat18 = u_xlat18 * 4.99999905;
					    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
					    u_xlat20 = u_xlat18 * -2.0 + 3.0;
					    u_xlat18 = u_xlat18 * u_xlat18;
					    u_xlat18 = u_xlat18 * u_xlat20;
					    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat2.xyz);
					    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz + u_xlat2.xyz;
					    u_xlatb2 = u_xlat1.w<0.00999999978;
					    u_xlat0.w = u_xlat1.w;
					    SV_Target0 = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
					    return;
					}"
				}
			}
		}
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 1263049
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
						vec4 unused_0_0[3];
						vec4 _MainTex_TexelSize;
						vec4 _Offsets;
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
					out vec4 vs_TEXCOORD4;
					out vec4 vs_TEXCOORD5;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    u_xlat0.x = 1.0;
					    u_xlat0.zw = _MainTex_TexelSize.xy;
					    u_xlat0 = u_xlat0.xxzw * _Offsets.xyxy;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_TexelSize.xy;
					    vs_TEXCOORD1 = u_xlat0 * vec4(0.166666672, 0.166666672, -0.166666672, -0.166666672) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD2 = u_xlat0.zwzw * vec4(0.333333343, 0.333333343, -0.333333343, -0.333333343) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD3 = u_xlat0.zwzw * vec4(0.5, 0.5, -0.5, -0.5) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD4 = u_xlat0.zwzw * vec4(0.666666687, 0.666666687, -0.666666687, -0.666666687) + in_TEXCOORD0.xyxy;
					    vs_TEXCOORD5 = u_xlat0.zwzw * vec4(0.833333373, 0.833333373, -0.833333373, -0.833333373) + in_TEXCOORD0.xyxy;
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
					in  vec4 vs_TEXCOORD4;
					in  vec4 vs_TEXCOORD5;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat5;
					float u_xlat7;
					float u_xlat8;
					float u_xlat13;
					float u_xlat14;
					float u_xlat18;
					bool u_xlatb18;
					float u_xlat19;
					float u_xlat20;
					float u_xlat22;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD1.zw);
					    u_xlat18 = u_xlat0.w + u_xlat0.w;
					    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
					    u_xlat1 = u_xlat18 * 0.800000012;
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat7 = u_xlat2.w + u_xlat2.w;
					    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
					    u_xlat13 = u_xlat7 * 0.800000012;
					    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
					    u_xlat3 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat2.xyz = u_xlat3.xyz * u_xlat3.www + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat1) + u_xlat2.xyz;
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat1 = u_xlat2.w + u_xlat2.w;
					    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
					    u_xlat13 = u_xlat1 * 0.675000012;
					    u_xlat0.xyz = u_xlat2.xyz * vec3(u_xlat13) + u_xlat0.xyz;
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD2.zw);
					    u_xlat13 = u_xlat2.w + u_xlat2.w;
					    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
					    u_xlat19 = u_xlat13 * 0.675000012;
					    u_xlat0.xyz = u_xlat2.xyz * vec3(u_xlat19) + u_xlat0.xyz;
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat19 = u_xlat2.w + u_xlat2.w;
					    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
					    u_xlat20 = u_xlat19 * 0.5;
					    u_xlat0.xyz = u_xlat2.xyz * vec3(u_xlat20) + u_xlat0.xyz;
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD3.zw);
					    u_xlat20 = u_xlat2.w + u_xlat2.w;
					    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
					    u_xlat4.x = u_xlat20 * 0.5;
					    u_xlat0.xyz = u_xlat2.xyz * u_xlat4.xxx + u_xlat0.xyz;
					    u_xlat4 = texture(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat2.x = u_xlat4.w + u_xlat4.w;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat8 = u_xlat2.x * 0.200000003;
					    u_xlat0.xyz = u_xlat4.xyz * vec3(u_xlat8) + u_xlat0.xyz;
					    u_xlat4 = texture(_MainTex, vs_TEXCOORD4.zw);
					    u_xlat8 = u_xlat4.w + u_xlat4.w;
					    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
					    u_xlat14 = u_xlat8 * 0.200000003;
					    u_xlat0.xyz = u_xlat4.xyz * vec3(u_xlat14) + u_xlat0.xyz;
					    u_xlat4 = texture(_MainTex, vs_TEXCOORD5.xy);
					    u_xlat14 = u_xlat4.w + u_xlat4.w;
					    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
					    u_xlat22 = u_xlat14 * 0.075000003;
					    u_xlat0.xyz = u_xlat4.xyz * vec3(u_xlat22) + u_xlat0.xyz;
					    u_xlat4 = texture(_MainTex, vs_TEXCOORD5.zw);
					    u_xlat22 = u_xlat4.w + u_xlat4.w;
					    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
					    u_xlat5 = u_xlat22 * 0.075000003;
					    u_xlat0.xyz = u_xlat4.xyz * vec3(u_xlat5) + u_xlat0.xyz;
					    u_xlat7 = u_xlat7 * 0.800000012 + u_xlat3.w;
					    u_xlat18 = u_xlat18 * 0.800000012 + u_xlat7;
					    u_xlat18 = u_xlat1 * 0.675000012 + u_xlat18;
					    u_xlat18 = u_xlat13 * 0.675000012 + u_xlat18;
					    u_xlat18 = u_xlat19 * 0.5 + u_xlat18;
					    u_xlat18 = u_xlat20 * 0.5 + u_xlat18;
					    u_xlat18 = u_xlat2.x * 0.200000003 + u_xlat18;
					    u_xlat18 = u_xlat8 * 0.200000003 + u_xlat18;
					    u_xlat18 = u_xlat14 * 0.075000003 + u_xlat18;
					    u_xlat18 = u_xlat22 * 0.075000003 + u_xlat18;
					    u_xlat18 = u_xlat18 + 9.99999975e-05;
					    u_xlat0.xyz = u_xlat0.xyz / vec3(u_xlat18);
					    u_xlatb18 = u_xlat3.w<0.00999999978;
					    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat3.xyz : u_xlat0.xyz;
					    SV_Target0.w = u_xlat3.w;
					    return;
					}"
				}
			}
		}
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 1327613
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
						vec4 unused_0_0[3];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat1 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.y = (u_xlatb0) ? u_xlat1 : in_TEXCOORD0.y;
					    phase0_Output0_1.xzw = in_TEXCOORD0.xxy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    SV_Target0.w = u_xlat0.w * 100.0;
					    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
					    SV_Target0.xyz = u_xlat0.xyz;
					    return;
					}"
				}
			}
		}
		Pass {
			Blend DstAlpha OneMinusDstAlpha, Zero One
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 1432824
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
						vec4 unused_0_0[3];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat1 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.yw = (bool(u_xlatb0)) ? vec2(u_xlat1) : in_TEXCOORD0.yy;
					    phase0_Output0_1.xz = in_TEXCOORD0.xx;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
						vec4 _MainTex_TexelSize;
						vec4 _Offsets;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec2 u_xlat4;
					bool u_xlatb4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec2 u_xlat7;
					float u_xlat8;
					int u_xlati16;
					vec2 u_xlat20;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat1 = u_xlat0.wwww * u_xlat0;
					    u_xlat0.x = u_xlat0.w * 0.0909090936;
					    u_xlat2 = _MainTex_TexelSize.xyxy * _Offsets.xyxy;
					    u_xlat2 = u_xlat0.xxxx * u_xlat2;
					    u_xlat2 = u_xlat2 * vec4(1.0, 1.0, -1.0, -1.0);
					    u_xlat3 = u_xlat1;
					    u_xlat8 = u_xlat0.w;
					    for(int u_xlati_loop_1 = 1 ; u_xlati_loop_1<12 ; u_xlati_loop_1++)
					    {
					        u_xlat4.x = float(u_xlati_loop_1);
					        u_xlat5 = u_xlat2 * u_xlat4.xxxx + vs_TEXCOORD1.xyxy;
					        u_xlat6 = texture(_MainTex, u_xlat5.xy);
					        u_xlat5 = texture(_MainTex, u_xlat5.zw);
					        u_xlat7.x = u_xlat6.w;
					        u_xlat7.y = u_xlat5.w;
					        u_xlat4.xy = (-u_xlat0.xx) * u_xlat4.xx + u_xlat7.xy;
					        u_xlat4.xy = u_xlat4.xy + vec2(0.400000006, 0.400000006);
					        u_xlat4.xy = u_xlat4.xy * vec2(2.5, 2.5);
					        u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
					        u_xlat20.xy = u_xlat4.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
					        u_xlat4.xy = u_xlat4.xy * u_xlat4.xy;
					        u_xlat4.xy = u_xlat4.xy * u_xlat20.xy;
					        u_xlat5 = u_xlat4.yyyy * u_xlat5;
					        u_xlat5 = u_xlat6 * u_xlat4.xxxx + u_xlat5;
					        u_xlat3 = u_xlat3 + u_xlat5;
					        u_xlat4.x = dot(u_xlat4.xy, vec2(1.0, 1.0));
					        u_xlat8 = u_xlat8 + u_xlat4.x;
					    }
					    u_xlat0.x = u_xlat8 + 9.99999975e-06;
					    SV_Target0 = u_xlat3 / u_xlat0.xxxx;
					    return;
					}"
				}
			}
		}
		Pass {
			Blend DstAlpha One, Zero One
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 1454474
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
						vec4 unused_0_0[3];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					 vec4 phase0_Output0_1;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					bool u_xlatb0;
					float u_xlat1;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat1 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.y = (u_xlatb0) ? u_xlat1 : in_TEXCOORD0.y;
					    phase0_Output0_1.xzw = in_TEXCOORD0.xxy;
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0 = texture(_MainTex, vs_TEXCOORD1.xy);
					    return;
					}"
				}
			}
		}
	}
}