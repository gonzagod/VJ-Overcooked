Shader "Custom/WaveyLiquid" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_Samples ("Samples", Float) = 4
		_Color1 ("Low Color", Vector) = (1,1,1,1)
		_Color2 ("High Color", Vector) = (1,1,1,1)
		_Amplitude ("Amplitude", Float) = 1
		_SpeedMultiplier ("SpeedMultiplier", Float) = 1
		_MinWavelength ("MinWavelength", Float) = 1
		_MaxWavelength ("MaxWavelength", Float) = 10
	}
	SubShader {
		LOD 200
		Tags { "QUEUE" = "Background" "RenderType" = "Opaque" }
		Pass {
			Name "FORWARD"
			LOD 200
			Tags { "LIGHTMODE" = "ForwardBase" "QUEUE" = "Background" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
			ZClip Off
			ZTest Always
			Cull Off
			Lighting On
			GpuProgramID 58
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
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
						vec4 unused_3_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					out vec3 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2.x = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2.x = u_xlat7 * u_xlat2.x;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3.x = sin(u_xlat7);
					        u_xlat4 = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3.x;
					        u_xlat12 = u_xlat4 * u_xlat0.x + u_xlat12;
					        u_xlat2.x = u_xlat2.x * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2.x);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    gl_Position = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat1.x = dot(unity_SHAr, u_xlat0);
					    u_xlat1.y = dot(unity_SHAg, u_xlat0);
					    u_xlat1.z = dot(unity_SHAb, u_xlat0);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat15 = u_xlat0.y * u_xlat0.y;
					    u_xlat15 = u_xlat0.x * u_xlat0.x + (-u_xlat15);
					    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat15) + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD2.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD0.xyz = u_xlat0.xyz;
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
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
						vec4 unused_3_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					out vec3 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2.x = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2.x = u_xlat7 * u_xlat2.x;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3.x = sin(u_xlat7);
					        u_xlat4 = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3.x;
					        u_xlat12 = u_xlat4 * u_xlat0.x + u_xlat12;
					        u_xlat2.x = u_xlat2.x * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2.x);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    gl_Position = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat1.x = dot(unity_SHAr, u_xlat0);
					    u_xlat1.y = dot(unity_SHAg, u_xlat0);
					    u_xlat1.z = dot(unity_SHAb, u_xlat0);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat15 = u_xlat0.y * u_xlat0.y;
					    u_xlat15 = u_xlat0.x * u_xlat0.x + (-u_xlat15);
					    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat15) + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD2.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD0.xyz = u_xlat0.xyz;
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[4];
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
						vec4 unused_3_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					out vec3 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2.x = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2.x = u_xlat7 * u_xlat2.x;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3.x = sin(u_xlat7);
					        u_xlat4.x = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3.x;
					        u_xlat12 = u_xlat4.x * u_xlat0.x + u_xlat12;
					        u_xlat2.x = u_xlat2.x * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2.x);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat3 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat3);
					    u_xlat4.y = dot(unity_SHBg, u_xlat3);
					    u_xlat4.z = dot(unity_SHBb, u_xlat3);
					    u_xlat15 = u_xlat0.y * u_xlat0.y;
					    u_xlat15 = u_xlat0.x * u_xlat0.x + (-u_xlat15);
					    u_xlat3.xyz = unity_SHC.xyz * vec3(u_xlat15) + u_xlat4.xyz;
					    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat2.xyz = log2(u_xlat2.xyz);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat2.xyz = exp2(u_xlat2.xyz);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat2.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    u_xlat15 = u_xlat1.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat15 * 0.5;
					    vs_TEXCOORD3.xy = u_xlat2.zz + u_xlat2.xw;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD3.zw = u_xlat1.zw;
					    vs_TEXCOORD0.xyz = u_xlat0.xyz;
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
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
						vec4 unused_3_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					out vec3 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec3 vs_TEXCOORD2;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat8;
					float u_xlat12;
					int u_xlati13;
					float u_xlat14;
					float u_xlat18;
					float u_xlat19;
					bool u_xlatb19;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat12 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat18 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat7 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat19 = u_xlat12 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat19 = 6.28318024 / u_xlat19;
					        u_xlat2.x = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat8 = u_xlat19 * 9.81000042;
					        u_xlat8 = sqrt(u_xlat8);
					        u_xlat2.x = u_xlat8 * u_xlat2.x;
					        u_xlat8 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3.x = sin(u_xlat8);
					        u_xlat4.x = cos(u_xlat8);
					        u_xlat8 = u_xlat18 / u_xlat19;
					        u_xlat7 = u_xlat7 + u_xlat8;
					        u_xlat14 = u_xlat0.y * u_xlat3.x;
					        u_xlat14 = u_xlat4.x * u_xlat0.x + u_xlat14;
					        u_xlat2.x = u_xlat2.x * _Time.y;
					        u_xlat19 = u_xlat19 * u_xlat14 + (-u_xlat2.x);
					        u_xlat19 = sin(u_xlat19);
					        u_xlat1.x = u_xlat8 * u_xlat19 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat6 = u_xlat1.x / u_xlat7;
					    u_xlat6 = u_xlat6 + 1.0;
					    u_xlat6 = u_xlat6 * 0.5;
					    u_xlat6 = u_xlat6 * u_xlat6;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat6) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    gl_Position = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
					    u_xlat2 = (-u_xlat0.xxxx) + unity_4LightPosX0;
					    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
					    u_xlat4 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
					    u_xlat5 = u_xlat3 * u_xlat3;
					    u_xlat5 = u_xlat2 * u_xlat2 + u_xlat5;
					    u_xlat5 = u_xlat4 * u_xlat4 + u_xlat5;
					    u_xlat5 = max(u_xlat5, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat3 = u_xlat1.yyyy * u_xlat3;
					    u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat3;
					    u_xlat2 = u_xlat4 * u_xlat1.zzzz + u_xlat2;
					    u_xlat3 = inversesqrt(u_xlat5);
					    u_xlat2 = u_xlat2 * u_xlat3;
					    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat3 = u_xlat5 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat3 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat3;
					    u_xlat2 = u_xlat2 * u_xlat3;
					    u_xlat3.xyz = u_xlat2.yyy * unity_LightColor[1].xyz;
					    u_xlat3.xyz = unity_LightColor[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
					    u_xlat2.xyz = unity_LightColor[2].xyz * u_xlat2.zzz + u_xlat3.xyz;
					    u_xlat2.xyz = unity_LightColor[3].xyz * u_xlat2.www + u_xlat2.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat3.x = dot(unity_SHAr, u_xlat1);
					    u_xlat3.y = dot(unity_SHAg, u_xlat1);
					    u_xlat3.z = dot(unity_SHAb, u_xlat1);
					    u_xlat4 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat5.x = dot(unity_SHBr, u_xlat4);
					    u_xlat5.y = dot(unity_SHBg, u_xlat4);
					    u_xlat5.z = dot(unity_SHBb, u_xlat4);
					    u_xlat18 = u_xlat1.y * u_xlat1.y;
					    u_xlat18 = u_xlat1.x * u_xlat1.x + (-u_xlat18);
					    u_xlat4.xyz = unity_SHC.xyz * vec3(u_xlat18) + u_xlat5.xyz;
					    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat3.xyz = log2(u_xlat3.xyz);
					    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat3.xyz = exp2(u_xlat3.xyz);
					    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD2.xyz = u_xlat2.xyz + u_xlat3.xyz;
					    vs_TEXCOORD0.xyz = u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
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
						vec4 unused_3_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					out vec3 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec3 vs_TEXCOORD2;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat8;
					float u_xlat12;
					int u_xlati13;
					float u_xlat14;
					float u_xlat18;
					float u_xlat19;
					bool u_xlatb19;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat12 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat18 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat7 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat19 = u_xlat12 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat19 = 6.28318024 / u_xlat19;
					        u_xlat2.x = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat8 = u_xlat19 * 9.81000042;
					        u_xlat8 = sqrt(u_xlat8);
					        u_xlat2.x = u_xlat8 * u_xlat2.x;
					        u_xlat8 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3.x = sin(u_xlat8);
					        u_xlat4.x = cos(u_xlat8);
					        u_xlat8 = u_xlat18 / u_xlat19;
					        u_xlat7 = u_xlat7 + u_xlat8;
					        u_xlat14 = u_xlat0.y * u_xlat3.x;
					        u_xlat14 = u_xlat4.x * u_xlat0.x + u_xlat14;
					        u_xlat2.x = u_xlat2.x * _Time.y;
					        u_xlat19 = u_xlat19 * u_xlat14 + (-u_xlat2.x);
					        u_xlat19 = sin(u_xlat19);
					        u_xlat1.x = u_xlat8 * u_xlat19 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat6 = u_xlat1.x / u_xlat7;
					    u_xlat6 = u_xlat6 + 1.0;
					    u_xlat6 = u_xlat6 * 0.5;
					    u_xlat6 = u_xlat6 * u_xlat6;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat6) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    gl_Position = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat1.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat1.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat1.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat18 = inversesqrt(u_xlat18);
					    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
					    u_xlat2 = (-u_xlat0.xxxx) + unity_4LightPosX0;
					    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
					    u_xlat4 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
					    u_xlat5 = u_xlat3 * u_xlat3;
					    u_xlat5 = u_xlat2 * u_xlat2 + u_xlat5;
					    u_xlat5 = u_xlat4 * u_xlat4 + u_xlat5;
					    u_xlat5 = max(u_xlat5, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat3 = u_xlat1.yyyy * u_xlat3;
					    u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat3;
					    u_xlat2 = u_xlat4 * u_xlat1.zzzz + u_xlat2;
					    u_xlat3 = inversesqrt(u_xlat5);
					    u_xlat2 = u_xlat2 * u_xlat3;
					    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat3 = u_xlat5 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat3 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat3;
					    u_xlat2 = u_xlat2 * u_xlat3;
					    u_xlat3.xyz = u_xlat2.yyy * unity_LightColor[1].xyz;
					    u_xlat3.xyz = unity_LightColor[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
					    u_xlat2.xyz = unity_LightColor[2].xyz * u_xlat2.zzz + u_xlat3.xyz;
					    u_xlat2.xyz = unity_LightColor[3].xyz * u_xlat2.www + u_xlat2.xyz;
					    u_xlat1.w = 1.0;
					    u_xlat3.x = dot(unity_SHAr, u_xlat1);
					    u_xlat3.y = dot(unity_SHAg, u_xlat1);
					    u_xlat3.z = dot(unity_SHAb, u_xlat1);
					    u_xlat4 = u_xlat1.yzzx * u_xlat1.xyzz;
					    u_xlat5.x = dot(unity_SHBr, u_xlat4);
					    u_xlat5.y = dot(unity_SHBg, u_xlat4);
					    u_xlat5.z = dot(unity_SHBb, u_xlat4);
					    u_xlat18 = u_xlat1.y * u_xlat1.y;
					    u_xlat18 = u_xlat1.x * u_xlat1.x + (-u_xlat18);
					    u_xlat4.xyz = unity_SHC.xyz * vec3(u_xlat18) + u_xlat5.xyz;
					    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat3.xyz = log2(u_xlat3.xyz);
					    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat3.xyz = exp2(u_xlat3.xyz);
					    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD2.xyz = u_xlat2.xyz + u_xlat3.xyz;
					    vs_TEXCOORD0.xyz = u_xlat1.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[4];
						vec4 _ProjectionParams;
						vec4 unused_1_3[3];
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
						vec4 unused_3_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					out vec3 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					float u_xlat7;
					float u_xlat8;
					float u_xlat9;
					float u_xlat14;
					int u_xlati15;
					float u_xlat16;
					float u_xlat21;
					float u_xlat22;
					bool u_xlatb22;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat14 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat21 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat8 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat22 = u_xlat14 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat22 = 6.28318024 / u_xlat22;
					        u_xlat2.x = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat9 = u_xlat22 * 9.81000042;
					        u_xlat9 = sqrt(u_xlat9);
					        u_xlat2.x = u_xlat9 * u_xlat2.x;
					        u_xlat9 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3.x = sin(u_xlat9);
					        u_xlat4.x = cos(u_xlat9);
					        u_xlat9 = u_xlat21 / u_xlat22;
					        u_xlat8 = u_xlat8 + u_xlat9;
					        u_xlat16 = u_xlat0.y * u_xlat3.x;
					        u_xlat16 = u_xlat4.x * u_xlat0.x + u_xlat16;
					        u_xlat2.x = u_xlat2.x * _Time.y;
					        u_xlat22 = u_xlat22 * u_xlat16 + (-u_xlat2.x);
					        u_xlat22 = sin(u_xlat22);
					        u_xlat1.x = u_xlat9 * u_xlat22 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat7 = u_xlat1.x / u_xlat8;
					    u_xlat7 = u_xlat7 + 1.0;
					    u_xlat7 = u_xlat7 * 0.5;
					    u_xlat7 = u_xlat7 * u_xlat7;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat7) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
					    u_xlat3 = (-u_xlat0.xxxx) + unity_4LightPosX0;
					    u_xlat4 = (-u_xlat0.yyyy) + unity_4LightPosY0;
					    u_xlat5 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
					    u_xlat6 = u_xlat4 * u_xlat4;
					    u_xlat6 = u_xlat3 * u_xlat3 + u_xlat6;
					    u_xlat6 = u_xlat5 * u_xlat5 + u_xlat6;
					    u_xlat6 = max(u_xlat6, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat4 = u_xlat2.yyyy * u_xlat4;
					    u_xlat3 = u_xlat3 * u_xlat2.xxxx + u_xlat4;
					    u_xlat3 = u_xlat5 * u_xlat2.zzzz + u_xlat3;
					    u_xlat4 = inversesqrt(u_xlat6);
					    u_xlat3 = u_xlat3 * u_xlat4;
					    u_xlat3 = max(u_xlat3, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat4 = u_xlat6 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat4 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat4;
					    u_xlat3 = u_xlat3 * u_xlat4;
					    u_xlat4.xyz = u_xlat3.yyy * unity_LightColor[1].xyz;
					    u_xlat4.xyz = unity_LightColor[0].xyz * u_xlat3.xxx + u_xlat4.xyz;
					    u_xlat3.xyz = unity_LightColor[2].xyz * u_xlat3.zzz + u_xlat4.xyz;
					    u_xlat3.xyz = unity_LightColor[3].xyz * u_xlat3.www + u_xlat3.xyz;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat21 = u_xlat2.y * u_xlat2.y;
					    u_xlat21 = u_xlat2.x * u_xlat2.x + (-u_xlat21);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat21) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD2.xyz = u_xlat3.xyz + u_xlat4.xyz;
					    u_xlat3.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    u_xlat21 = u_xlat1.y * _ProjectionParams.x;
					    u_xlat3.w = u_xlat21 * 0.5;
					    vs_TEXCOORD3.xy = u_xlat3.zz + u_xlat3.xw;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD3.zw = u_xlat1.zw;
					    vs_TEXCOORD0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[4];
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
						vec4 unused_3_4[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_4_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD4;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2.x = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2.x = u_xlat7 * u_xlat2.x;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3.x = sin(u_xlat7);
					        u_xlat4.x = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3.x;
					        u_xlat12 = u_xlat4.x * u_xlat0.x + u_xlat12;
					        u_xlat2.x = u_xlat2.x * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2.x);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat3 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat3);
					    u_xlat4.y = dot(unity_SHBg, u_xlat3);
					    u_xlat4.z = dot(unity_SHBb, u_xlat3);
					    u_xlat15 = u_xlat0.y * u_xlat0.y;
					    u_xlat15 = u_xlat0.x * u_xlat0.x + (-u_xlat15);
					    u_xlat3.xyz = unity_SHC.xyz * vec3(u_xlat15) + u_xlat4.xyz;
					    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat2.xyz = log2(u_xlat2.xyz);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat2.xyz = exp2(u_xlat2.xyz);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat15 = u_xlat1.z / _ProjectionParams.y;
					    u_xlat15 = (-u_xlat15) + 1.0;
					    u_xlat15 = u_xlat15 * _ProjectionParams.z;
					    u_xlat15 = max(u_xlat15, 0.0);
					    vs_TEXCOORD4 = u_xlat15 * unity_FogParams.z + unity_FogParams.w;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD0.xyz = u_xlat0.xyz;
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
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
						vec4 unused_3_4[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_4_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD4;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec3 vs_TEXCOORD2;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2.x = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2.x = u_xlat7 * u_xlat2.x;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3.x = sin(u_xlat7);
					        u_xlat4.x = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3.x;
					        u_xlat12 = u_xlat4.x * u_xlat0.x + u_xlat12;
					        u_xlat2.x = u_xlat2.x * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2.x);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat3 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat3);
					    u_xlat4.y = dot(unity_SHBg, u_xlat3);
					    u_xlat4.z = dot(unity_SHBb, u_xlat3);
					    u_xlat15 = u_xlat0.y * u_xlat0.y;
					    u_xlat15 = u_xlat0.x * u_xlat0.x + (-u_xlat15);
					    u_xlat3.xyz = unity_SHC.xyz * vec3(u_xlat15) + u_xlat4.xyz;
					    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat2.xyz = log2(u_xlat2.xyz);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat2.xyz = exp2(u_xlat2.xyz);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD4 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD0.xyz = u_xlat0.xyz;
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[4];
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
						vec4 unused_3_4[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_4_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD4;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2.x = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2.x = u_xlat7 * u_xlat2.x;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3.x = sin(u_xlat7);
					        u_xlat4.x = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3.x;
					        u_xlat12 = u_xlat4.x * u_xlat0.x + u_xlat12;
					        u_xlat2.x = u_xlat2.x * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2.x);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat3 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat3);
					    u_xlat4.y = dot(unity_SHBg, u_xlat3);
					    u_xlat4.z = dot(unity_SHBb, u_xlat3);
					    u_xlat15 = u_xlat0.y * u_xlat0.y;
					    u_xlat15 = u_xlat0.x * u_xlat0.x + (-u_xlat15);
					    u_xlat3.xyz = unity_SHC.xyz * vec3(u_xlat15) + u_xlat4.xyz;
					    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
					    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat2.xyz = log2(u_xlat2.xyz);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat2.xyz = exp2(u_xlat2.xyz);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat2.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    u_xlat15 = u_xlat1.y * _ProjectionParams.x;
					    u_xlat2.w = u_xlat15 * 0.5;
					    vs_TEXCOORD3.xy = u_xlat2.zz + u_xlat2.xw;
					    u_xlat15 = u_xlat1.z / _ProjectionParams.y;
					    u_xlat15 = (-u_xlat15) + 1.0;
					    u_xlat15 = u_xlat15 * _ProjectionParams.z;
					    u_xlat15 = max(u_xlat15, 0.0);
					    vs_TEXCOORD4 = u_xlat15 * unity_FogParams.z + unity_FogParams.w;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD0.xyz = u_xlat0.xyz;
					    vs_TEXCOORD3.zw = u_xlat1.zw;
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[4];
						vec4 _ProjectionParams;
						vec4 unused_1_3[3];
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
						vec4 unused_3_4[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_4_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD4;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec3 vs_TEXCOORD2;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					float u_xlat7;
					float u_xlat8;
					float u_xlat9;
					float u_xlat14;
					int u_xlati15;
					float u_xlat16;
					float u_xlat21;
					float u_xlat22;
					bool u_xlatb22;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat14 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat21 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat8 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat22 = u_xlat14 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat22 = 6.28318024 / u_xlat22;
					        u_xlat2.x = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat9 = u_xlat22 * 9.81000042;
					        u_xlat9 = sqrt(u_xlat9);
					        u_xlat2.x = u_xlat9 * u_xlat2.x;
					        u_xlat9 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3.x = sin(u_xlat9);
					        u_xlat4.x = cos(u_xlat9);
					        u_xlat9 = u_xlat21 / u_xlat22;
					        u_xlat8 = u_xlat8 + u_xlat9;
					        u_xlat16 = u_xlat0.y * u_xlat3.x;
					        u_xlat16 = u_xlat4.x * u_xlat0.x + u_xlat16;
					        u_xlat2.x = u_xlat2.x * _Time.y;
					        u_xlat22 = u_xlat22 * u_xlat16 + (-u_xlat2.x);
					        u_xlat22 = sin(u_xlat22);
					        u_xlat1.x = u_xlat9 * u_xlat22 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat7 = u_xlat1.x / u_xlat8;
					    u_xlat7 = u_xlat7 + 1.0;
					    u_xlat7 = u_xlat7 * 0.5;
					    u_xlat7 = u_xlat7 * u_xlat7;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat7) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
					    u_xlat3 = (-u_xlat0.xxxx) + unity_4LightPosX0;
					    u_xlat4 = (-u_xlat0.yyyy) + unity_4LightPosY0;
					    u_xlat5 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
					    u_xlat6 = u_xlat4 * u_xlat4;
					    u_xlat6 = u_xlat3 * u_xlat3 + u_xlat6;
					    u_xlat6 = u_xlat5 * u_xlat5 + u_xlat6;
					    u_xlat6 = max(u_xlat6, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat4 = u_xlat2.yyyy * u_xlat4;
					    u_xlat3 = u_xlat3 * u_xlat2.xxxx + u_xlat4;
					    u_xlat3 = u_xlat5 * u_xlat2.zzzz + u_xlat3;
					    u_xlat4 = inversesqrt(u_xlat6);
					    u_xlat3 = u_xlat3 * u_xlat4;
					    u_xlat3 = max(u_xlat3, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat4 = u_xlat6 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat4 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat4;
					    u_xlat3 = u_xlat3 * u_xlat4;
					    u_xlat4.xyz = u_xlat3.yyy * unity_LightColor[1].xyz;
					    u_xlat4.xyz = unity_LightColor[0].xyz * u_xlat3.xxx + u_xlat4.xyz;
					    u_xlat3.xyz = unity_LightColor[2].xyz * u_xlat3.zzz + u_xlat4.xyz;
					    u_xlat3.xyz = unity_LightColor[3].xyz * u_xlat3.www + u_xlat3.xyz;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat21 = u_xlat2.y * u_xlat2.y;
					    u_xlat21 = u_xlat2.x * u_xlat2.x + (-u_xlat21);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat21) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD2.xyz = u_xlat3.xyz + u_xlat4.xyz;
					    u_xlat21 = u_xlat1.z / _ProjectionParams.y;
					    u_xlat21 = (-u_xlat21) + 1.0;
					    u_xlat21 = u_xlat21 * _ProjectionParams.z;
					    u_xlat21 = max(u_xlat21, 0.0);
					    vs_TEXCOORD4 = u_xlat21 * unity_FogParams.z + unity_FogParams.w;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
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
						vec4 unused_3_4[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_4_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD4;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec3 vs_TEXCOORD2;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					float u_xlat7;
					float u_xlat8;
					float u_xlat9;
					float u_xlat14;
					int u_xlati15;
					float u_xlat16;
					float u_xlat21;
					float u_xlat22;
					bool u_xlatb22;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat14 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat21 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat8 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat22 = u_xlat14 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat22 = 6.28318024 / u_xlat22;
					        u_xlat2.x = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat9 = u_xlat22 * 9.81000042;
					        u_xlat9 = sqrt(u_xlat9);
					        u_xlat2.x = u_xlat9 * u_xlat2.x;
					        u_xlat9 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3.x = sin(u_xlat9);
					        u_xlat4.x = cos(u_xlat9);
					        u_xlat9 = u_xlat21 / u_xlat22;
					        u_xlat8 = u_xlat8 + u_xlat9;
					        u_xlat16 = u_xlat0.y * u_xlat3.x;
					        u_xlat16 = u_xlat4.x * u_xlat0.x + u_xlat16;
					        u_xlat2.x = u_xlat2.x * _Time.y;
					        u_xlat22 = u_xlat22 * u_xlat16 + (-u_xlat2.x);
					        u_xlat22 = sin(u_xlat22);
					        u_xlat1.x = u_xlat9 * u_xlat22 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat7 = u_xlat1.x / u_xlat8;
					    u_xlat7 = u_xlat7 + 1.0;
					    u_xlat7 = u_xlat7 * 0.5;
					    u_xlat7 = u_xlat7 * u_xlat7;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat7) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
					    u_xlat3 = (-u_xlat0.xxxx) + unity_4LightPosX0;
					    u_xlat4 = (-u_xlat0.yyyy) + unity_4LightPosY0;
					    u_xlat5 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
					    u_xlat6 = u_xlat4 * u_xlat4;
					    u_xlat6 = u_xlat3 * u_xlat3 + u_xlat6;
					    u_xlat6 = u_xlat5 * u_xlat5 + u_xlat6;
					    u_xlat6 = max(u_xlat6, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat4 = u_xlat2.yyyy * u_xlat4;
					    u_xlat3 = u_xlat3 * u_xlat2.xxxx + u_xlat4;
					    u_xlat3 = u_xlat5 * u_xlat2.zzzz + u_xlat3;
					    u_xlat4 = inversesqrt(u_xlat6);
					    u_xlat3 = u_xlat3 * u_xlat4;
					    u_xlat3 = max(u_xlat3, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat4 = u_xlat6 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat4 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat4;
					    u_xlat3 = u_xlat3 * u_xlat4;
					    u_xlat4.xyz = u_xlat3.yyy * unity_LightColor[1].xyz;
					    u_xlat4.xyz = unity_LightColor[0].xyz * u_xlat3.xxx + u_xlat4.xyz;
					    u_xlat3.xyz = unity_LightColor[2].xyz * u_xlat3.zzz + u_xlat4.xyz;
					    u_xlat3.xyz = unity_LightColor[3].xyz * u_xlat3.www + u_xlat3.xyz;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat21 = u_xlat2.y * u_xlat2.y;
					    u_xlat21 = u_xlat2.x * u_xlat2.x + (-u_xlat21);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat21) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD2.xyz = u_xlat3.xyz + u_xlat4.xyz;
					    vs_TEXCOORD4 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[4];
						vec4 _ProjectionParams;
						vec4 unused_1_3[3];
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
						vec4 unused_3_4[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_4_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD4;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec3 vs_TEXCOORD2;
					out vec4 vs_TEXCOORD3;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					float u_xlat7;
					float u_xlat8;
					float u_xlat9;
					float u_xlat14;
					int u_xlati15;
					float u_xlat16;
					float u_xlat21;
					float u_xlat22;
					bool u_xlatb22;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat14 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat21 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat8 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat22 = u_xlat14 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat22 = 6.28318024 / u_xlat22;
					        u_xlat2.x = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat9 = u_xlat22 * 9.81000042;
					        u_xlat9 = sqrt(u_xlat9);
					        u_xlat2.x = u_xlat9 * u_xlat2.x;
					        u_xlat9 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3.x = sin(u_xlat9);
					        u_xlat4.x = cos(u_xlat9);
					        u_xlat9 = u_xlat21 / u_xlat22;
					        u_xlat8 = u_xlat8 + u_xlat9;
					        u_xlat16 = u_xlat0.y * u_xlat3.x;
					        u_xlat16 = u_xlat4.x * u_xlat0.x + u_xlat16;
					        u_xlat2.x = u_xlat2.x * _Time.y;
					        u_xlat22 = u_xlat22 * u_xlat16 + (-u_xlat2.x);
					        u_xlat22 = sin(u_xlat22);
					        u_xlat1.x = u_xlat9 * u_xlat22 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat7 = u_xlat1.x / u_xlat8;
					    u_xlat7 = u_xlat7 + 1.0;
					    u_xlat7 = u_xlat7 * 0.5;
					    u_xlat7 = u_xlat7 * u_xlat7;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat7) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat2.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat2.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat2.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
					    u_xlat21 = inversesqrt(u_xlat21);
					    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
					    u_xlat3 = (-u_xlat0.xxxx) + unity_4LightPosX0;
					    u_xlat4 = (-u_xlat0.yyyy) + unity_4LightPosY0;
					    u_xlat5 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
					    u_xlat6 = u_xlat4 * u_xlat4;
					    u_xlat6 = u_xlat3 * u_xlat3 + u_xlat6;
					    u_xlat6 = u_xlat5 * u_xlat5 + u_xlat6;
					    u_xlat6 = max(u_xlat6, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
					    u_xlat4 = u_xlat2.yyyy * u_xlat4;
					    u_xlat3 = u_xlat3 * u_xlat2.xxxx + u_xlat4;
					    u_xlat3 = u_xlat5 * u_xlat2.zzzz + u_xlat3;
					    u_xlat4 = inversesqrt(u_xlat6);
					    u_xlat3 = u_xlat3 * u_xlat4;
					    u_xlat3 = max(u_xlat3, vec4(0.0, 0.0, 0.0, 0.0));
					    u_xlat4 = u_xlat6 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
					    u_xlat4 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat4;
					    u_xlat3 = u_xlat3 * u_xlat4;
					    u_xlat4.xyz = u_xlat3.yyy * unity_LightColor[1].xyz;
					    u_xlat4.xyz = unity_LightColor[0].xyz * u_xlat3.xxx + u_xlat4.xyz;
					    u_xlat3.xyz = unity_LightColor[2].xyz * u_xlat3.zzz + u_xlat4.xyz;
					    u_xlat3.xyz = unity_LightColor[3].xyz * u_xlat3.www + u_xlat3.xyz;
					    u_xlat2.w = 1.0;
					    u_xlat4.x = dot(unity_SHAr, u_xlat2);
					    u_xlat4.y = dot(unity_SHAg, u_xlat2);
					    u_xlat4.z = dot(unity_SHAb, u_xlat2);
					    u_xlat5 = u_xlat2.yzzx * u_xlat2.xyzz;
					    u_xlat6.x = dot(unity_SHBr, u_xlat5);
					    u_xlat6.y = dot(unity_SHBg, u_xlat5);
					    u_xlat6.z = dot(unity_SHBb, u_xlat5);
					    u_xlat21 = u_xlat2.y * u_xlat2.y;
					    u_xlat21 = u_xlat2.x * u_xlat2.x + (-u_xlat21);
					    u_xlat5.xyz = unity_SHC.xyz * vec3(u_xlat21) + u_xlat6.xyz;
					    u_xlat4.xyz = u_xlat4.xyz + u_xlat5.xyz;
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat4.xyz = log2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat4.xyz = exp2(u_xlat4.xyz);
					    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD2.xyz = u_xlat3.xyz + u_xlat4.xyz;
					    u_xlat3.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    u_xlat21 = u_xlat1.y * _ProjectionParams.x;
					    u_xlat3.w = u_xlat21 * 0.5;
					    vs_TEXCOORD3.xy = u_xlat3.zz + u_xlat3.xw;
					    u_xlat21 = u_xlat1.z / _ProjectionParams.y;
					    u_xlat21 = (-u_xlat21) + 1.0;
					    u_xlat21 = u_xlat21 * _ProjectionParams.z;
					    u_xlat21 = max(u_xlat21, 0.0);
					    vs_TEXCOORD4 = u_xlat21 * unity_FogParams.z + unity_FogParams.w;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD0.xyz = u_xlat2.xyz;
					    vs_TEXCOORD3.zw = u_xlat1.zw;
					    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
						vec4 unused_0_2[5];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[44];
					};
					uniform  sampler2D _MainTex;
					in  vec3 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					in  vec3 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					void main()
					{
					    u_xlat0 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat0 = max(u_xlat0, 0.0);
					    u_xlat2.xy = abs(vs_TEXCOORD1.xz) * vec2(0.5, 0.5);
					    u_xlat2.xy = fract(u_xlat2.xy);
					    u_xlat1 = texture(_MainTex, u_xlat2.xy);
					    u_xlat2.xyz = u_xlat1.xyz * vs_COLOR0.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * _LightColor0.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vs_TEXCOORD2.xyz;
					    SV_Target0.xyz = u_xlat1.xyz * vec3(u_xlat0) + u_xlat2.xyz;
					    SV_Target0.w = 1.0;
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
						vec4 unused_0_2[5];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[44];
					};
					uniform  sampler2D _MainTex;
					in  vec3 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					in  vec3 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					void main()
					{
					    u_xlat0 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat0 = max(u_xlat0, 0.0);
					    u_xlat2.xy = abs(vs_TEXCOORD1.xz) * vec2(0.5, 0.5);
					    u_xlat2.xy = fract(u_xlat2.xy);
					    u_xlat1 = texture(_MainTex, u_xlat2.xy);
					    u_xlat2.xyz = u_xlat1.xyz * vs_COLOR0.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * _LightColor0.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vs_TEXCOORD2.xyz;
					    SV_Target0.xyz = u_xlat1.xyz * vec3(u_xlat0) + u_xlat2.xyz;
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
						vec4 unused_0_2[5];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[44];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _ShadowMapTexture;
					in  vec3 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
					    u_xlat0 = texture(_ShadowMapTexture, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
					    u_xlat1.xy = abs(vs_TEXCOORD1.xz) * vec2(0.5, 0.5);
					    u_xlat1.xy = fract(u_xlat1.xy);
					    u_xlat1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vs_COLOR0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vs_TEXCOORD2.xyz;
					    u_xlat6 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat6) + u_xlat1.xyz;
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
						vec4 unused_0_2[5];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[44];
					};
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unused_2_1;
					};
					uniform  sampler2D _MainTex;
					in  vec3 vs_TEXCOORD0;
					in  float vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					in  vec3 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat2.xy = abs(vs_TEXCOORD1.xz) * vec2(0.5, 0.5);
					    u_xlat2.xy = fract(u_xlat2.xy);
					    u_xlat1 = texture(_MainTex, u_xlat2.xy);
					    u_xlat2.xyz = u_xlat1.xyz * vs_COLOR0.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * _LightColor0.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vs_TEXCOORD2.xyz;
					    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
					    u_xlat6 = vs_TEXCOORD4;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
					    SV_Target0.w = 1.0;
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
						vec4 unused_0_2[5];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[44];
					};
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unused_2_1;
					};
					uniform  sampler2D _MainTex;
					in  vec3 vs_TEXCOORD0;
					in  float vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					in  vec3 vs_TEXCOORD2;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					float u_xlat6;
					void main()
					{
					    u_xlat0.x = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    u_xlat2.xy = abs(vs_TEXCOORD1.xz) * vec2(0.5, 0.5);
					    u_xlat2.xy = fract(u_xlat2.xy);
					    u_xlat1 = texture(_MainTex, u_xlat2.xy);
					    u_xlat2.xyz = u_xlat1.xyz * vs_COLOR0.xyz;
					    u_xlat1.xyz = u_xlat2.xyz * _LightColor0.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vs_TEXCOORD2.xyz;
					    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
					    u_xlat6 = vs_TEXCOORD4;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
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
						vec4 unused_0_2[5];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[44];
					};
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unused_2_1;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _ShadowMapTexture;
					in  vec3 vs_TEXCOORD0;
					in  float vs_TEXCOORD4;
					in  vec3 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					in  vec3 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
					    u_xlat0 = texture(_ShadowMapTexture, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
					    u_xlat1.xy = abs(vs_TEXCOORD1.xz) * vec2(0.5, 0.5);
					    u_xlat1.xy = fract(u_xlat1.xy);
					    u_xlat1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vs_COLOR0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz * vs_TEXCOORD2.xyz;
					    u_xlat6 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat6) + u_xlat1.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + (-unity_FogColor.xyz);
					    u_xlat6 = vs_TEXCOORD4;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
			}
		}
		Pass {
			Name "FORWARD"
			LOD 200
			Tags { "LIGHTMODE" = "ForwardAdd" "QUEUE" = "Background" "RenderType" = "Opaque" }
			Blend One One, One One
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			Lighting On
			GpuProgramID 73364
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
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
					out vec3 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					float u_xlat3;
					float u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2 = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2 = u_xlat7 * u_xlat2;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3 = sin(u_xlat7);
					        u_xlat4 = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3;
					        u_xlat12 = u_xlat4 * u_xlat0.x + u_xlat12;
					        u_xlat2 = u_xlat2 * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    gl_Position = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    vs_TEXCOORD0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					Keywords { "POINT" }
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
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
					out vec3 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					float u_xlat3;
					float u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2 = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2 = u_xlat7 * u_xlat2;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3 = sin(u_xlat7);
					        u_xlat4 = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3;
					        u_xlat12 = u_xlat4 * u_xlat0.x + u_xlat12;
					        u_xlat2 = u_xlat2 * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    gl_Position = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    vs_TEXCOORD0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
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
					out vec3 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					float u_xlat3;
					float u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2 = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2 = u_xlat7 * u_xlat2;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3 = sin(u_xlat7);
					        u_xlat4 = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3;
					        u_xlat12 = u_xlat4 * u_xlat0.x + u_xlat12;
					        u_xlat2 = u_xlat2 * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    gl_Position = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    vs_TEXCOORD0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
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
					out vec3 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					float u_xlat3;
					float u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2 = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2 = u_xlat7 * u_xlat2;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3 = sin(u_xlat7);
					        u_xlat4 = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3;
					        u_xlat12 = u_xlat4 * u_xlat0.x + u_xlat12;
					        u_xlat2 = u_xlat2 * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    gl_Position = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    vs_TEXCOORD0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
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
					out vec3 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					float u_xlat3;
					float u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2 = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2 = u_xlat7 * u_xlat2;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3 = sin(u_xlat7);
					        u_xlat4 = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3;
					        u_xlat12 = u_xlat4 * u_xlat0.x + u_xlat12;
					        u_xlat2 = u_xlat2 * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    gl_Position = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    vs_TEXCOORD0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					Keywords { "SPOT" }
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
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
					out vec3 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					float u_xlat3;
					float u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2 = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2 = u_xlat7 * u_xlat2;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3 = sin(u_xlat7);
					        u_xlat4 = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3;
					        u_xlat12 = u_xlat4 * u_xlat0.x + u_xlat12;
					        u_xlat2 = u_xlat2 * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    gl_Position = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    vs_TEXCOORD0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
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
					out vec3 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					float u_xlat3;
					float u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2 = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2 = u_xlat7 * u_xlat2;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3 = sin(u_xlat7);
					        u_xlat4 = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3;
					        u_xlat12 = u_xlat4 * u_xlat0.x + u_xlat12;
					        u_xlat2 = u_xlat2 * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    gl_Position = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    vs_TEXCOORD0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					Keywords { "POINT_COOKIE" }
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
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
					out vec3 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					float u_xlat3;
					float u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2 = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2 = u_xlat7 * u_xlat2;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3 = sin(u_xlat7);
					        u_xlat4 = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3;
					        u_xlat12 = u_xlat4 * u_xlat0.x + u_xlat12;
					        u_xlat2 = u_xlat2 * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    gl_Position = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    vs_TEXCOORD0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
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
					out vec3 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					float u_xlat3;
					float u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2 = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2 = u_xlat7 * u_xlat2;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3 = sin(u_xlat7);
					        u_xlat4 = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3;
					        u_xlat12 = u_xlat4 * u_xlat0.x + u_xlat12;
					        u_xlat2 = u_xlat2 * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    gl_Position = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    vs_TEXCOORD0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					Keywords { "DIRECTIONAL_COOKIE" }
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
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
					out vec3 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					float u_xlat3;
					float u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2 = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2 = u_xlat7 * u_xlat2;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3 = sin(u_xlat7);
					        u_xlat4 = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3;
					        u_xlat12 = u_xlat4 * u_xlat0.x + u_xlat12;
					        u_xlat2 = u_xlat2 * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    gl_Position = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    vs_TEXCOORD0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[4];
						vec4 _ProjectionParams;
						vec4 unused_1_3[3];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_2_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_4[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_3_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD3;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					float u_xlat3;
					float u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2 = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2 = u_xlat7 * u_xlat2;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3 = sin(u_xlat7);
					        u_xlat4 = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3;
					        u_xlat12 = u_xlat4 * u_xlat0.x + u_xlat12;
					        u_xlat2 = u_xlat2 * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    vs_TEXCOORD0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    u_xlat0.x = u_xlat1.z / _ProjectionParams.y;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.z;
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    vs_TEXCOORD3 = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
					    gl_Position = u_xlat1;
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					Keywords { "POINT" "FOG_LINEAR" }
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_2_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_4[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_3_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD3;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					float u_xlat3;
					float u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2 = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2 = u_xlat7 * u_xlat2;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3 = sin(u_xlat7);
					        u_xlat4 = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3;
					        u_xlat12 = u_xlat4 * u_xlat0.x + u_xlat12;
					        u_xlat2 = u_xlat2 * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    vs_TEXCOORD0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    vs_TEXCOORD3 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
					    gl_Position = u_xlat1;
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[4];
						vec4 _ProjectionParams;
						vec4 unused_1_3[3];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_2_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_4[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_3_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD3;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					float u_xlat3;
					float u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2 = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2 = u_xlat7 * u_xlat2;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3 = sin(u_xlat7);
					        u_xlat4 = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3;
					        u_xlat12 = u_xlat4 * u_xlat0.x + u_xlat12;
					        u_xlat2 = u_xlat2 * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    vs_TEXCOORD0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    u_xlat0.x = u_xlat1.z / _ProjectionParams.y;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.z;
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    vs_TEXCOORD3 = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
					    gl_Position = u_xlat1;
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_2_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_4[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_3_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD3;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					float u_xlat3;
					float u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2 = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2 = u_xlat7 * u_xlat2;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3 = sin(u_xlat7);
					        u_xlat4 = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3;
					        u_xlat12 = u_xlat4 * u_xlat0.x + u_xlat12;
					        u_xlat2 = u_xlat2 * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    vs_TEXCOORD0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    vs_TEXCOORD3 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
					    gl_Position = u_xlat1;
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[4];
						vec4 _ProjectionParams;
						vec4 unused_1_3[3];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_2_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_4[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_3_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD3;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					float u_xlat3;
					float u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2 = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2 = u_xlat7 * u_xlat2;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3 = sin(u_xlat7);
					        u_xlat4 = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3;
					        u_xlat12 = u_xlat4 * u_xlat0.x + u_xlat12;
					        u_xlat2 = u_xlat2 * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    vs_TEXCOORD0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    u_xlat0.x = u_xlat1.z / _ProjectionParams.y;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.z;
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    vs_TEXCOORD3 = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
					    gl_Position = u_xlat1;
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					Keywords { "SPOT" "FOG_LINEAR" }
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_2_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_4[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_3_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD3;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					float u_xlat3;
					float u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2 = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2 = u_xlat7 * u_xlat2;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3 = sin(u_xlat7);
					        u_xlat4 = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3;
					        u_xlat12 = u_xlat4 * u_xlat0.x + u_xlat12;
					        u_xlat2 = u_xlat2 * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    vs_TEXCOORD0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    vs_TEXCOORD3 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
					    gl_Position = u_xlat1;
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[4];
						vec4 _ProjectionParams;
						vec4 unused_1_3[3];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_2_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_4[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_3_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD3;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					float u_xlat3;
					float u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2 = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2 = u_xlat7 * u_xlat2;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3 = sin(u_xlat7);
					        u_xlat4 = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3;
					        u_xlat12 = u_xlat4 * u_xlat0.x + u_xlat12;
					        u_xlat2 = u_xlat2 * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    vs_TEXCOORD0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    u_xlat0.x = u_xlat1.z / _ProjectionParams.y;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.z;
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    vs_TEXCOORD3 = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
					    gl_Position = u_xlat1;
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					Keywords { "POINT_COOKIE" "FOG_LINEAR" }
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_2_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_4[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_3_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD3;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					float u_xlat3;
					float u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2 = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2 = u_xlat7 * u_xlat2;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3 = sin(u_xlat7);
					        u_xlat4 = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3;
					        u_xlat12 = u_xlat4 * u_xlat0.x + u_xlat12;
					        u_xlat2 = u_xlat2 * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    vs_TEXCOORD0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    vs_TEXCOORD3 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
					    gl_Position = u_xlat1;
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[4];
						vec4 _ProjectionParams;
						vec4 unused_1_3[3];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_2_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_4[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_3_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD3;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					float u_xlat3;
					float u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2 = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2 = u_xlat7 * u_xlat2;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3 = sin(u_xlat7);
					        u_xlat4 = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3;
					        u_xlat12 = u_xlat4 * u_xlat0.x + u_xlat12;
					        u_xlat2 = u_xlat2 * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    vs_TEXCOORD0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    u_xlat0.x = u_xlat1.z / _ProjectionParams.y;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.z;
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    vs_TEXCOORD3 = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
					    gl_Position = u_xlat1;
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" }
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[8];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_2_1[8];
						mat4x4 unity_ObjectToWorld;
						mat4x4 unity_WorldToObject;
						vec4 unused_2_4[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_3_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD3;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					float u_xlat3;
					float u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2 = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2 = u_xlat7 * u_xlat2;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3 = sin(u_xlat7);
					        u_xlat4 = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3;
					        u_xlat12 = u_xlat4 * u_xlat0.x + u_xlat12;
					        u_xlat2 = u_xlat2 * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    vs_TEXCOORD0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    vs_TEXCOORD3 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
					    gl_Position = u_xlat1;
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
						vec4 unused_0_4[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[44];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _LightTexture0;
					in  vec3 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD1.yyy * unity_WorldToLight[1].xyz;
					    u_xlat0.xyz = unity_WorldToLight[0].xyz * vs_TEXCOORD1.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToLight[2].xyz * vs_TEXCOORD1.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + unity_WorldToLight[3].xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0 = texture(_LightTexture0, u_xlat0.xx);
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
					    u_xlat1.xy = abs(vs_TEXCOORD1.xz) * vec2(0.5, 0.5);
					    u_xlat1.xy = fract(u_xlat1.xy);
					    u_xlat1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vs_COLOR0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz;
					    u_xlat6 = dot(vs_TEXCOORD0.xyz, u_xlat1.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					Keywords { "POINT" }
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
						mat4x4 unity_WorldToLight;
						vec4 unused_0_4[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[44];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _LightTexture0;
					in  vec3 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD1.yyy * unity_WorldToLight[1].xyz;
					    u_xlat0.xyz = unity_WorldToLight[0].xyz * vs_TEXCOORD1.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToLight[2].xyz * vs_TEXCOORD1.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + unity_WorldToLight[3].xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0 = texture(_LightTexture0, u_xlat0.xx);
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
					    u_xlat1.xy = abs(vs_TEXCOORD1.xz) * vec2(0.5, 0.5);
					    u_xlat1.xy = fract(u_xlat1.xy);
					    u_xlat1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vs_COLOR0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz;
					    u_xlat6 = dot(vs_TEXCOORD0.xyz, u_xlat1.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
						vec4 unused_0_2[5];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[44];
					};
					uniform  sampler2D _MainTex;
					in  vec3 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0.xy = abs(vs_TEXCOORD1.xz) * vec2(0.5, 0.5);
					    u_xlat0.xy = fract(u_xlat0.xy);
					    u_xlat0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    u_xlat3 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3 = max(u_xlat3, 0.0);
					    SV_Target0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    SV_Target0.w = 1.0;
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
						vec4 unused_0_2[5];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[44];
					};
					uniform  sampler2D _MainTex;
					in  vec3 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0.xy = abs(vs_TEXCOORD1.xz) * vec2(0.5, 0.5);
					    u_xlat0.xy = fract(u_xlat0.xy);
					    u_xlat0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    u_xlat3 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3 = max(u_xlat3, 0.0);
					    SV_Target0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
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
						vec4 unused_0_4[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[44];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					in  vec3 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat9;
					bool u_xlatb9;
					void main()
					{
					    u_xlat0 = vs_TEXCOORD1.yyyy * unity_WorldToLight[1];
					    u_xlat0 = unity_WorldToLight[0] * vs_TEXCOORD1.xxxx + u_xlat0;
					    u_xlat0 = unity_WorldToLight[2] * vs_TEXCOORD1.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_WorldToLight[3];
					    u_xlat1.xy = u_xlat0.xy / u_xlat0.ww;
					    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat1 = texture(_LightTexture0, u_xlat1.xy);
					    u_xlatb9 = 0.0<u_xlat0.z;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat2 = texture(_LightTextureB0, u_xlat0.xx);
					    u_xlat0.x = u_xlatb9 ? 1.0 : float(0.0);
					    u_xlat0.x = u_xlat1.w * u_xlat0.x;
					    u_xlat0.x = u_xlat2.x * u_xlat0.x;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
					    u_xlat1.xy = abs(vs_TEXCOORD1.xz) * vec2(0.5, 0.5);
					    u_xlat1.xy = fract(u_xlat1.xy);
					    u_xlat1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vs_COLOR0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
					    u_xlat9 = dot(vs_TEXCOORD0.xyz, u_xlat1.xyz);
					    u_xlat9 = max(u_xlat9, 0.0);
					    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					Keywords { "SPOT" }
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
						mat4x4 unity_WorldToLight;
						vec4 unused_0_4[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[44];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					in  vec3 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat9;
					bool u_xlatb9;
					void main()
					{
					    u_xlat0 = vs_TEXCOORD1.yyyy * unity_WorldToLight[1];
					    u_xlat0 = unity_WorldToLight[0] * vs_TEXCOORD1.xxxx + u_xlat0;
					    u_xlat0 = unity_WorldToLight[2] * vs_TEXCOORD1.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_WorldToLight[3];
					    u_xlat1.xy = u_xlat0.xy / u_xlat0.ww;
					    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat1 = texture(_LightTexture0, u_xlat1.xy);
					    u_xlatb9 = 0.0<u_xlat0.z;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat2 = texture(_LightTextureB0, u_xlat0.xx);
					    u_xlat0.x = u_xlatb9 ? 1.0 : float(0.0);
					    u_xlat0.x = u_xlat1.w * u_xlat0.x;
					    u_xlat0.x = u_xlat2.x * u_xlat0.x;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
					    u_xlat1.xy = abs(vs_TEXCOORD1.xz) * vec2(0.5, 0.5);
					    u_xlat1.xy = fract(u_xlat1.xy);
					    u_xlat1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vs_COLOR0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
					    u_xlat9 = dot(vs_TEXCOORD0.xyz, u_xlat1.xyz);
					    u_xlat9 = max(u_xlat9, 0.0);
					    SV_Target0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
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
						vec4 unused_0_4[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[44];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					in  vec3 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD1.yyy * unity_WorldToLight[1].xyz;
					    u_xlat0.xyz = unity_WorldToLight[0].xyz * vs_TEXCOORD1.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToLight[2].xyz * vs_TEXCOORD1.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + unity_WorldToLight[3].xyz;
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat1 = texture(_LightTexture0, u_xlat0.xyz);
					    u_xlat0 = texture(_LightTextureB0, vec2(u_xlat6));
					    u_xlat0.x = u_xlat1.w * u_xlat0.x;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
					    u_xlat1.xy = abs(vs_TEXCOORD1.xz) * vec2(0.5, 0.5);
					    u_xlat1.xy = fract(u_xlat1.xy);
					    u_xlat1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vs_COLOR0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz;
					    u_xlat6 = dot(vs_TEXCOORD0.xyz, u_xlat1.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					Keywords { "POINT_COOKIE" }
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
						mat4x4 unity_WorldToLight;
						vec4 unused_0_4[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[44];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					in  vec3 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD1.yyy * unity_WorldToLight[1].xyz;
					    u_xlat0.xyz = unity_WorldToLight[0].xyz * vs_TEXCOORD1.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToLight[2].xyz * vs_TEXCOORD1.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + unity_WorldToLight[3].xyz;
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat1 = texture(_LightTexture0, u_xlat0.xyz);
					    u_xlat0 = texture(_LightTextureB0, vec2(u_xlat6));
					    u_xlat0.x = u_xlat1.w * u_xlat0.x;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
					    u_xlat1.xy = abs(vs_TEXCOORD1.xz) * vec2(0.5, 0.5);
					    u_xlat1.xy = fract(u_xlat1.xy);
					    u_xlat1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vs_COLOR0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz;
					    u_xlat6 = dot(vs_TEXCOORD0.xyz, u_xlat1.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
						vec4 unused_0_4[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[44];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _LightTexture0;
					in  vec3 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.yy * unity_WorldToLight[1].xy;
					    u_xlat0.xy = unity_WorldToLight[0].xy * vs_TEXCOORD1.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_WorldToLight[2].xy * vs_TEXCOORD1.zz + u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy + unity_WorldToLight[3].xy;
					    u_xlat0 = texture(_LightTexture0, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.www * _LightColor0.xyz;
					    u_xlat1.xy = abs(vs_TEXCOORD1.xz) * vec2(0.5, 0.5);
					    u_xlat1.xy = fract(u_xlat1.xy);
					    u_xlat1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vs_COLOR0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat6 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					Keywords { "DIRECTIONAL_COOKIE" }
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
						mat4x4 unity_WorldToLight;
						vec4 unused_0_4[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[44];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _LightTexture0;
					in  vec3 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.yy * unity_WorldToLight[1].xy;
					    u_xlat0.xy = unity_WorldToLight[0].xy * vs_TEXCOORD1.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_WorldToLight[2].xy * vs_TEXCOORD1.zz + u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy + unity_WorldToLight[3].xy;
					    u_xlat0 = texture(_LightTexture0, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.www * _LightColor0.xyz;
					    u_xlat1.xy = abs(vs_TEXCOORD1.xz) * vec2(0.5, 0.5);
					    u_xlat1.xy = fract(u_xlat1.xy);
					    u_xlat1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vs_COLOR0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat6 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
						vec4 unused_0_4[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[44];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _LightTexture0;
					in  vec3 vs_TEXCOORD0;
					in  float vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD1.yyy * unity_WorldToLight[1].xyz;
					    u_xlat0.xyz = unity_WorldToLight[0].xyz * vs_TEXCOORD1.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToLight[2].xyz * vs_TEXCOORD1.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + unity_WorldToLight[3].xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0 = texture(_LightTexture0, u_xlat0.xx);
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
					    u_xlat1.xy = abs(vs_TEXCOORD1.xz) * vec2(0.5, 0.5);
					    u_xlat1.xy = fract(u_xlat1.xy);
					    u_xlat1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vs_COLOR0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz;
					    u_xlat6 = dot(vs_TEXCOORD0.xyz, u_xlat1.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat6 = vs_TEXCOORD3;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat6);
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					Keywords { "POINT" "FOG_LINEAR" }
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
						mat4x4 unity_WorldToLight;
						vec4 unused_0_4[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[44];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _LightTexture0;
					in  vec3 vs_TEXCOORD0;
					in  float vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD1.yyy * unity_WorldToLight[1].xyz;
					    u_xlat0.xyz = unity_WorldToLight[0].xyz * vs_TEXCOORD1.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToLight[2].xyz * vs_TEXCOORD1.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + unity_WorldToLight[3].xyz;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat0 = texture(_LightTexture0, u_xlat0.xx);
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
					    u_xlat1.xy = abs(vs_TEXCOORD1.xz) * vec2(0.5, 0.5);
					    u_xlat1.xy = fract(u_xlat1.xy);
					    u_xlat1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vs_COLOR0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz;
					    u_xlat6 = dot(vs_TEXCOORD0.xyz, u_xlat1.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat6 = vs_TEXCOORD3;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat6);
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
						vec4 unused_0_2[5];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[44];
					};
					uniform  sampler2D _MainTex;
					in  vec3 vs_TEXCOORD0;
					in  float vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0.xy = abs(vs_TEXCOORD1.xz) * vec2(0.5, 0.5);
					    u_xlat0.xy = fract(u_xlat0.xy);
					    u_xlat0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    u_xlat3 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3 = max(u_xlat3, 0.0);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    u_xlat3 = vs_TEXCOORD3;
					    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat3);
					    SV_Target0.w = 1.0;
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
						vec4 unused_0_2[5];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[44];
					};
					uniform  sampler2D _MainTex;
					in  vec3 vs_TEXCOORD0;
					in  float vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0.xy = abs(vs_TEXCOORD1.xz) * vec2(0.5, 0.5);
					    u_xlat0.xy = fract(u_xlat0.xy);
					    u_xlat0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
					    u_xlat3 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat3 = max(u_xlat3, 0.0);
					    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xyz;
					    u_xlat3 = vs_TEXCOORD3;
					    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat3);
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
						vec4 unused_0_4[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[44];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					in  vec3 vs_TEXCOORD0;
					in  float vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat9;
					bool u_xlatb9;
					void main()
					{
					    u_xlat0 = vs_TEXCOORD1.yyyy * unity_WorldToLight[1];
					    u_xlat0 = unity_WorldToLight[0] * vs_TEXCOORD1.xxxx + u_xlat0;
					    u_xlat0 = unity_WorldToLight[2] * vs_TEXCOORD1.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_WorldToLight[3];
					    u_xlat1.xy = u_xlat0.xy / u_xlat0.ww;
					    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat1 = texture(_LightTexture0, u_xlat1.xy);
					    u_xlatb9 = 0.0<u_xlat0.z;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat2 = texture(_LightTextureB0, u_xlat0.xx);
					    u_xlat0.x = u_xlatb9 ? 1.0 : float(0.0);
					    u_xlat0.x = u_xlat1.w * u_xlat0.x;
					    u_xlat0.x = u_xlat2.x * u_xlat0.x;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
					    u_xlat1.xy = abs(vs_TEXCOORD1.xz) * vec2(0.5, 0.5);
					    u_xlat1.xy = fract(u_xlat1.xy);
					    u_xlat1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vs_COLOR0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
					    u_xlat9 = dot(vs_TEXCOORD0.xyz, u_xlat1.xyz);
					    u_xlat9 = max(u_xlat9, 0.0);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    u_xlat9 = vs_TEXCOORD3;
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat9);
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					Keywords { "SPOT" "FOG_LINEAR" }
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
						mat4x4 unity_WorldToLight;
						vec4 unused_0_4[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[44];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _LightTexture0;
					uniform  sampler2D _LightTextureB0;
					in  vec3 vs_TEXCOORD0;
					in  float vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat9;
					bool u_xlatb9;
					void main()
					{
					    u_xlat0 = vs_TEXCOORD1.yyyy * unity_WorldToLight[1];
					    u_xlat0 = unity_WorldToLight[0] * vs_TEXCOORD1.xxxx + u_xlat0;
					    u_xlat0 = unity_WorldToLight[2] * vs_TEXCOORD1.zzzz + u_xlat0;
					    u_xlat0 = u_xlat0 + unity_WorldToLight[3];
					    u_xlat1.xy = u_xlat0.xy / u_xlat0.ww;
					    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
					    u_xlat1 = texture(_LightTexture0, u_xlat1.xy);
					    u_xlatb9 = 0.0<u_xlat0.z;
					    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat2 = texture(_LightTextureB0, u_xlat0.xx);
					    u_xlat0.x = u_xlatb9 ? 1.0 : float(0.0);
					    u_xlat0.x = u_xlat1.w * u_xlat0.x;
					    u_xlat0.x = u_xlat2.x * u_xlat0.x;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
					    u_xlat1.xy = abs(vs_TEXCOORD1.xz) * vec2(0.5, 0.5);
					    u_xlat1.xy = fract(u_xlat1.xy);
					    u_xlat1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vs_COLOR0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat9 = inversesqrt(u_xlat9);
					    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
					    u_xlat9 = dot(vs_TEXCOORD0.xyz, u_xlat1.xyz);
					    u_xlat9 = max(u_xlat9, 0.0);
					    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
					    u_xlat9 = vs_TEXCOORD3;
					    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat9);
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
						vec4 unused_0_4[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[44];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					in  vec3 vs_TEXCOORD0;
					in  float vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD1.yyy * unity_WorldToLight[1].xyz;
					    u_xlat0.xyz = unity_WorldToLight[0].xyz * vs_TEXCOORD1.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToLight[2].xyz * vs_TEXCOORD1.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + unity_WorldToLight[3].xyz;
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat1 = texture(_LightTexture0, u_xlat0.xyz);
					    u_xlat0 = texture(_LightTextureB0, vec2(u_xlat6));
					    u_xlat0.x = u_xlat1.w * u_xlat0.x;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
					    u_xlat1.xy = abs(vs_TEXCOORD1.xz) * vec2(0.5, 0.5);
					    u_xlat1.xy = fract(u_xlat1.xy);
					    u_xlat1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vs_COLOR0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz;
					    u_xlat6 = dot(vs_TEXCOORD0.xyz, u_xlat1.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat6 = vs_TEXCOORD3;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat6);
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					Keywords { "POINT_COOKIE" "FOG_LINEAR" }
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
						mat4x4 unity_WorldToLight;
						vec4 unused_0_4[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[44];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _LightTextureB0;
					uniform  samplerCube _LightTexture0;
					in  vec3 vs_TEXCOORD0;
					in  float vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xyz = vs_TEXCOORD1.yyy * unity_WorldToLight[1].xyz;
					    u_xlat0.xyz = unity_WorldToLight[0].xyz * vs_TEXCOORD1.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_WorldToLight[2].xyz * vs_TEXCOORD1.zzz + u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + unity_WorldToLight[3].xyz;
					    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat1 = texture(_LightTexture0, u_xlat0.xyz);
					    u_xlat0 = texture(_LightTextureB0, vec2(u_xlat6));
					    u_xlat0.x = u_xlat1.w * u_xlat0.x;
					    u_xlat0.xyz = u_xlat0.xxx * _LightColor0.xyz;
					    u_xlat1.xy = abs(vs_TEXCOORD1.xz) * vec2(0.5, 0.5);
					    u_xlat1.xy = fract(u_xlat1.xy);
					    u_xlat1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vs_COLOR0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceLightPos0.xyz;
					    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat6 = inversesqrt(u_xlat6);
					    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz;
					    u_xlat6 = dot(vs_TEXCOORD0.xyz, u_xlat1.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat6 = vs_TEXCOORD3;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat6);
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
						vec4 unused_0_4[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[44];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _LightTexture0;
					in  vec3 vs_TEXCOORD0;
					in  float vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.yy * unity_WorldToLight[1].xy;
					    u_xlat0.xy = unity_WorldToLight[0].xy * vs_TEXCOORD1.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_WorldToLight[2].xy * vs_TEXCOORD1.zz + u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy + unity_WorldToLight[3].xy;
					    u_xlat0 = texture(_LightTexture0, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.www * _LightColor0.xyz;
					    u_xlat1.xy = abs(vs_TEXCOORD1.xz) * vec2(0.5, 0.5);
					    u_xlat1.xy = fract(u_xlat1.xy);
					    u_xlat1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vs_COLOR0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat6 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat6 = vs_TEXCOORD3;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat6);
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					Keywords { "DIRECTIONAL_COOKIE" "FOG_LINEAR" }
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
						mat4x4 unity_WorldToLight;
						vec4 unused_0_4[4];
					};
					layout(std140) uniform UnityLighting {
						vec4 _WorldSpaceLightPos0;
						vec4 unused_1_1[44];
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _LightTexture0;
					in  vec3 vs_TEXCOORD0;
					in  float vs_TEXCOORD3;
					in  vec3 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.yy * unity_WorldToLight[1].xy;
					    u_xlat0.xy = unity_WorldToLight[0].xy * vs_TEXCOORD1.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_WorldToLight[2].xy * vs_TEXCOORD1.zz + u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy + unity_WorldToLight[3].xy;
					    u_xlat0 = texture(_LightTexture0, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.www * _LightColor0.xyz;
					    u_xlat1.xy = abs(vs_TEXCOORD1.xz) * vec2(0.5, 0.5);
					    u_xlat1.xy = fract(u_xlat1.xy);
					    u_xlat1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vs_COLOR0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    u_xlat6 = dot(vs_TEXCOORD0.xyz, _WorldSpaceLightPos0.xyz);
					    u_xlat6 = max(u_xlat6, 0.0);
					    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
					    u_xlat6 = vs_TEXCOORD3;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = u_xlat0.xyz * vec3(u_xlat6);
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
			}
		}
		Pass {
			Name "PREPASS"
			LOD 200
			Tags { "LIGHTMODE" = "PrePassBase" "QUEUE" = "Background" "RenderType" = "Opaque" }
			ZClip Off
			ZTest Always
			Cull Off
			Lighting On
			GpuProgramID 167473
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						int _Samples;
						vec4 unused_0_2[2];
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
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
					out vec3 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec3 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					float u_xlat3;
					int u_xlati5;
					float u_xlat6;
					float u_xlat8;
					float u_xlat9;
					bool u_xlatb9;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat8 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat12 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat9 = u_xlat8 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat9 = 6.28318024 / u_xlat9;
					        u_xlat13 = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat2 = u_xlat9 * 9.81000042;
					        u_xlat2 = sqrt(u_xlat2);
					        u_xlat13 = u_xlat13 * u_xlat2;
					        u_xlat2 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3 = cos(u_xlat2);
					        u_xlat2 = sin(u_xlat2);
					        u_xlat6 = u_xlat12 / u_xlat9;
					        u_xlat2 = u_xlat0.y * u_xlat2;
					        u_xlat2 = u_xlat3 * u_xlat0.x + u_xlat2;
					        u_xlat13 = u_xlat13 * _Time.y;
					        u_xlat9 = u_xlat9 * u_xlat2 + (-u_xlat13);
					        u_xlat9 = sin(u_xlat9);
					        u_xlat1.x = u_xlat6 * u_xlat9 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    gl_Position = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    vs_TEXCOORD0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						int _Samples;
						vec4 unused_0_2[2];
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
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
					out vec3 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					vec3 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					float u_xlat3;
					int u_xlati5;
					float u_xlat6;
					float u_xlat8;
					float u_xlat9;
					bool u_xlatb9;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat8 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat12 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat9 = u_xlat8 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat9 = 6.28318024 / u_xlat9;
					        u_xlat13 = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat2 = u_xlat9 * 9.81000042;
					        u_xlat2 = sqrt(u_xlat2);
					        u_xlat13 = u_xlat13 * u_xlat2;
					        u_xlat2 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3 = cos(u_xlat2);
					        u_xlat2 = sin(u_xlat2);
					        u_xlat6 = u_xlat12 / u_xlat9;
					        u_xlat2 = u_xlat0.y * u_xlat2;
					        u_xlat2 = u_xlat3 * u_xlat0.x + u_xlat2;
					        u_xlat13 = u_xlat13 * _Time.y;
					        u_xlat9 = u_xlat9 * u_xlat2 + (-u_xlat13);
					        u_xlat9 = sin(u_xlat9);
					        u_xlat1.x = u_xlat6 * u_xlat9 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    gl_Position = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    vs_TEXCOORD0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
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
					
					in  vec3 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0.xyz = vs_TEXCOORD0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					"ps_4_0_level_9_1
					
					#version 330
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					in  vec3 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					void main()
					{
					    SV_Target0.xyz = vs_TEXCOORD0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
			}
		}
		Pass {
			Name "PREPASS"
			LOD 200
			Tags { "LIGHTMODE" = "PrePassFinal" "QUEUE" = "Background" "RenderType" = "Opaque" }
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			Lighting On
			GpuProgramID 215090
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
						vec4 unused_0_8;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[4];
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
						vec4 unused_3_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2.x = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2.x = u_xlat7 * u_xlat2.x;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3.x = sin(u_xlat7);
					        u_xlat4.x = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3.x;
					        u_xlat12 = u_xlat4.x * u_xlat0.x + u_xlat12;
					        u_xlat2.x = u_xlat2.x * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2.x);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    u_xlat5 = u_xlat1.y * _ProjectionParams.x;
					    u_xlat0.w = u_xlat5 * 0.5;
					    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat3 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat3);
					    u_xlat4.y = dot(unity_SHBg, u_xlat3);
					    u_xlat4.z = dot(unity_SHBb, u_xlat3);
					    u_xlat5 = u_xlat0.y * u_xlat0.y;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x + (-u_xlat5);
					    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD3.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    gl_Position = u_xlat1;
					    vs_TEXCOORD1.zw = u_xlat1.zw;
					    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
						vec4 unused_0_8;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[4];
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
						vec4 unused_3_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2.x = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2.x = u_xlat7 * u_xlat2.x;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3.x = sin(u_xlat7);
					        u_xlat4.x = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3.x;
					        u_xlat12 = u_xlat4.x * u_xlat0.x + u_xlat12;
					        u_xlat2.x = u_xlat2.x * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2.x);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    u_xlat5 = u_xlat1.y * _ProjectionParams.x;
					    u_xlat0.w = u_xlat5 * 0.5;
					    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat3 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat3);
					    u_xlat4.y = dot(unity_SHBg, u_xlat3);
					    u_xlat4.z = dot(unity_SHBb, u_xlat3);
					    u_xlat5 = u_xlat0.y * u_xlat0.y;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x + (-u_xlat5);
					    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD3.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    gl_Position = u_xlat1;
					    vs_TEXCOORD1.zw = u_xlat1.zw;
					    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
						vec4 unused_0_8;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[4];
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
						vec4 unused_3_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2.x = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2.x = u_xlat7 * u_xlat2.x;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3.x = sin(u_xlat7);
					        u_xlat4.x = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3.x;
					        u_xlat12 = u_xlat4.x * u_xlat0.x + u_xlat12;
					        u_xlat2.x = u_xlat2.x * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2.x);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    u_xlat5 = u_xlat1.y * _ProjectionParams.x;
					    u_xlat0.w = u_xlat5 * 0.5;
					    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat3 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat3);
					    u_xlat4.y = dot(unity_SHBg, u_xlat3);
					    u_xlat4.z = dot(unity_SHBb, u_xlat3);
					    u_xlat5 = u_xlat0.y * u_xlat0.y;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x + (-u_xlat5);
					    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD3.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    gl_Position = u_xlat1;
					    vs_TEXCOORD1.zw = u_xlat1.zw;
					    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					Keywords { "UNITY_HDR_ON" }
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
						vec4 unused_0_8;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[4];
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
						vec4 unused_3_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2.x = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2.x = u_xlat7 * u_xlat2.x;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3.x = sin(u_xlat7);
					        u_xlat4.x = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3.x;
					        u_xlat12 = u_xlat4.x * u_xlat0.x + u_xlat12;
					        u_xlat2.x = u_xlat2.x * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2.x);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    u_xlat5 = u_xlat1.y * _ProjectionParams.x;
					    u_xlat0.w = u_xlat5 * 0.5;
					    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat3 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat3);
					    u_xlat4.y = dot(unity_SHBg, u_xlat3);
					    u_xlat4.z = dot(unity_SHBb, u_xlat3);
					    u_xlat5 = u_xlat0.y * u_xlat0.y;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x + (-u_xlat5);
					    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD3.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    gl_Position = u_xlat1;
					    vs_TEXCOORD1.zw = u_xlat1.zw;
					    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
						vec4 unused_0_8;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[4];
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
						vec4 unused_3_4[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_4_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD4;
					out vec4 vs_COLOR0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2.x = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2.x = u_xlat7 * u_xlat2.x;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3.x = sin(u_xlat7);
					        u_xlat4.x = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3.x;
					        u_xlat12 = u_xlat4.x * u_xlat0.x + u_xlat12;
					        u_xlat2.x = u_xlat2.x * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2.x);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    u_xlat5 = u_xlat1.y * _ProjectionParams.x;
					    u_xlat0.w = u_xlat5 * 0.5;
					    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat3 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat3);
					    u_xlat4.y = dot(unity_SHBg, u_xlat3);
					    u_xlat4.z = dot(unity_SHBb, u_xlat3);
					    u_xlat5 = u_xlat0.y * u_xlat0.y;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x + (-u_xlat5);
					    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD3.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.x = u_xlat1.z / _ProjectionParams.y;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.z;
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    vs_TEXCOORD4 = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD1.zw = u_xlat1.zw;
					    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					Keywords { "FOG_LINEAR" }
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
						vec4 unused_0_8;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[4];
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
						vec4 unused_3_4[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_4_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD4;
					out vec4 vs_COLOR0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2.x = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2.x = u_xlat7 * u_xlat2.x;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3.x = sin(u_xlat7);
					        u_xlat4.x = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3.x;
					        u_xlat12 = u_xlat4.x * u_xlat0.x + u_xlat12;
					        u_xlat2.x = u_xlat2.x * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2.x);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    u_xlat5 = u_xlat1.y * _ProjectionParams.x;
					    u_xlat0.w = u_xlat5 * 0.5;
					    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat3 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat3);
					    u_xlat4.y = dot(unity_SHBg, u_xlat3);
					    u_xlat4.z = dot(unity_SHBb, u_xlat3);
					    u_xlat5 = u_xlat0.y * u_xlat0.y;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x + (-u_xlat5);
					    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD3.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD4 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD1.zw = u_xlat1.zw;
					    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
						vec4 unused_0_8;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[4];
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
						vec4 unused_3_4[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_4_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD4;
					out vec4 vs_COLOR0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2.x = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2.x = u_xlat7 * u_xlat2.x;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3.x = sin(u_xlat7);
					        u_xlat4.x = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3.x;
					        u_xlat12 = u_xlat4.x * u_xlat0.x + u_xlat12;
					        u_xlat2.x = u_xlat2.x * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2.x);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    u_xlat5 = u_xlat1.y * _ProjectionParams.x;
					    u_xlat0.w = u_xlat5 * 0.5;
					    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat3 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat3);
					    u_xlat4.y = dot(unity_SHBg, u_xlat3);
					    u_xlat4.z = dot(unity_SHBb, u_xlat3);
					    u_xlat5 = u_xlat0.y * u_xlat0.y;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x + (-u_xlat5);
					    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD3.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.x = u_xlat1.z / _ProjectionParams.y;
					    u_xlat0.x = (-u_xlat0.x) + 1.0;
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.z;
					    u_xlat0.x = max(u_xlat0.x, 0.0);
					    vs_TEXCOORD4 = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD1.zw = u_xlat1.zw;
					    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					Keywords { "FOG_LINEAR" "UNITY_HDR_ON" }
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
						vec4 unused_0_8;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[4];
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
						vec4 unused_3_4[2];
					};
					layout(std140) uniform UnityFog {
						vec4 unused_4_0;
						vec4 unity_FogParams;
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					out vec3 vs_TEXCOORD0;
					out float vs_TEXCOORD4;
					out vec4 vs_COLOR0;
					out vec4 vs_TEXCOORD1;
					out vec4 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2.x = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2.x = u_xlat7 * u_xlat2.x;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3.x = sin(u_xlat7);
					        u_xlat4.x = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3.x;
					        u_xlat12 = u_xlat4.x * u_xlat0.x + u_xlat12;
					        u_xlat2.x = u_xlat2.x * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2.x);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    u_xlat1 = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
					    u_xlat5 = u_xlat1.y * _ProjectionParams.x;
					    u_xlat0.w = u_xlat5 * 0.5;
					    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xw;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat2.x = dot(unity_SHAr, u_xlat0);
					    u_xlat2.y = dot(unity_SHAg, u_xlat0);
					    u_xlat2.z = dot(unity_SHAb, u_xlat0);
					    u_xlat3 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat4.x = dot(unity_SHBr, u_xlat3);
					    u_xlat4.y = dot(unity_SHBg, u_xlat3);
					    u_xlat4.z = dot(unity_SHBb, u_xlat3);
					    u_xlat5 = u_xlat0.y * u_xlat0.y;
					    u_xlat0.x = u_xlat0.x * u_xlat0.x + (-u_xlat5);
					    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat4.xyz;
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat0.xyz = exp2(u_xlat0.xyz);
					    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD3.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD4 = u_xlat1.z * unity_FogParams.z + unity_FogParams.w;
					    gl_Position = u_xlat1;
					    vs_TEXCOORD1.zw = u_xlat1.zw;
					    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
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
					uniform  sampler2D _LightBuffer;
					in  vec3 vs_TEXCOORD0;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0.xy = abs(vs_TEXCOORD0.xz) * vec2(0.5, 0.5);
					    u_xlat0.xy = fract(u_xlat0.xy);
					    u_xlat0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
					    u_xlat1.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat1 = texture(_LightBuffer, u_xlat1.xy);
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = (-u_xlat1.xyz) + vs_TEXCOORD3.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    SV_Target0.w = 1.0;
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
					uniform  sampler2D _LightBuffer;
					in  vec3 vs_TEXCOORD0;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat0 = texture(_LightBuffer, u_xlat0.xy);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = (-u_xlat0.xyz) + vs_TEXCOORD3.xyz;
					    u_xlat1.xy = abs(vs_TEXCOORD0.xz) * vec2(0.5, 0.5);
					    u_xlat1.xy = fract(u_xlat1.xy);
					    u_xlat1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vs_COLOR0.xyz;
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
					
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform  sampler2D _MainTex;
					uniform  sampler2D _LightBuffer;
					in  vec3 vs_TEXCOORD0;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0.xy = abs(vs_TEXCOORD0.xz) * vec2(0.5, 0.5);
					    u_xlat0.xy = fract(u_xlat0.xy);
					    u_xlat0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
					    u_xlat1.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat1 = texture(_LightBuffer, u_xlat1.xy);
					    u_xlat1.xyz = u_xlat1.xyz + vs_TEXCOORD3.xyz;
					    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					Keywords { "UNITY_HDR_ON" }
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
					uniform  sampler2D _LightBuffer;
					in  vec3 vs_TEXCOORD0;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0.xy = abs(vs_TEXCOORD0.xz) * vec2(0.5, 0.5);
					    u_xlat0.xy = fract(u_xlat0.xy);
					    u_xlat0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
					    u_xlat1.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat1 = texture(_LightBuffer, u_xlat1.xy);
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat1.xyz = u_xlat1.xyz + vs_TEXCOORD3.xyz;
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
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unused_0_1;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _LightBuffer;
					in  vec3 vs_TEXCOORD0;
					in  float vs_TEXCOORD4;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = abs(vs_TEXCOORD0.xz) * vec2(0.5, 0.5);
					    u_xlat0.xy = fract(u_xlat0.xy);
					    u_xlat0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
					    u_xlat1.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat1 = texture(_LightBuffer, u_xlat1.xy);
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = (-u_xlat1.xyz) + vs_TEXCOORD3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz + (-unity_FogColor.xyz);
					    u_xlat6 = vs_TEXCOORD4;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					Keywords { "FOG_LINEAR" }
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
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unused_0_1;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _LightBuffer;
					in  vec3 vs_TEXCOORD0;
					in  float vs_TEXCOORD4;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat0 = texture(_LightBuffer, u_xlat0.xy);
					    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat0.xyz = log2(u_xlat0.xyz);
					    u_xlat0.xyz = (-u_xlat0.xyz) + vs_TEXCOORD3.xyz;
					    u_xlat1.xy = abs(vs_TEXCOORD0.xz) * vec2(0.5, 0.5);
					    u_xlat1.xy = fract(u_xlat1.xy);
					    u_xlat1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1.xyz = u_xlat1.xyz * vs_COLOR0.xyz;
					    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xyz + (-unity_FogColor.xyz);
					    u_xlat6 = vs_TEXCOORD4;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
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
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unused_0_1;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _LightBuffer;
					in  vec3 vs_TEXCOORD0;
					in  float vs_TEXCOORD4;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = abs(vs_TEXCOORD0.xz) * vec2(0.5, 0.5);
					    u_xlat0.xy = fract(u_xlat0.xy);
					    u_xlat0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
					    u_xlat1.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat1 = texture(_LightBuffer, u_xlat1.xy);
					    u_xlat1.xyz = u_xlat1.xyz + vs_TEXCOORD3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz + (-unity_FogColor.xyz);
					    u_xlat6 = vs_TEXCOORD4;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					Keywords { "FOG_LINEAR" "UNITY_HDR_ON" }
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
					layout(std140) uniform UnityFog {
						vec4 unity_FogColor;
						vec4 unused_0_1;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _LightBuffer;
					in  vec3 vs_TEXCOORD0;
					in  float vs_TEXCOORD4;
					in  vec4 vs_COLOR0;
					in  vec4 vs_TEXCOORD1;
					in  vec3 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat6;
					void main()
					{
					    u_xlat0.xy = abs(vs_TEXCOORD0.xz) * vec2(0.5, 0.5);
					    u_xlat0.xy = fract(u_xlat0.xy);
					    u_xlat0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
					    u_xlat1.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
					    u_xlat1 = texture(_LightBuffer, u_xlat1.xy);
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
					    u_xlat1.xyz = u_xlat1.xyz + vs_TEXCOORD3.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz + (-unity_FogColor.xyz);
					    u_xlat6 = vs_TEXCOORD4;
					    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
					    SV_Target0.xyz = vec3(u_xlat6) * u_xlat0.xyz + unity_FogColor.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
			}
		}
		Pass {
			Name "DEFERRED"
			LOD 200
			Tags { "LIGHTMODE" = "Deferred" "QUEUE" = "Background" "RenderType" = "Opaque" }
			ZClip Off
			ZTest Always
			Cull Off
			Lighting On
			GpuProgramID 282557
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
						vec4 unused_0_8;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
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
						vec4 unused_3_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					out vec3 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec4 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2.x = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2.x = u_xlat7 * u_xlat2.x;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3.x = sin(u_xlat7);
					        u_xlat4 = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3.x;
					        u_xlat12 = u_xlat4 * u_xlat0.x + u_xlat12;
					        u_xlat2.x = u_xlat2.x * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2.x);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    gl_Position = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat1.x = dot(unity_SHAr, u_xlat0);
					    u_xlat1.y = dot(unity_SHAg, u_xlat0);
					    u_xlat1.z = dot(unity_SHAb, u_xlat0);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat15 = u_xlat0.y * u_xlat0.y;
					    u_xlat15 = u_xlat0.x * u_xlat0.x + (-u_xlat15);
					    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat15) + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD3.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD0.xyz = u_xlat0.xyz;
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
						vec4 unused_0_8;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
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
						vec4 unused_3_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					out vec3 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec4 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2.x = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2.x = u_xlat7 * u_xlat2.x;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3.x = sin(u_xlat7);
					        u_xlat4 = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3.x;
					        u_xlat12 = u_xlat4 * u_xlat0.x + u_xlat12;
					        u_xlat2.x = u_xlat2.x * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2.x);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    gl_Position = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat1.x = dot(unity_SHAr, u_xlat0);
					    u_xlat1.y = dot(unity_SHAg, u_xlat0);
					    u_xlat1.z = dot(unity_SHAb, u_xlat0);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat15 = u_xlat0.y * u_xlat0.y;
					    u_xlat15 = u_xlat0.x * u_xlat0.x + (-u_xlat15);
					    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat15) + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD3.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD0.xyz = u_xlat0.xyz;
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
						vec4 unused_0_8;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
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
						vec4 unused_3_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					out vec3 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec4 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2.x = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2.x = u_xlat7 * u_xlat2.x;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3.x = sin(u_xlat7);
					        u_xlat4 = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3.x;
					        u_xlat12 = u_xlat4 * u_xlat0.x + u_xlat12;
					        u_xlat2.x = u_xlat2.x * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2.x);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    gl_Position = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat1.x = dot(unity_SHAr, u_xlat0);
					    u_xlat1.y = dot(unity_SHAg, u_xlat0);
					    u_xlat1.z = dot(unity_SHAb, u_xlat0);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat15 = u_xlat0.y * u_xlat0.y;
					    u_xlat15 = u_xlat0.x * u_xlat0.x + (-u_xlat15);
					    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat15) + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD3.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD0.xyz = u_xlat0.xyz;
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					Keywords { "UNITY_HDR_ON" }
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
						vec4 unused_0_8;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
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
						vec4 unused_3_4[2];
					};
					in  vec4 in_POSITION0;
					in  vec3 in_NORMAL0;
					out vec3 vs_TEXCOORD0;
					out vec3 vs_TEXCOORD1;
					out vec4 vs_COLOR0;
					out vec4 vs_TEXCOORD2;
					out vec3 vs_TEXCOORD3;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec3 u_xlat3;
					float u_xlat4;
					float u_xlat5;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2.x = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2.x = u_xlat7 * u_xlat2.x;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3.x = sin(u_xlat7);
					        u_xlat4 = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3.x;
					        u_xlat12 = u_xlat4 * u_xlat0.x + u_xlat12;
					        u_xlat2.x = u_xlat2.x * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2.x);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.x = u_xlat1.x + in_POSITION0.y;
					    u_xlat5 = u_xlat1.x / u_xlat6;
					    u_xlat5 = u_xlat5 + 1.0;
					    u_xlat5 = u_xlat5 * 0.5;
					    u_xlat5 = u_xlat5 * u_xlat5;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat5) * u_xlat1 + _Color1;
					    u_xlat1 = u_xlat0.xxxx * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat1;
					    gl_Position = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.xxx * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD1.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
					    u_xlat0.x = dot(in_NORMAL0.xyz, unity_WorldToObject[0].xyz);
					    u_xlat0.y = dot(in_NORMAL0.xyz, unity_WorldToObject[1].xyz);
					    u_xlat0.z = dot(in_NORMAL0.xyz, unity_WorldToObject[2].xyz);
					    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat15 = inversesqrt(u_xlat15);
					    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
					    u_xlat0.w = 1.0;
					    u_xlat1.x = dot(unity_SHAr, u_xlat0);
					    u_xlat1.y = dot(unity_SHAg, u_xlat0);
					    u_xlat1.z = dot(unity_SHAb, u_xlat0);
					    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
					    u_xlat3.x = dot(unity_SHBr, u_xlat2);
					    u_xlat3.y = dot(unity_SHBg, u_xlat2);
					    u_xlat3.z = dot(unity_SHBb, u_xlat2);
					    u_xlat15 = u_xlat0.y * u_xlat0.y;
					    u_xlat15 = u_xlat0.x * u_xlat0.x + (-u_xlat15);
					    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat15) + u_xlat3.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    u_xlat1.xyz = log2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
					    u_xlat1.xyz = exp2(u_xlat1.xyz);
					    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
					    vs_TEXCOORD3.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
					    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
					    vs_TEXCOORD0.xyz = u_xlat0.xyz;
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
					in  vec3 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					in  vec3 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					layout(location = 1) out vec4 SV_Target1;
					layout(location = 2) out vec4 SV_Target2;
					layout(location = 3) out vec4 SV_Target3;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0.xy = abs(vs_TEXCOORD1.xz) * vec2(0.5, 0.5);
					    u_xlat0.xy = fract(u_xlat0.xy);
					    u_xlat0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
					    SV_Target0.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD3.xyz;
					    SV_Target3.xyz = exp2((-u_xlat0.xyz));
					    SV_Target0.w = 1.0;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    SV_Target2.xyz = vs_TEXCOORD0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    SV_Target2.w = 1.0;
					    SV_Target3.w = 1.0;
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
					in  vec3 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					in  vec3 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					layout(location = 1) out vec4 SV_Target1;
					layout(location = 2) out vec4 SV_Target2;
					layout(location = 3) out vec4 SV_Target3;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0.xy = abs(vs_TEXCOORD1.xz) * vec2(0.5, 0.5);
					    u_xlat0.xy = fract(u_xlat0.xy);
					    u_xlat0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
					    SV_Target0.xyz = u_xlat0.xyz;
					    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD3.xyz;
					    SV_Target3.xyz = exp2((-u_xlat0.xyz));
					    SV_Target0.w = 1.0;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    SV_Target2.xyz = vs_TEXCOORD0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
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
					
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					uniform  sampler2D _MainTex;
					in  vec3 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					in  vec3 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					layout(location = 1) out vec4 SV_Target1;
					layout(location = 2) out vec4 SV_Target2;
					layout(location = 3) out vec4 SV_Target3;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0.xy = abs(vs_TEXCOORD1.xz) * vec2(0.5, 0.5);
					    u_xlat0.xy = fract(u_xlat0.xy);
					    u_xlat0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target3.xyz = u_xlat0.xyz * vs_TEXCOORD3.xyz;
					    SV_Target0.w = 1.0;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    SV_Target2.xyz = vs_TEXCOORD0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
					    SV_Target2.w = 1.0;
					    SV_Target3.w = 1.0;
					    return;
					}"
				}
				SubProgram "d3d11_9x " {
					Keywords { "UNITY_HDR_ON" }
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
					in  vec3 vs_TEXCOORD0;
					in  vec3 vs_TEXCOORD1;
					in  vec4 vs_COLOR0;
					in  vec3 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					layout(location = 1) out vec4 SV_Target1;
					layout(location = 2) out vec4 SV_Target2;
					layout(location = 3) out vec4 SV_Target3;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0.xy = abs(vs_TEXCOORD1.xz) * vec2(0.5, 0.5);
					    u_xlat0.xy = fract(u_xlat0.xy);
					    u_xlat0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
					    SV_Target0.xyz = u_xlat0.xyz;
					    SV_Target3.xyz = u_xlat0.xyz * vs_TEXCOORD3.xyz;
					    SV_Target0.w = 1.0;
					    SV_Target1 = vec4(0.0, 0.0, 0.0, 0.0);
					    SV_Target2.xyz = vs_TEXCOORD0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
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
			Tags { "LIGHTMODE" = "Meta" "QUEUE" = "Background" "RenderType" = "Opaque" }
			ZClip Off
			ZTest Always
			Cull Off
			Lighting On
			GpuProgramID 379032
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
						vec4 unused_0_8;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_2_1[8];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_3[6];
					};
					layout(std140) uniform UnityLightmaps {
						vec4 unity_LightmapST;
						vec4 unity_DynamicLightmapST;
					};
					layout(std140) uniform UnityMetaPass {
						bvec4 unity_MetaVertexControl;
						vec4 unused_4_1;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD1;
					in  vec4 in_TEXCOORD2;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					float u_xlat3;
					float u_xlat4;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2 = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2 = u_xlat7 * u_xlat2;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3 = sin(u_xlat7);
					        u_xlat4 = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3;
					        u_xlat12 = u_xlat4 * u_xlat0.x + u_xlat12;
					        u_xlat2 = u_xlat2 * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.y = u_xlat1.x + in_POSITION0.y;
					    u_xlat15 = u_xlat1.x / u_xlat6;
					    u_xlat15 = u_xlat15 + 1.0;
					    u_xlat15 = u_xlat15 * 0.5;
					    u_xlat15 = u_xlat15 * u_xlat15;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat15) * u_xlat1 + _Color1;
					    u_xlat1.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    u_xlatb15 = 0.0<in_POSITION0.z;
					    u_xlat1.z = u_xlatb15 ? 9.99999975e-05 : float(0.0);
					    u_xlat0.xz = in_POSITION0.xz;
					    u_xlat0.xzw = (unity_MetaVertexControl.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = in_TEXCOORD2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
					    u_xlatb16 = 0.0<u_xlat0.w;
					    u_xlat1.z = u_xlatb16 ? 9.99999975e-05 : float(0.0);
					    u_xlat0.xzw = (unity_MetaVertexControl.y) ? u_xlat1.xyz : u_xlat0.xzw;
					    u_xlat1 = u_xlat0.zzzz * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
					float ImmCB_0_0_0[8];
					float ImmCB_0_0_2[8];
					float ImmCB_0_0_1[8];
					layout(std140) uniform VGlobals {
						vec4 unused_0_0[4];
						int _Samples;
						vec4 _Color1;
						vec4 _Color2;
						float _Amplitude;
						float _MinWavelength;
						float _MaxWavelength;
						float _SpeedMultiplier;
						vec4 unused_0_8;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 _Time;
						vec4 unused_1_1[8];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_2_1[8];
						mat4x4 unity_ObjectToWorld;
						vec4 unused_2_3[6];
					};
					layout(std140) uniform UnityLightmaps {
						vec4 unity_LightmapST;
						vec4 unity_DynamicLightmapST;
					};
					layout(std140) uniform UnityMetaPass {
						bvec4 unity_MetaVertexControl;
						vec4 unused_4_1;
					};
					in  vec4 in_POSITION0;
					in  vec4 in_TEXCOORD1;
					in  vec4 in_TEXCOORD2;
					out vec3 vs_TEXCOORD0;
					out vec4 vs_COLOR0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					float u_xlat2;
					float u_xlat3;
					float u_xlat4;
					float u_xlat6;
					float u_xlat7;
					float u_xlat10;
					int u_xlati11;
					float u_xlat12;
					float u_xlat15;
					bool u_xlatb15;
					float u_xlat16;
					bool u_xlatb16;
					void main()
					{
						ImmCB_0_0_0[0] = 0.01305719;
						ImmCB_0_0_0[1] = 0.323078185;
						ImmCB_0_0_0[2] = 0.310725003;
						ImmCB_0_0_0[3] = 0.479645699;
						ImmCB_0_0_0[4] = 0.139999196;
						ImmCB_0_0_0[5] = 0.248457804;
						ImmCB_0_0_0[6] = 0.187189803;
						ImmCB_0_0_0[7] = 0.884914875;
						ImmCB_0_0_2[0] = -1.0;
						ImmCB_0_0_2[1] = 1.0;
						ImmCB_0_0_2[2] = 1.0;
						ImmCB_0_0_2[3] = -1.0;
						ImmCB_0_0_2[4] = 1.0;
						ImmCB_0_0_2[5] = -1.0;
						ImmCB_0_0_2[6] = -1.0;
						ImmCB_0_0_2[7] = 1.0;
						ImmCB_0_0_1[0] = 0.587232113;
						ImmCB_0_0_1[1] = 0.0220727194;
						ImmCB_0_0_1[2] = 0.191367;
						ImmCB_0_0_1[3] = 0.0939876586;
						ImmCB_0_0_1[4] = 0.33577019;
						ImmCB_0_0_1[5] = 0.255532205;
						ImmCB_0_0_1[6] = 0.702763975;
						ImmCB_0_0_1[7] = 0.284207612;
					    u_xlat0.xy = in_POSITION0.yy * unity_ObjectToWorld[1].xz;
					    u_xlat0.xy = unity_ObjectToWorld[0].xz * in_POSITION0.xx + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[2].xz * in_POSITION0.zz + u_xlat0.xy;
					    u_xlat0.xy = unity_ObjectToWorld[3].xz * in_POSITION0.ww + u_xlat0.xy;
					    u_xlat10 = (-_MinWavelength) + _MaxWavelength;
					    u_xlat15 = _Amplitude * 0.100000001;
					    u_xlat1.x = float(0.0);
					    u_xlat6 = float(0.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Samples ; u_xlati_loop_1++)
					    {
					        u_xlat16 = u_xlat10 * ImmCB_0_0_0[u_xlati_loop_1] + _MinWavelength;
					        u_xlat16 = 6.28318024 / u_xlat16;
					        u_xlat2 = _SpeedMultiplier * ImmCB_0_0_2[u_xlati_loop_1];
					        u_xlat7 = u_xlat16 * 9.81000042;
					        u_xlat7 = sqrt(u_xlat7);
					        u_xlat2 = u_xlat7 * u_xlat2;
					        u_xlat7 = 6.28318024 * ImmCB_0_0_1[u_xlati_loop_1];
					        u_xlat3 = sin(u_xlat7);
					        u_xlat4 = cos(u_xlat7);
					        u_xlat7 = u_xlat15 / u_xlat16;
					        u_xlat6 = u_xlat6 + u_xlat7;
					        u_xlat12 = u_xlat0.y * u_xlat3;
					        u_xlat12 = u_xlat4 * u_xlat0.x + u_xlat12;
					        u_xlat2 = u_xlat2 * _Time.y;
					        u_xlat16 = u_xlat16 * u_xlat12 + (-u_xlat2);
					        u_xlat16 = sin(u_xlat16);
					        u_xlat1.x = u_xlat7 * u_xlat16 + u_xlat1.x;
					    }
					    u_xlat0.y = u_xlat1.x + in_POSITION0.y;
					    u_xlat15 = u_xlat1.x / u_xlat6;
					    u_xlat15 = u_xlat15 + 1.0;
					    u_xlat15 = u_xlat15 * 0.5;
					    u_xlat15 = u_xlat15 * u_xlat15;
					    u_xlat1 = (-_Color1) + _Color2;
					    vs_COLOR0 = vec4(u_xlat15) * u_xlat1 + _Color1;
					    u_xlat1.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					    u_xlatb15 = 0.0<in_POSITION0.z;
					    u_xlat1.z = u_xlatb15 ? 9.99999975e-05 : float(0.0);
					    u_xlat0.xz = in_POSITION0.xz;
					    u_xlat0.xzw = (unity_MetaVertexControl.x) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1.xy = in_TEXCOORD2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
					    u_xlatb16 = 0.0<u_xlat0.w;
					    u_xlat1.z = u_xlatb16 ? 9.99999975e-05 : float(0.0);
					    u_xlat0.xzw = (unity_MetaVertexControl.y) ? u_xlat1.xyz : u_xlat0.xzw;
					    u_xlat1 = u_xlat0.zzzz * glstate_matrix_mvp[1];
					    u_xlat1 = glstate_matrix_mvp[0] * u_xlat0.xxxx + u_xlat1;
					    u_xlat1 = glstate_matrix_mvp[2] * u_xlat0.wwww + u_xlat1;
					    gl_Position = u_xlat1 + glstate_matrix_mvp[3];
					    u_xlat0.xyz = u_xlat0.yyy * unity_ObjectToWorld[1].xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
					    u_xlat0.xyz = unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
					    vs_TEXCOORD0.xyz = unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
						vec4 unused_0_0[8];
						float unity_OneOverOutputBoost;
						float unity_MaxOutputValue;
					};
					layout(std140) uniform UnityMetaPass {
						vec4 unused_1_0;
						bvec4 unity_MetaFragmentControl;
					};
					uniform  sampler2D _MainTex;
					in  vec3 vs_TEXCOORD0;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0.xy = abs(vs_TEXCOORD0.xz) * vec2(0.5, 0.5);
					    u_xlat0.xy = fract(u_xlat0.xy);
					    u_xlat0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
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
						vec4 unused_0_0[8];
						float unity_OneOverOutputBoost;
						float unity_MaxOutputValue;
					};
					layout(std140) uniform UnityMetaPass {
						vec4 unused_1_0;
						bvec4 unity_MetaFragmentControl;
					};
					uniform  sampler2D _MainTex;
					in  vec3 vs_TEXCOORD0;
					in  vec4 vs_COLOR0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat3;
					void main()
					{
					    u_xlat0.xy = abs(vs_TEXCOORD0.xz) * vec2(0.5, 0.5);
					    u_xlat0.xy = fract(u_xlat0.xy);
					    u_xlat0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
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
	}
	Fallback "Diffuse"
}