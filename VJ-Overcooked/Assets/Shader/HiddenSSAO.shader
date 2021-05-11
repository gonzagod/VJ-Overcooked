Shader "Hidden/SSAO" {
	Properties {
		_MainTex ("", 2D) = "" {}
		_RandomTexture ("", 2D) = "" {}
		_SSAO ("", 2D) = "" {}
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 36148
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
						vec2 _NoiseScale;
						vec4 _CameraDepthNormalsTexture_ST;
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
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _CameraDepthNormalsTexture_ST.xy + _CameraDepthNormalsTexture_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _NoiseScale.xy;
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
						vec4 _Params;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					uniform  sampler2D _RandomTexture;
					uniform  sampler2D _CameraDepthNormalsTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					bool u_xlatb1;
					vec4 u_xlat2;
					bool u_xlatb2;
					vec3 u_xlat3;
					vec4 u_xlat4;
					vec3 u_xlat5;
					float u_xlat7;
					float u_xlat12;
					float u_xlat16;
					bool u_xlatb16;
					float u_xlat17;
					float u_xlat18;
					bool u_xlatb18;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthNormalsTexture, vs_TEXCOORD0.xy);
					    u_xlat1.xyz = u_xlat0.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat0.x = dot(u_xlat0.zw, vec2(1.0, 0.00392156886));
					    u_xlat0.x = u_xlat0.x * _ProjectionParams.z;
					    u_xlat5.x = dot(u_xlat1.xyz, u_xlat1.xyz);
					    u_xlat5.x = 2.0 / u_xlat5.x;
					    u_xlat1.xy = u_xlat1.xy * u_xlat5.xx;
					    u_xlat1.z = u_xlat5.x + -1.0;
					    u_xlat2 = texture(_RandomTexture, vs_TEXCOORD1.xy);
					    u_xlat5.xyz = u_xlat2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16 = dot(vec3(0.01305719, 0.587232113, -0.119337), u_xlat5.xyz);
					    u_xlat16 = u_xlat16 + u_xlat16;
					    u_xlat2.xyz = u_xlat5.xyz * (-vec3(u_xlat16)) + vec3(0.01305719, 0.587232113, -0.119337);
					    u_xlat16 = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlatb16 = u_xlat16<0.0;
					    u_xlat16 = (u_xlatb16) ? -1.0 : 1.0;
					    u_xlat3.xyz = u_xlat1.xyz * vec3(0.300000012, 0.300000012, 0.300000012);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16) + u_xlat3.xyz;
					    u_xlat16 = (-u_xlat2.z) * _Params.x + u_xlat0.x;
					    u_xlat12 = _Params.x / u_xlat0.x;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat16 = (-u_xlat2.x) * _ProjectionParams.z + u_xlat16;
					    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
					    u_xlat2.x = (-u_xlat16) + 1.0;
					    u_xlatb16 = _Params.y<u_xlat16;
					    u_xlat2.x = log2(u_xlat2.x);
					    u_xlat2.x = u_xlat2.x * _Params.z;
					    u_xlat2.x = exp2(u_xlat2.x);
					    u_xlat16 = u_xlatb16 ? u_xlat2.x : float(0.0);
					    u_xlat2.x = dot(vec3(0.323078185, 0.0220727194, -0.418872505), u_xlat5.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat5.xyz * (-u_xlat2.xxx) + vec3(0.323078185, 0.0220727194, -0.418872505);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat0.x;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(-0.310725003, -0.191367, 0.0561368614), u_xlat5.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat5.xyz * (-u_xlat2.xxx) + vec3(-0.310725003, -0.191367, 0.0561368614);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat0.x;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(-0.479645699, 0.0939876586, -0.580265284), u_xlat5.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat5.xyz * (-u_xlat2.xxx) + vec3(-0.479645699, 0.0939876586, -0.580265284);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat0.x;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(0.139999196, -0.33577019, 0.559678912), u_xlat5.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat5.xyz * (-u_xlat2.xxx) + vec3(0.139999196, -0.33577019, 0.559678912);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat0.x;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(-0.248457804, 0.255532205, 0.348943889), u_xlat5.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat5.xyz * (-u_xlat2.xxx) + vec3(-0.248457804, 0.255532205, 0.348943889);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat0.x;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(0.187189803, -0.702763975, -0.231747895), u_xlat5.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat5.xyz * (-u_xlat2.xxx) + vec3(0.187189803, -0.702763975, -0.231747895);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat0.x;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(0.884914875, 0.284207612, 0.368523985), u_xlat5.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat5.xyz = u_xlat5.xyz * (-u_xlat2.xxx) + vec3(0.884914875, 0.284207612, 0.368523985);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat5.xyz);
					    u_xlatb1 = u_xlat1.x<0.0;
					    u_xlat1.x = (u_xlatb1) ? -1.0 : 1.0;
					    u_xlat5.xyz = u_xlat5.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat0.x = (-u_xlat5.z) * _Params.x + u_xlat0.x;
					    u_xlat5.xy = u_xlat5.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat2 = texture(_CameraDepthNormalsTexture, u_xlat5.xy);
					    u_xlat5.x = dot(u_xlat2.zw, vec2(1.0, 0.00392156886));
					    u_xlat0.x = (-u_xlat5.x) * _ProjectionParams.z + u_xlat0.x;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat5.x = (-u_xlat0.x) + 1.0;
					    u_xlatb0 = _Params.y<u_xlat0.x;
					    u_xlat5.x = log2(u_xlat5.x);
					    u_xlat5.x = u_xlat5.x * _Params.z;
					    u_xlat5.x = exp2(u_xlat5.x);
					    u_xlat5.x = u_xlat5.x + u_xlat16;
					    u_xlat0.x = (u_xlatb0) ? u_xlat5.x : u_xlat16;
					    SV_Target0 = (-u_xlat0.xxxx) * vec4(0.125, 0.125, 0.125, 0.125) + vec4(1.0, 1.0, 1.0, 1.0);
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
			GpuProgramID 102427
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
						vec2 _NoiseScale;
						vec4 _CameraDepthNormalsTexture_ST;
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
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _CameraDepthNormalsTexture_ST.xy + _CameraDepthNormalsTexture_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _NoiseScale.xy;
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
						vec4 _Params;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					uniform  sampler2D _RandomTexture;
					uniform  sampler2D _CameraDepthNormalsTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					bool u_xlatb1;
					vec4 u_xlat2;
					bool u_xlatb2;
					vec3 u_xlat3;
					vec4 u_xlat4;
					float u_xlat5;
					float u_xlat7;
					float u_xlat10;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					float u_xlat17;
					float u_xlat18;
					bool u_xlatb18;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthNormalsTexture, vs_TEXCOORD0.xy);
					    u_xlat15 = dot(u_xlat0.zw, vec2(1.0, 0.00392156886));
					    u_xlat0.xyz = u_xlat0.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat15 = u_xlat15 * _ProjectionParams.z;
					    u_xlat10 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat10 = 2.0 / u_xlat10;
					    u_xlat1.xy = u_xlat0.xy * vec2(u_xlat10);
					    u_xlat1.z = u_xlat10 + -1.0;
					    u_xlat2 = texture(_RandomTexture, vs_TEXCOORD1.xy);
					    u_xlat0.xyz = u_xlat2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16 = dot(vec3(0.401003897, 0.889938116, -0.0175177194), u_xlat0.xyz);
					    u_xlat16 = u_xlat16 + u_xlat16;
					    u_xlat2.xyz = u_xlat0.xyz * (-vec3(u_xlat16)) + vec3(0.401003897, 0.889938116, -0.0175177194);
					    u_xlat16 = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlatb16 = u_xlat16<0.0;
					    u_xlat16 = (u_xlatb16) ? -1.0 : 1.0;
					    u_xlat3.xyz = u_xlat1.xyz * vec3(0.300000012, 0.300000012, 0.300000012);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16) + u_xlat3.xyz;
					    u_xlat16 = (-u_xlat2.z) * _Params.x + u_xlat15;
					    u_xlat12 = _Params.x / u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat16 = (-u_xlat2.x) * _ProjectionParams.z + u_xlat16;
					    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
					    u_xlat2.x = (-u_xlat16) + 1.0;
					    u_xlatb16 = _Params.y<u_xlat16;
					    u_xlat2.x = log2(u_xlat2.x);
					    u_xlat2.x = u_xlat2.x * _Params.z;
					    u_xlat2.x = exp2(u_xlat2.x);
					    u_xlat16 = u_xlatb16 ? u_xlat2.x : float(0.0);
					    u_xlat2.x = dot(vec3(0.161783695, 0.133855194, -0.353048593), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(0.161783695, 0.133855194, -0.353048593);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(-0.230529606, -0.190008506, 0.502539575), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(-0.230529606, -0.190008506, 0.502539575);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(-0.625668406, 0.124166101, 0.116393201), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(-0.625668406, 0.124166101, 0.116393201);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(0.382078588, -0.324139804, 0.41128251), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(0.382078588, -0.324139804, 0.41128251);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(-0.0882965326, 0.164975896, 0.139587894), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(-0.0882965326, 0.164975896, 0.139587894);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(0.189167693, -0.1283755, -0.0987355709), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(0.189167693, -0.1283755, -0.0987355709);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(0.198614195, 0.176723897, 0.438049108), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(0.198614195, 0.176723897, 0.438049108);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(-0.329496592, 0.02684341, -0.402183592), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(-0.329496592, 0.02684341, -0.402183592);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(-0.0195650291, -0.310806215, -0.410663009), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(-0.0195650291, -0.310806215, -0.410663009);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(-0.321549892, 0.68320483, -0.343344599), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(-0.321549892, 0.68320483, -0.343344599);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(0.702612519, 0.164824903, 0.0225062501), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(0.702612519, 0.164824903, 0.0225062501);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(0.0370446406, -0.939131021, 0.135876507), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(0.0370446406, -0.939131021, 0.135876507);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(-0.698444605, -0.600342214, -0.040169429), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat0.xyz = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(-0.698444605, -0.600342214, -0.040169429);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlatb1 = u_xlat1.x<0.0;
					    u_xlat1.x = (u_xlatb1) ? -1.0 : 1.0;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat10 = (-u_xlat0.z) * _Params.x + u_xlat15;
					    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat2 = texture(_CameraDepthNormalsTexture, u_xlat0.xy);
					    u_xlat0.x = dot(u_xlat2.zw, vec2(1.0, 0.00392156886));
					    u_xlat0.x = (-u_xlat0.x) * _ProjectionParams.z + u_xlat10;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat5 = (-u_xlat0.x) + 1.0;
					    u_xlatb0 = _Params.y<u_xlat0.x;
					    u_xlat5 = log2(u_xlat5);
					    u_xlat5 = u_xlat5 * _Params.z;
					    u_xlat5 = exp2(u_xlat5);
					    u_xlat5 = u_xlat5 + u_xlat16;
					    u_xlat0.x = (u_xlatb0) ? u_xlat5 : u_xlat16;
					    SV_Target0 = (-u_xlat0.xxxx) * vec4(0.0714285746, 0.0714285746, 0.0714285746, 0.0714285746) + vec4(1.0, 1.0, 1.0, 1.0);
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
			GpuProgramID 168775
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
						vec2 _NoiseScale;
						vec4 _CameraDepthNormalsTexture_ST;
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
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _CameraDepthNormalsTexture_ST.xy + _CameraDepthNormalsTexture_ST.zw;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _NoiseScale.xy;
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
						vec4 _Params;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					uniform  sampler2D _RandomTexture;
					uniform  sampler2D _CameraDepthNormalsTexture;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					bool u_xlatb1;
					vec4 u_xlat2;
					bool u_xlatb2;
					vec3 u_xlat3;
					vec4 u_xlat4;
					float u_xlat5;
					float u_xlat7;
					float u_xlat10;
					float u_xlat12;
					float u_xlat15;
					float u_xlat16;
					bool u_xlatb16;
					float u_xlat17;
					float u_xlat18;
					bool u_xlatb18;
					void main()
					{
					    u_xlat0 = texture(_CameraDepthNormalsTexture, vs_TEXCOORD0.xy);
					    u_xlat15 = dot(u_xlat0.zw, vec2(1.0, 0.00392156886));
					    u_xlat0.xyz = u_xlat0.xyz * vec3(3.55539989, 3.55539989, 0.0) + vec3(-1.77769995, -1.77769995, 1.0);
					    u_xlat15 = u_xlat15 * _ProjectionParams.z;
					    u_xlat10 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat10 = 2.0 / u_xlat10;
					    u_xlat1.xy = u_xlat0.xy * vec2(u_xlat10);
					    u_xlat1.z = u_xlat10 + -1.0;
					    u_xlat2 = texture(_RandomTexture, vs_TEXCOORD1.xy);
					    u_xlat0.xyz = u_xlat2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
					    u_xlat16 = dot(vec3(0.219660699, 0.903263688, 0.225467697), u_xlat0.xyz);
					    u_xlat16 = u_xlat16 + u_xlat16;
					    u_xlat2.xyz = u_xlat0.xyz * (-vec3(u_xlat16)) + vec3(0.219660699, 0.903263688, 0.225467697);
					    u_xlat16 = dot(u_xlat1.xyz, u_xlat2.xyz);
					    u_xlatb16 = u_xlat16<0.0;
					    u_xlat16 = (u_xlatb16) ? -1.0 : 1.0;
					    u_xlat3.xyz = u_xlat1.xyz * vec3(0.300000012, 0.300000012, 0.300000012);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16) + u_xlat3.xyz;
					    u_xlat16 = (-u_xlat2.z) * _Params.x + u_xlat15;
					    u_xlat12 = _Params.x / u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat16 = (-u_xlat2.x) * _ProjectionParams.z + u_xlat16;
					    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
					    u_xlat2.x = (-u_xlat16) + 1.0;
					    u_xlatb16 = _Params.y<u_xlat16;
					    u_xlat2.x = log2(u_xlat2.x);
					    u_xlat2.x = u_xlat2.x * _Params.z;
					    u_xlat2.x = exp2(u_xlat2.x);
					    u_xlat16 = u_xlatb16 ? u_xlat2.x : float(0.0);
					    u_xlat2.x = dot(vec3(0.0591668114, 0.220150605, -0.143030196), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(0.0591668114, 0.220150605, -0.143030196);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(-0.415224612, 0.132085696, 0.703673422), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(-0.415224612, 0.132085696, 0.703673422);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(-0.379080713, 0.145414501, 0.100605004), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(-0.379080713, 0.145414501, 0.100605004);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(0.314960599, -0.1294581, 0.70445168), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(0.314960599, -0.1294581, 0.70445168);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(-0.1108412, 0.216283903, 0.133627802), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(-0.1108412, 0.216283903, 0.133627802);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(0.658011973, -0.439597189, -0.291937292), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(0.658011973, -0.439597189, -0.291937292);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(0.537791371, 0.311218888, 0.426863998), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(0.537791371, 0.311218888, 0.426863998);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(-0.275253713, 0.0762594864, -0.127340898), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(-0.275253713, 0.0762594864, -0.127340898);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(-0.191563904, -0.49734211, -0.31296289), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(-0.191563904, -0.49734211, -0.31296289);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(-0.2634767, 0.527792275, -0.110744603), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(-0.2634767, 0.527792275, -0.110744603);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(0.824275196, 0.0243414696, 0.0604909807), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(0.824275196, 0.0243414696, 0.0604909807);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(0.0626270697, -0.212864295, -0.0367156193), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(0.0626270697, -0.212864295, -0.0367156193);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(-0.179566205, -0.35438621, 0.0792434737), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(-0.179566205, -0.35438621, 0.0792434737);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(0.0603962913, 0.246289998, 0.450117588), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(0.0603962913, 0.246289998, 0.450117588);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(-0.778634489, -0.381485194, -0.239126205), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(-0.778634489, -0.381485194, -0.239126205);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(0.279291898, 0.248727798, -0.0518534109), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(0.279291898, 0.248727798, -0.0518534109);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(0.184138298, 0.169699296, -0.89362812), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(0.184138298, 0.169699296, -0.89362812);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(-0.347978085, 0.472576588, -0.719685018), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(-0.347978085, 0.472576588, -0.719685018);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(-0.136501804, -0.251341611, 0.470937014), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(-0.136501804, -0.251341611, 0.470937014);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(0.128038794, -0.563242018, 0.341927588), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(0.128038794, -0.563242018, 0.341927588);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(-0.480023205, -0.189947307, 0.2398808), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(-0.480023205, -0.189947307, 0.2398808);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(0.638914704, 0.119101398, -0.52712059), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(0.638914704, 0.119101398, -0.52712059);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(0.193282202, -0.369209886, -0.606058776), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(0.193282202, -0.369209886, -0.606058776);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(-0.3465451, -0.165465102, -0.674675822), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat2.xyw = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(-0.3465451, -0.165465102, -0.674675822);
					    u_xlat18 = dot(u_xlat1.xyz, u_xlat2.xyw);
					    u_xlatb18 = u_xlat18<0.0;
					    u_xlat18 = (u_xlatb18) ? -1.0 : 1.0;
					    u_xlat2.xyw = u_xlat2.xyw * vec3(u_xlat18) + u_xlat3.xyz;
					    u_xlat17 = (-u_xlat2.w) * _Params.x + u_xlat15;
					    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat4 = texture(_CameraDepthNormalsTexture, u_xlat2.xy);
					    u_xlat2.x = dot(u_xlat4.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = (-u_xlat2.x) * _ProjectionParams.z + u_xlat17;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat7 = (-u_xlat2.x) + 1.0;
					    u_xlatb2 = _Params.y<u_xlat2.x;
					    u_xlat7 = log2(u_xlat7);
					    u_xlat7 = u_xlat7 * _Params.z;
					    u_xlat7 = exp2(u_xlat7);
					    u_xlat7 = u_xlat16 + u_xlat7;
					    u_xlat16 = (u_xlatb2) ? u_xlat7 : u_xlat16;
					    u_xlat2.x = dot(vec3(0.244842097, -0.1610962, 0.128936604), u_xlat0.xyz);
					    u_xlat2.x = u_xlat2.x + u_xlat2.x;
					    u_xlat0.xyz = u_xlat0.xyz * (-u_xlat2.xxx) + vec3(0.244842097, -0.1610962, 0.128936604);
					    u_xlat1.x = dot(u_xlat1.xyz, u_xlat0.xyz);
					    u_xlatb1 = u_xlat1.x<0.0;
					    u_xlat1.x = (u_xlatb1) ? -1.0 : 1.0;
					    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx + u_xlat3.xyz;
					    u_xlat10 = (-u_xlat0.z) * _Params.x + u_xlat15;
					    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat12) + vs_TEXCOORD0.xy;
					    u_xlat2 = texture(_CameraDepthNormalsTexture, u_xlat0.xy);
					    u_xlat0.x = dot(u_xlat2.zw, vec2(1.0, 0.00392156886));
					    u_xlat0.x = (-u_xlat0.x) * _ProjectionParams.z + u_xlat10;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat5 = (-u_xlat0.x) + 1.0;
					    u_xlatb0 = _Params.y<u_xlat0.x;
					    u_xlat5 = log2(u_xlat5);
					    u_xlat5 = u_xlat5 * _Params.z;
					    u_xlat5 = exp2(u_xlat5);
					    u_xlat5 = u_xlat5 + u_xlat16;
					    u_xlat0.x = (u_xlatb0) ? u_xlat5 : u_xlat16;
					    SV_Target0 = (-u_xlat0.xxxx) * vec4(0.0384615399, 0.0384615399, 0.0384615399, 0.0384615399) + vec4(1.0, 1.0, 1.0, 1.0);
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
			GpuProgramID 228330
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
						vec4 _CameraDepthNormalsTexture_ST;
						vec4 unused_0_2[3];
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _CameraDepthNormalsTexture_ST.xy + _CameraDepthNormalsTexture_ST.zw;
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
						vec4 unused_0_0[6];
						vec3 _TexelOffsetScale;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[5];
						vec4 _ProjectionParams;
						vec4 unused_1_2[3];
					};
					uniform  sampler2D _SSAO;
					uniform  sampler2D _CameraDepthNormalsTexture;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec2 u_xlat2;
					vec4 u_xlat3;
					bvec2 u_xlatb3;
					vec4 u_xlat4;
					float u_xlat5;
					float u_xlat8;
					int u_xlati10;
					vec2 u_xlat11;
					int u_xlati11;
					bool u_xlatb11;
					vec2 u_xlat12;
					int u_xlati12;
					int u_xlati15;
					bool u_xlatb15;
					float u_xlat16;
					int u_xlati16;
					float u_xlat17;
					bool u_xlatb17;
					void main()
					{
					    u_xlat0 = texture(_SSAO, vs_TEXCOORD0.xy);
					    u_xlat0.x = u_xlat0.x * 5.0;
					    u_xlat1 = texture(_CameraDepthNormalsTexture, vs_TEXCOORD0.xy);
					    u_xlat5 = dot(u_xlat1.zw, vec2(1.0, 0.00392156886));
					    u_xlat2.x = u_xlat0.x;
					    u_xlat2.y = 5.0;
					    u_xlati10 = 0;
					    while(true){
					        u_xlatb15 = u_xlati10>=4;
					        if(u_xlatb15){break;}
					        u_xlati15 = u_xlati10 + 1;
					        u_xlat11.x = float(u_xlati15);
					        u_xlat11.xy = _TexelOffsetScale.xy * u_xlat11.xx + vs_TEXCOORD0.xy;
					        u_xlat3 = texture(_CameraDepthNormalsTexture, u_xlat11.xy);
					        u_xlati12 = (-u_xlati10) + 4;
					        u_xlat12.x = float(u_xlati12);
					        u_xlat3.xy = u_xlat1.xy + (-u_xlat3.xy);
					        u_xlat17 = abs(u_xlat3.y) + abs(u_xlat3.x);
					        u_xlatb17 = u_xlat17<0.100000001;
					        u_xlat17 = u_xlatb17 ? 1.0 : float(0.0);
					        u_xlat3.x = dot(u_xlat3.zw, vec2(1.0, 0.00392156886));
					        u_xlat3.x = u_xlat5 + (-u_xlat3.x);
					        u_xlat3.x = abs(u_xlat3.x) * _ProjectionParams.z;
					        u_xlatb3.x = u_xlat3.x<0.200000003;
					        u_xlat3.x = u_xlatb3.x ? 1.0 : float(0.0);
					        u_xlat17 = u_xlat17 * u_xlat3.x;
					        u_xlat3.x = u_xlat17 * u_xlat12.x;
					        u_xlat4 = texture(_SSAO, u_xlat11.xy);
					        u_xlat2.x = u_xlat4.x * u_xlat3.x + u_xlat2.x;
					        u_xlat2.y = u_xlat12.x * u_xlat17 + u_xlat2.y;
					        u_xlati10 = u_xlati15;
					    }
					    u_xlat0.xz = u_xlat2.xy;
					    u_xlati15 = 0;
					    while(true){
					        u_xlatb11 = u_xlati15>=4;
					        if(u_xlatb11){break;}
					        u_xlati11 = u_xlati15 + 1;
					        u_xlat16 = float(u_xlati11);
					        u_xlat12.xy = (-_TexelOffsetScale.xy) * vec2(u_xlat16) + vs_TEXCOORD0.xy;
					        u_xlat3 = texture(_CameraDepthNormalsTexture, u_xlat12.xy);
					        u_xlati16 = (-u_xlati15) + 4;
					        u_xlat16 = float(u_xlati16);
					        u_xlat3.xy = u_xlat1.xy + (-u_xlat3.xy);
					        u_xlat3.x = abs(u_xlat3.y) + abs(u_xlat3.x);
					        u_xlatb3.x = u_xlat3.x<0.100000001;
					        u_xlat8 = dot(u_xlat3.zw, vec2(1.0, 0.00392156886));
					        u_xlat8 = u_xlat5 + (-u_xlat8);
					        u_xlat8 = abs(u_xlat8) * _ProjectionParams.z;
					        u_xlatb3.y = u_xlat8<0.200000003;
					        u_xlat3.x = u_xlatb3.x ? float(1.0) : 0.0;
					        u_xlat3.y = u_xlatb3.y ? float(1.0) : 0.0;
					;
					        u_xlat3.x = u_xlat3.y * u_xlat3.x;
					        u_xlat8 = u_xlat16 * u_xlat3.x;
					        u_xlat4 = texture(_SSAO, u_xlat12.xy);
					        u_xlat0.x = u_xlat4.x * u_xlat8 + u_xlat0.x;
					        u_xlat0.z = u_xlat16 * u_xlat3.x + u_xlat0.z;
					        u_xlati15 = u_xlati11;
					    }
					    SV_Target0 = u_xlat0.xxxx / u_xlat0.zzzz;
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
			GpuProgramID 322379
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
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_0_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_0_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
						vec4 _Params;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _SSAO;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = texture(_SSAO, vs_TEXCOORD1.xy);
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _Params.w;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    SV_Target0.w = u_xlat1.w;
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
						vec4 _Params;
					};
					uniform  sampler2D _MainTex;
					uniform  sampler2D _SSAO;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = texture(_SSAO, vs_TEXCOORD1.xy);
					    u_xlat0.x = log2(u_xlat0.x);
					    u_xlat0.x = u_xlat0.x * _Params.w;
					    u_xlat0.x = exp2(u_xlat0.x);
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    SV_Target0.xyz = u_xlat0.xxx * u_xlat1.xyz;
					    SV_Target0.w = u_xlat1.w;
					    return;
					}"
				}
			}
		}
	}
}