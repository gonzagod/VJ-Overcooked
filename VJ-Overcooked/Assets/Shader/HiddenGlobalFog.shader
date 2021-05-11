Shader "Hidden/GlobalFog" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "black" {}
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			Fog {
				Mode Off
			}
			GpuProgramID 11345
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[6];
						vec4 _MainTex_TexelSize;
						mat4x4 _FrustumCornersWS;
						vec4 unused_0_3;
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
					out vec4 vs_TEXCOORD2;
					vec4 u_xlat0;
					int u_xlati0;
					bool u_xlatb0;
					float u_xlat1;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001) + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat1 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.y = (u_xlatb0) ? u_xlat1 : in_TEXCOORD0.y;
					    phase0_Output0_1.xzw = in_TEXCOORD0.xxy;
					    vs_TEXCOORD2.w = in_POSITION0.z;
					    u_xlati0 = int(in_POSITION0.z);
					    vs_TEXCOORD2.x = dot(_FrustumCornersWS[0], ImmCB_0_0_0[u_xlati0]);
					    vs_TEXCOORD2.y = dot(_FrustumCornersWS[1], ImmCB_0_0_0[u_xlati0]);
					    vs_TEXCOORD2.z = dot(_FrustumCornersWS[2], ImmCB_0_0_0[u_xlati0]);
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[6];
						vec4 _MainTex_TexelSize;
						mat4x4 _FrustumCornersWS;
						vec4 unused_0_3;
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
					out vec4 vs_TEXCOORD2;
					vec4 u_xlat0;
					int u_xlati0;
					bool u_xlatb0;
					float u_xlat1;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001) + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat1 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.y = (u_xlatb0) ? u_xlat1 : in_TEXCOORD0.y;
					    phase0_Output0_1.xzw = in_TEXCOORD0.xxy;
					    vs_TEXCOORD2.w = in_POSITION0.z;
					    u_xlati0 = int(in_POSITION0.z);
					    vs_TEXCOORD2.x = dot(_FrustumCornersWS[0], ImmCB_0_0_0[u_xlati0]);
					    vs_TEXCOORD2.y = dot(_FrustumCornersWS[1], ImmCB_0_0_0[u_xlati0]);
					    vs_TEXCOORD2.z = dot(_FrustumCornersWS[2], ImmCB_0_0_0[u_xlati0]);
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
						vec4 _HeightParams;
						vec4 _DistanceParams;
						ivec4 _SceneFogMode;
						vec4 _SceneFogParams;
						vec4 unused_0_5[5];
						vec4 _CameraWS;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2;
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unused_2_1;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					bvec4 u_xlatb2;
					float u_xlat3;
					bool u_xlatb6;
					float u_xlat9;
					void main()
					{
					    u_xlat0.x = (-_HeightParams.z) * 2.0 + 1.0;
					    u_xlat1 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy);
					    u_xlat3 = _ZBufferParams.x * u_xlat1.x + _ZBufferParams.y;
					    u_xlatb6 = u_xlat1.x>=0.999998987;
					    u_xlat3 = float(1.0) / u_xlat3;
					    u_xlat9 = u_xlat3 * vs_TEXCOORD2.y + _CameraWS.y;
					    u_xlat9 = u_xlat9 + (-_HeightParams.x);
					    u_xlat0.x = u_xlat9 * u_xlat0.x;
					    u_xlat9 = u_xlat9 + _HeightParams.y;
					    u_xlat0.x = min(u_xlat0.x, 0.0);
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat1.x = u_xlat3 * vs_TEXCOORD2.y + 9.99999975e-06;
					    u_xlat0.x = u_xlat0.x / abs(u_xlat1.x);
					    u_xlat0.x = _HeightParams.z * u_xlat9 + (-u_xlat0.x);
					    u_xlat9 = u_xlat3 * _ProjectionParams.z;
					    u_xlat1.xyz = vec3(u_xlat3) * vs_TEXCOORD2.xyz;
					    u_xlat3 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * _HeightParams.www;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat3 = sqrt(u_xlat3);
					    u_xlatb2 = equal(_SceneFogMode.yxxx, ivec4(1, 1, 2, 3));
					    u_xlat3 = (u_xlatb2.x) ? u_xlat3 : u_xlat9;
					    u_xlat3 = u_xlat3 + (-_ProjectionParams.y);
					    u_xlat3 = u_xlat3 + _DistanceParams.x;
					    u_xlat0.x = (-u_xlat1.x) * u_xlat0.x + u_xlat3;
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat3 = u_xlat0.x * _SceneFogParams.z + _SceneFogParams.w;
					    u_xlat0.xw = u_xlat0.xx * _SceneFogParams.yx;
					    u_xlat3 = u_xlatb2.y ? u_xlat3 : float(0.0);
					    u_xlat0.x = exp2((-u_xlat0.x));
					    u_xlat9 = u_xlat0.w * (-u_xlat0.w);
					    u_xlat9 = exp2(u_xlat9);
					    u_xlat0.x = (u_xlatb2.z) ? u_xlat0.x : u_xlat3;
					    u_xlat0.x = (u_xlatb2.w) ? u_xlat9 : u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = (u_xlatb6) ? 1.0 : u_xlat0.x;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1 = u_xlat1 + (-unity_FogColor);
					    SV_Target0 = u_xlat0.xxxx * u_xlat1 + unity_FogColor;
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
						vec4 _HeightParams;
						vec4 _DistanceParams;
						ivec4 _SceneFogMode;
						vec4 _SceneFogParams;
						vec4 unused_0_5[5];
						vec4 _CameraWS;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2;
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unused_2_1;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					bvec4 u_xlatb2;
					float u_xlat3;
					bool u_xlatb6;
					float u_xlat9;
					void main()
					{
					    u_xlat0.x = (-_HeightParams.z) * 2.0 + 1.0;
					    u_xlat1 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy);
					    u_xlat3 = _ZBufferParams.x * u_xlat1.x + _ZBufferParams.y;
					    u_xlatb6 = u_xlat1.x>=0.999998987;
					    u_xlat3 = float(1.0) / u_xlat3;
					    u_xlat9 = u_xlat3 * vs_TEXCOORD2.y + _CameraWS.y;
					    u_xlat9 = u_xlat9 + (-_HeightParams.x);
					    u_xlat0.x = u_xlat9 * u_xlat0.x;
					    u_xlat9 = u_xlat9 + _HeightParams.y;
					    u_xlat0.x = min(u_xlat0.x, 0.0);
					    u_xlat0.x = u_xlat0.x * u_xlat0.x;
					    u_xlat1.x = u_xlat3 * vs_TEXCOORD2.y + 9.99999975e-06;
					    u_xlat0.x = u_xlat0.x / abs(u_xlat1.x);
					    u_xlat0.x = _HeightParams.z * u_xlat9 + (-u_xlat0.x);
					    u_xlat9 = u_xlat3 * _ProjectionParams.z;
					    u_xlat1.xyz = vec3(u_xlat3) * vs_TEXCOORD2.xyz;
					    u_xlat3 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * _HeightParams.www;
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat3 = sqrt(u_xlat3);
					    u_xlatb2 = equal(_SceneFogMode.yxxx, ivec4(1, 1, 2, 3));
					    u_xlat3 = (u_xlatb2.x) ? u_xlat3 : u_xlat9;
					    u_xlat3 = u_xlat3 + (-_ProjectionParams.y);
					    u_xlat3 = u_xlat3 + _DistanceParams.x;
					    u_xlat0.x = (-u_xlat1.x) * u_xlat0.x + u_xlat3;
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat3 = u_xlat0.x * _SceneFogParams.z + _SceneFogParams.w;
					    u_xlat0.xw = u_xlat0.xx * _SceneFogParams.yx;
					    u_xlat3 = u_xlatb2.y ? u_xlat3 : float(0.0);
					    u_xlat0.x = exp2((-u_xlat0.x));
					    u_xlat9 = u_xlat0.w * (-u_xlat0.w);
					    u_xlat9 = exp2(u_xlat9);
					    u_xlat0.x = (u_xlatb2.z) ? u_xlat0.x : u_xlat3;
					    u_xlat0.x = (u_xlatb2.w) ? u_xlat9 : u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat0.x = (u_xlatb6) ? 1.0 : u_xlat0.x;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1 = u_xlat1 + (-unity_FogColor);
					    SV_Target0 = u_xlat0.xxxx * u_xlat1 + unity_FogColor;
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
			Fog {
				Mode Off
			}
			GpuProgramID 90837
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[6];
						vec4 _MainTex_TexelSize;
						mat4x4 _FrustumCornersWS;
						vec4 unused_0_3;
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
					out vec4 vs_TEXCOORD2;
					vec4 u_xlat0;
					int u_xlati0;
					bool u_xlatb0;
					float u_xlat1;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001) + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat1 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.y = (u_xlatb0) ? u_xlat1 : in_TEXCOORD0.y;
					    phase0_Output0_1.xzw = in_TEXCOORD0.xxy;
					    vs_TEXCOORD2.w = in_POSITION0.z;
					    u_xlati0 = int(in_POSITION0.z);
					    vs_TEXCOORD2.x = dot(_FrustumCornersWS[0], ImmCB_0_0_0[u_xlati0]);
					    vs_TEXCOORD2.y = dot(_FrustumCornersWS[1], ImmCB_0_0_0[u_xlati0]);
					    vs_TEXCOORD2.z = dot(_FrustumCornersWS[2], ImmCB_0_0_0[u_xlati0]);
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[6];
						vec4 _MainTex_TexelSize;
						mat4x4 _FrustumCornersWS;
						vec4 unused_0_3;
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
					out vec4 vs_TEXCOORD2;
					vec4 u_xlat0;
					int u_xlati0;
					bool u_xlatb0;
					float u_xlat1;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001) + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat1 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.y = (u_xlatb0) ? u_xlat1 : in_TEXCOORD0.y;
					    phase0_Output0_1.xzw = in_TEXCOORD0.xxy;
					    vs_TEXCOORD2.w = in_POSITION0.z;
					    u_xlati0 = int(in_POSITION0.z);
					    vs_TEXCOORD2.x = dot(_FrustumCornersWS[0], ImmCB_0_0_0[u_xlati0]);
					    vs_TEXCOORD2.y = dot(_FrustumCornersWS[1], ImmCB_0_0_0[u_xlati0]);
					    vs_TEXCOORD2.z = dot(_FrustumCornersWS[2], ImmCB_0_0_0[u_xlati0]);
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
						vec4 _DistanceParams;
						ivec4 _SceneFogMode;
						vec4 _SceneFogParams;
						vec4 unused_0_4[6];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2;
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unused_2_1;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					bvec4 u_xlatb1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy);
					    u_xlat2.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlatb0 = u_xlat0.x>=0.999998987;
					    u_xlat2.x = float(1.0) / u_xlat2.x;
					    u_xlat1.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz;
					    u_xlat2.x = u_xlat2.x * _ProjectionParams.z;
					    u_xlat4 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat4 = sqrt(u_xlat4);
					    u_xlatb1 = equal(_SceneFogMode.yxxx, ivec4(1, 1, 2, 3));
					    u_xlat2.x = (u_xlatb1.x) ? u_xlat4 : u_xlat2.x;
					    u_xlat2.x = u_xlat2.x + (-_ProjectionParams.y);
					    u_xlat2.x = u_xlat2.x + _DistanceParams.x;
					    u_xlat2.x = max(u_xlat2.x, 0.0);
					    u_xlat4 = u_xlat2.x * _SceneFogParams.z + _SceneFogParams.w;
					    u_xlat2.xz = u_xlat2.xx * _SceneFogParams.yx;
					    u_xlat4 = u_xlatb1.y ? u_xlat4 : float(0.0);
					    u_xlat2.x = exp2((-u_xlat2.x));
					    u_xlat6 = u_xlat2.z * (-u_xlat2.z);
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat2.x = (u_xlatb1.z) ? u_xlat2.x : u_xlat4;
					    u_xlat2.x = (u_xlatb1.w) ? u_xlat6 : u_xlat2.x;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1 = u_xlat1 + (-unity_FogColor);
					    SV_Target0 = u_xlat0.xxxx * u_xlat1 + unity_FogColor;
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
						vec4 unused_0_0[3];
						vec4 _DistanceParams;
						ivec4 _SceneFogMode;
						vec4 _SceneFogParams;
						vec4 unused_0_4[6];
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2;
						vec4 _ZBufferParams;
						vec4 unused_1_4;
					};
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unused_2_1;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					bvec4 u_xlatb1;
					vec3 u_xlat2;
					float u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy);
					    u_xlat2.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
					    u_xlatb0 = u_xlat0.x>=0.999998987;
					    u_xlat2.x = float(1.0) / u_xlat2.x;
					    u_xlat1.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz;
					    u_xlat2.x = u_xlat2.x * _ProjectionParams.z;
					    u_xlat4 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat4 = sqrt(u_xlat4);
					    u_xlatb1 = equal(_SceneFogMode.yxxx, ivec4(1, 1, 2, 3));
					    u_xlat2.x = (u_xlatb1.x) ? u_xlat4 : u_xlat2.x;
					    u_xlat2.x = u_xlat2.x + (-_ProjectionParams.y);
					    u_xlat2.x = u_xlat2.x + _DistanceParams.x;
					    u_xlat2.x = max(u_xlat2.x, 0.0);
					    u_xlat4 = u_xlat2.x * _SceneFogParams.z + _SceneFogParams.w;
					    u_xlat2.xz = u_xlat2.xx * _SceneFogParams.yx;
					    u_xlat4 = u_xlatb1.y ? u_xlat4 : float(0.0);
					    u_xlat2.x = exp2((-u_xlat2.x));
					    u_xlat6 = u_xlat2.z * (-u_xlat2.z);
					    u_xlat6 = exp2(u_xlat6);
					    u_xlat2.x = (u_xlatb1.z) ? u_xlat2.x : u_xlat4;
					    u_xlat2.x = (u_xlatb1.w) ? u_xlat6 : u_xlat2.x;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat0.x = (u_xlatb0) ? 1.0 : u_xlat2.x;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1 = u_xlat1 + (-unity_FogColor);
					    SV_Target0 = u_xlat0.xxxx * u_xlat1 + unity_FogColor;
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
			Fog {
				Mode Off
			}
			GpuProgramID 159756
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[6];
						vec4 _MainTex_TexelSize;
						mat4x4 _FrustumCornersWS;
						vec4 unused_0_3;
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
					out vec4 vs_TEXCOORD2;
					vec4 u_xlat0;
					int u_xlati0;
					bool u_xlatb0;
					float u_xlat1;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001) + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat1 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.y = (u_xlatb0) ? u_xlat1 : in_TEXCOORD0.y;
					    phase0_Output0_1.xzw = in_TEXCOORD0.xxy;
					    vs_TEXCOORD2.w = in_POSITION0.z;
					    u_xlati0 = int(in_POSITION0.z);
					    vs_TEXCOORD2.x = dot(_FrustumCornersWS[0], ImmCB_0_0_0[u_xlati0]);
					    vs_TEXCOORD2.y = dot(_FrustumCornersWS[1], ImmCB_0_0_0[u_xlati0]);
					    vs_TEXCOORD2.z = dot(_FrustumCornersWS[2], ImmCB_0_0_0[u_xlati0]);
					vs_TEXCOORD0 = phase0_Output0_1.xy;
					vs_TEXCOORD1 = phase0_Output0_1.zw;
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
					vec4 ImmCB_0_0_0[4];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[6];
						vec4 _MainTex_TexelSize;
						mat4x4 _FrustumCornersWS;
						vec4 unused_0_3;
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
					out vec4 vs_TEXCOORD2;
					vec4 u_xlat0;
					int u_xlati0;
					bool u_xlatb0;
					float u_xlat1;
					void main()
					{
						ImmCB_0_0_0[0] = vec4(1.0, 0.0, 0.0, 0.0);
						ImmCB_0_0_0[1] = vec4(0.0, 1.0, 0.0, 0.0);
						ImmCB_0_0_0[2] = vec4(0.0, 0.0, 1.0, 0.0);
						ImmCB_0_0_0[3] = vec4(0.0, 0.0, 0.0, 1.0);
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * vec4(0.100000001, 0.100000001, 0.100000001, 0.100000001) + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat1 = (-in_TEXCOORD0.y) + 1.0;
					    phase0_Output0_1.y = (u_xlatb0) ? u_xlat1 : in_TEXCOORD0.y;
					    phase0_Output0_1.xzw = in_TEXCOORD0.xxy;
					    vs_TEXCOORD2.w = in_POSITION0.z;
					    u_xlati0 = int(in_POSITION0.z);
					    vs_TEXCOORD2.x = dot(_FrustumCornersWS[0], ImmCB_0_0_0[u_xlati0]);
					    vs_TEXCOORD2.y = dot(_FrustumCornersWS[1], ImmCB_0_0_0[u_xlati0]);
					    vs_TEXCOORD2.z = dot(_FrustumCornersWS[2], ImmCB_0_0_0[u_xlati0]);
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
						vec4 _HeightParams;
						vec4 _DistanceParams;
						ivec4 _SceneFogMode;
						vec4 _SceneFogParams;
						vec4 unused_0_5[5];
						vec4 _CameraWS;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[7];
						vec4 _ZBufferParams;
						vec4 unused_1_2;
					};
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unused_2_1;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec4 u_xlat1;
					bvec3 u_xlatb1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					bool u_xlatb4;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = (-_HeightParams.z) * 2.0 + 1.0;
					    u_xlat1 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy);
					    u_xlat2.x = _ZBufferParams.x * u_xlat1.x + _ZBufferParams.y;
					    u_xlatb4 = u_xlat1.x>=0.999998987;
					    u_xlat2.x = float(1.0) / u_xlat2.x;
					    u_xlat6 = u_xlat2.x * vs_TEXCOORD2.y + _CameraWS.y;
					    u_xlat6 = u_xlat6 + (-_HeightParams.x);
					    u_xlat0 = u_xlat6 * u_xlat0;
					    u_xlat6 = u_xlat6 + _HeightParams.y;
					    u_xlat0 = min(u_xlat0, 0.0);
					    u_xlat0 = u_xlat0 * u_xlat0;
					    u_xlat1.x = u_xlat2.x * vs_TEXCOORD2.y + 9.99999975e-06;
					    u_xlat3.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz;
					    u_xlat3.xyz = u_xlat3.xyz * _HeightParams.www;
					    u_xlat2.x = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat2.x = sqrt(u_xlat2.x);
					    u_xlat0 = u_xlat0 / abs(u_xlat1.x);
					    u_xlat0 = _HeightParams.z * u_xlat6 + (-u_xlat0);
					    u_xlat0 = (-u_xlat2.x) * u_xlat0 + _DistanceParams.x;
					    u_xlat0 = max(u_xlat0, 0.0);
					    u_xlat2.xz = vec2(u_xlat0) * _SceneFogParams.yx;
					    u_xlat0 = u_xlat0 * _SceneFogParams.z + _SceneFogParams.w;
					    u_xlat2.x = exp2((-u_xlat2.x));
					    u_xlat6 = u_xlat2.z * (-u_xlat2.z);
					    u_xlat6 = exp2(u_xlat6);
					    u_xlatb1.xyz = equal(_SceneFogMode.xxxx, ivec4(1, 2, 3, 0)).xyz;
					    u_xlat0 = u_xlatb1.x ? u_xlat0 : float(0.0);
					    u_xlat0 = (u_xlatb1.y) ? u_xlat2.x : u_xlat0;
					    u_xlat0 = (u_xlatb1.z) ? u_xlat6 : u_xlat0;
					    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
					    u_xlat0 = (u_xlatb4) ? 1.0 : u_xlat0;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1 = u_xlat1 + (-unity_FogColor);
					    SV_Target0 = vec4(u_xlat0) * u_xlat1 + unity_FogColor;
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
						vec4 _HeightParams;
						vec4 _DistanceParams;
						ivec4 _SceneFogMode;
						vec4 _SceneFogParams;
						vec4 unused_0_5[5];
						vec4 _CameraWS;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[7];
						vec4 _ZBufferParams;
						vec4 unused_1_2;
					};
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unused_2_1;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec4 u_xlat1;
					bvec3 u_xlatb1;
					vec3 u_xlat2;
					vec3 u_xlat3;
					bool u_xlatb4;
					float u_xlat6;
					void main()
					{
					    u_xlat0 = (-_HeightParams.z) * 2.0 + 1.0;
					    u_xlat1 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy);
					    u_xlat2.x = _ZBufferParams.x * u_xlat1.x + _ZBufferParams.y;
					    u_xlatb4 = u_xlat1.x>=0.999998987;
					    u_xlat2.x = float(1.0) / u_xlat2.x;
					    u_xlat6 = u_xlat2.x * vs_TEXCOORD2.y + _CameraWS.y;
					    u_xlat6 = u_xlat6 + (-_HeightParams.x);
					    u_xlat0 = u_xlat6 * u_xlat0;
					    u_xlat6 = u_xlat6 + _HeightParams.y;
					    u_xlat0 = min(u_xlat0, 0.0);
					    u_xlat0 = u_xlat0 * u_xlat0;
					    u_xlat1.x = u_xlat2.x * vs_TEXCOORD2.y + 9.99999975e-06;
					    u_xlat3.xyz = u_xlat2.xxx * vs_TEXCOORD2.xyz;
					    u_xlat3.xyz = u_xlat3.xyz * _HeightParams.www;
					    u_xlat2.x = dot(u_xlat3.xyz, u_xlat3.xyz);
					    u_xlat2.x = sqrt(u_xlat2.x);
					    u_xlat0 = u_xlat0 / abs(u_xlat1.x);
					    u_xlat0 = _HeightParams.z * u_xlat6 + (-u_xlat0);
					    u_xlat0 = (-u_xlat2.x) * u_xlat0 + _DistanceParams.x;
					    u_xlat0 = max(u_xlat0, 0.0);
					    u_xlat2.xz = vec2(u_xlat0) * _SceneFogParams.yx;
					    u_xlat0 = u_xlat0 * _SceneFogParams.z + _SceneFogParams.w;
					    u_xlat2.x = exp2((-u_xlat2.x));
					    u_xlat6 = u_xlat2.z * (-u_xlat2.z);
					    u_xlat6 = exp2(u_xlat6);
					    u_xlatb1.xyz = equal(_SceneFogMode.xxxx, ivec4(1, 2, 3, 0)).xyz;
					    u_xlat0 = u_xlatb1.x ? u_xlat0 : float(0.0);
					    u_xlat0 = (u_xlatb1.y) ? u_xlat2.x : u_xlat0;
					    u_xlat0 = (u_xlatb1.z) ? u_xlat6 : u_xlat0;
					    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
					    u_xlat0 = (u_xlatb4) ? 1.0 : u_xlat0;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1 = u_xlat1 + (-unity_FogColor);
					    SV_Target0 = vec4(u_xlat0) * u_xlat1 + unity_FogColor;
					    return;
					}"
				}
			}
		}
	}
}