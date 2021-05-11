Shader "Hidden/DLAA" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 37149
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
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
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
						vec4 unused_0_0[2];
						vec4 _MainTex_TexelSize;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
					    u_xlat0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
					    u_xlat0.xyz = u_xlat1.xyz + u_xlat0.xyz;
					    u_xlat1.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
					    u_xlat1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.xyz = (-u_xlat1.xyz) * vec3(4.0, 4.0, 4.0) + u_xlat0.xyz;
					    SV_Target0.xyz = u_xlat1.xyz;
					    u_xlat0.xyz = abs(u_xlat0.xyz) * vec3(4.0, 4.0, 4.0);
					    SV_Target0.w = dot(u_xlat0.xyz, vec3(0.330000013, 0.330000013, 0.330000013));
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
			GpuProgramID 106216
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
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
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
						vec4 unused_0_0[2];
						vec4 _MainTex_TexelSize;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec4 u_xlat9;
					vec3 u_xlat10;
					bool u_xlatb10;
					vec3 u_xlat13;
					float u_xlat17;
					float u_xlat20;
					bool u_xlatb20;
					float u_xlat23;
					float u_xlat30;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.5, 0.0, 1.5) + vs_TEXCOORD0.xyxy;
					    u_xlat1 = texture(_MainTex, u_xlat0.xy);
					    u_xlat0 = texture(_MainTex, u_xlat0.zw);
					    u_xlat2 = u_xlat0 + u_xlat1;
					    u_xlat3.xyz = u_xlat2.xyz + u_xlat2.xyz;
					    u_xlat4 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat3.xyz = (-u_xlat4.xyz) * vec3(4.0, 4.0, 4.0) + u_xlat3.xyz;
					    u_xlat3.xyz = abs(u_xlat3.xyz) * vec3(0.25, 0.25, 0.25);
					    u_xlat3.x = dot(u_xlat3.xyz, vec3(0.330000013, 0.330000013, 0.330000013));
					    u_xlat3.x = u_xlat3.x * 3.0 + -0.100000001;
					    u_xlat5 = _MainTex_TexelSize.xyxy * vec4(-1.5, 0.0, 1.5, 0.0) + vs_TEXCOORD0.xyxy;
					    u_xlat6 = texture(_MainTex, u_xlat5.xy);
					    u_xlat5 = texture(_MainTex, u_xlat5.zw);
					    u_xlat7 = u_xlat5 + u_xlat6;
					    u_xlat8 = u_xlat4 + u_xlat4;
					    u_xlat9 = u_xlat7 * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat8;
					    u_xlat13.xyz = u_xlat7.xyz + u_xlat7.xyz;
					    u_xlat13.xyz = (-u_xlat4.xyz) * vec3(4.0, 4.0, 4.0) + u_xlat13.xyz;
					    u_xlat13.xyz = abs(u_xlat13.xyz) * vec3(0.25, 0.25, 0.25);
					    u_xlat13.x = dot(u_xlat13.xyz, vec3(0.330000013, 0.330000013, 0.330000013));
					    u_xlat13.x = u_xlat13.x * 3.0 + -0.100000001;
					    u_xlat2 = u_xlat2 * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat8;
					    u_xlat7.xyz = u_xlat9.xyz * vec3(0.166666672, 0.166666672, 0.166666672);
					    u_xlat8 = u_xlat9 * vec4(0.166666672, 0.166666672, 0.166666672, 0.166666672) + (-u_xlat4);
					    u_xlat23 = dot(u_xlat7.xyz, vec3(0.330000013, 0.330000013, 0.330000013));
					    u_xlat3.x = u_xlat3.x / u_xlat23;
					    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
					    u_xlat7 = u_xlat3.xxxx * u_xlat8 + u_xlat4;
					    u_xlat8 = u_xlat2 * vec4(0.166666672, 0.166666672, 0.166666672, 0.166666672) + (-u_xlat7);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.166666672, 0.166666672, 0.166666672);
					    u_xlat2.x = dot(u_xlat2.xyz, vec3(0.330000013, 0.330000013, 0.330000013));
					    u_xlat2.x = u_xlat13.x / u_xlat2.x;
					    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
					    u_xlat2 = u_xlat2.xxxx * u_xlat8 + u_xlat7;
					    u_xlat3 = _MainTex_TexelSize.xyxy * vec4(0.0, 3.5, 0.0, 5.5) + vs_TEXCOORD0.xyxy;
					    u_xlat7 = texture(_MainTex, u_xlat3.xy);
					    u_xlat3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat0 = u_xlat0.wxyz + u_xlat7.wxyz;
					    u_xlat0 = u_xlat3.wxyz + u_xlat0;
					    u_xlat3 = _MainTex_TexelSize.xyxy * vec4(0.0, 7.5, 0.0, -3.5) + vs_TEXCOORD0.xyxy;
					    u_xlat7 = texture(_MainTex, u_xlat3.xy);
					    u_xlat3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat0 = u_xlat0 + u_xlat7.wxyz;
					    u_xlat0 = u_xlat1.wxyz + u_xlat0;
					    u_xlat0 = u_xlat3.wxyz + u_xlat0;
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(0.0, -5.5, 0.0, -7.5) + vs_TEXCOORD0.xyxy;
					    u_xlat3 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat0 = u_xlat0 + u_xlat3.wxyz;
					    u_xlat0 = u_xlat1.wxyz + u_xlat0;
					    u_xlat10.xyz = u_xlat0.yzw * vec3(0.125, 0.125, 0.125);
					    u_xlat0.x = u_xlat0.x * 0.25 + -1.0;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat10.x = dot(u_xlat10.xyz, vec3(0.330000013, 0.330000013, 0.330000013));
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 0.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
					    u_xlat3 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat20 = dot(u_xlat3.xyz, vec3(0.330000013, 0.330000013, 0.330000013));
					    u_xlat30 = (-u_xlat20) + u_xlat10.x;
					    u_xlat7.x = dot(u_xlat4.xyz, vec3(0.330000013, 0.330000013, 0.330000013));
					    u_xlat17 = (-u_xlat20) + u_xlat7.x;
					    u_xlatb20 = u_xlat20==u_xlat7.x;
					    u_xlat30 = u_xlat30 / u_xlat17;
					    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
					    u_xlat20 = (u_xlatb20) ? 0.0 : u_xlat30;
					    u_xlat8 = (-u_xlat3) + u_xlat4;
					    u_xlat3 = vec4(u_xlat20) * u_xlat8 + u_xlat3;
					    u_xlat3 = (-u_xlat1) + u_xlat3;
					    u_xlat10.x = u_xlat10.x + (-u_xlat7.x);
					    u_xlat20 = dot(u_xlat1.xyz, vec3(0.330000013, 0.330000013, 0.330000013));
					    u_xlat30 = (-u_xlat20) + u_xlat7.x;
					    u_xlatb20 = u_xlat20==u_xlat7.x;
					    u_xlat10.x = u_xlat10.x / u_xlat30;
					    u_xlat10.x = u_xlat10.x + 1.0;
					    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
					    u_xlat10.x = (u_xlatb20) ? 0.0 : u_xlat10.x;
					    u_xlat1 = u_xlat10.xxxx * u_xlat3 + u_xlat1;
					    u_xlat1 = (-u_xlat2) + u_xlat1;
					    u_xlat1 = u_xlat0.xxxx * u_xlat1 + u_xlat2;
					    u_xlatb0 = 0.0<u_xlat0.x;
					    u_xlat3 = _MainTex_TexelSize.xyxy * vec4(3.5, 0.0, 5.5, 0.0) + vs_TEXCOORD0.xyxy;
					    u_xlat8 = texture(_MainTex, u_xlat3.xy);
					    u_xlat3 = texture(_MainTex, u_xlat3.zw);
					    u_xlat5 = u_xlat5.wxyz + u_xlat8.wxyz;
					    u_xlat3 = u_xlat3.wxyz + u_xlat5;
					    u_xlat5 = _MainTex_TexelSize.xyxy * vec4(7.5, 0.0, -3.5, 0.0) + vs_TEXCOORD0.xyxy;
					    u_xlat8 = texture(_MainTex, u_xlat5.xy);
					    u_xlat5 = texture(_MainTex, u_xlat5.zw);
					    u_xlat3 = u_xlat3 + u_xlat8.wxyz;
					    u_xlat3 = u_xlat6.wxyz + u_xlat3;
					    u_xlat3 = u_xlat5.wxyz + u_xlat3;
					    u_xlat5 = _MainTex_TexelSize.xyxy * vec4(-5.5, 0.0, -7.5, 0.0) + vs_TEXCOORD0.xyxy;
					    u_xlat6 = texture(_MainTex, u_xlat5.xy);
					    u_xlat5 = texture(_MainTex, u_xlat5.zw);
					    u_xlat3 = u_xlat3 + u_xlat6.wxyz;
					    u_xlat3 = u_xlat5.wxyz + u_xlat3;
					    u_xlat10.xyz = u_xlat3.yzw * vec3(0.125, 0.125, 0.125);
					    u_xlat3.x = u_xlat3.x * 0.25 + -1.0;
					    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
					    u_xlat10.x = dot(u_xlat10.xyz, vec3(0.330000013, 0.330000013, 0.330000013));
					    u_xlat5 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.0, 0.0, 1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat6 = texture(_MainTex, u_xlat5.xy);
					    u_xlat5 = texture(_MainTex, u_xlat5.zw);
					    u_xlat20 = dot(u_xlat6.xyz, vec3(0.330000013, 0.330000013, 0.330000013));
					    u_xlat30 = (-u_xlat20) + u_xlat10.x;
					    u_xlat10.x = (-u_xlat7.x) + u_xlat10.x;
					    u_xlat13.x = (-u_xlat20) + u_xlat7.x;
					    u_xlatb20 = u_xlat20==u_xlat7.x;
					    u_xlat30 = u_xlat30 / u_xlat13.x;
					    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
					    u_xlat20 = (u_xlatb20) ? 0.0 : u_xlat30;
					    u_xlat4 = u_xlat4 + (-u_xlat6);
					    u_xlat4 = vec4(u_xlat20) * u_xlat4 + u_xlat6;
					    u_xlat4 = (-u_xlat5) + u_xlat4;
					    u_xlat20 = dot(u_xlat5.xyz, vec3(0.330000013, 0.330000013, 0.330000013));
					    u_xlat30 = (-u_xlat20) + u_xlat7.x;
					    u_xlatb20 = u_xlat20==u_xlat7.x;
					    u_xlat10.x = u_xlat10.x / u_xlat30;
					    u_xlat10.x = u_xlat10.x + 1.0;
					    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
					    u_xlat10.x = (u_xlatb20) ? 0.0 : u_xlat10.x;
					    u_xlat4 = u_xlat10.xxxx * u_xlat4 + u_xlat5;
					    u_xlat4 = (-u_xlat1) + u_xlat4;
					    u_xlat1 = u_xlat3.xxxx * u_xlat4 + u_xlat1;
					    u_xlatb10 = 0.0<u_xlat3.x;
					    u_xlatb0 = u_xlatb0 || u_xlatb10;
					    SV_Target0 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat2;
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
			GpuProgramID 193496
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
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
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
						vec4 unused_0_0[2];
						vec4 _MainTex_TexelSize;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec4 u_xlat9;
					vec4 u_xlat10;
					vec3 u_xlat11;
					vec3 u_xlat16;
					float u_xlat22;
					bool u_xlatb22;
					float u_xlat27;
					float u_xlat33;
					bool u_xlatb33;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(0.0, 3.5, 0.0, 5.5) + vs_TEXCOORD0.xyxy;
					    u_xlat1 = texture(_MainTex, u_xlat0.zw);
					    u_xlat0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.5, 0.0, 1.5) + vs_TEXCOORD0.xyxy;
					    u_xlat3 = texture(_MainTex, u_xlat2.zw);
					    u_xlat2 = texture(_MainTex, u_xlat2.xy);
					    u_xlat0 = u_xlat0.wxyz + u_xlat3.wxyz;
					    u_xlat3 = u_xlat3 + u_xlat2;
					    u_xlat0 = u_xlat1.wxyz + u_xlat0;
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(0.0, 7.5, 0.0, -3.5) + vs_TEXCOORD0.xyxy;
					    u_xlat4 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat0 = u_xlat0 + u_xlat4.wxyz;
					    u_xlat0 = u_xlat2.wxyz + u_xlat0;
					    u_xlat0 = u_xlat1.wxyz + u_xlat0;
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(0.0, -5.5, 0.0, -7.5) + vs_TEXCOORD0.xyxy;
					    u_xlat2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat0 = u_xlat0 + u_xlat2.wxyz;
					    u_xlat0 = u_xlat1.wxyz + u_xlat0;
					    u_xlat11.xyz = u_xlat0.yzw * vec3(0.125, 0.125, 0.125);
					    u_xlat0.x = u_xlat0.x * 0.25 + -1.0;
					    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
					    u_xlat11.x = dot(u_xlat11.xyz, vec3(0.330000013, 0.330000013, 0.330000013));
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 0.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
					    u_xlat2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat22 = dot(u_xlat2.xyz, vec3(0.330000013, 0.330000013, 0.330000013));
					    u_xlat33 = (-u_xlat22) + u_xlat11.x;
					    u_xlat4 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat5 = dot(u_xlat4.xyz, vec3(0.330000013, 0.330000013, 0.330000013));
					    u_xlat16.x = (-u_xlat22) + u_xlat5;
					    u_xlatb22 = u_xlat22==u_xlat5;
					    u_xlat33 = u_xlat33 / u_xlat16.x;
					    u_xlat33 = clamp(u_xlat33, 0.0, 1.0);
					    u_xlat22 = (u_xlatb22) ? 0.0 : u_xlat33;
					    u_xlat6 = (-u_xlat2) + u_xlat4;
					    u_xlat6 = vec4(u_xlat22) * u_xlat6 + u_xlat2;
					    u_xlat2.xyz = u_xlat1.xyz + u_xlat2.xyz;
					    u_xlat2.xyz = (-u_xlat4.xyz) * vec3(2.0, 2.0, 2.0) + u_xlat2.xyz;
					    u_xlat2.xyz = abs(u_xlat2.xyz) * vec3(0.5, 0.5, 0.5);
					    u_xlat22 = dot(u_xlat2.xyz, vec3(0.330000013, 0.330000013, 0.330000013));
					    u_xlat22 = u_xlat22 * 3.0 + -0.100000001;
					    u_xlat2 = (-u_xlat1) + u_xlat6;
					    u_xlat11.x = u_xlat11.x + (-u_xlat5);
					    u_xlat33 = dot(u_xlat1.xyz, vec3(0.330000013, 0.330000013, 0.330000013));
					    u_xlat16.x = (-u_xlat33) + u_xlat5;
					    u_xlatb33 = u_xlat33==u_xlat5;
					    u_xlat11.x = u_xlat11.x / u_xlat16.x;
					    u_xlat11.x = u_xlat11.x + 1.0;
					    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
					    u_xlat11.x = (u_xlatb33) ? 0.0 : u_xlat11.x;
					    u_xlat1 = u_xlat11.xxxx * u_xlat2 + u_xlat1;
					    u_xlat2 = u_xlat4 + u_xlat4;
					    u_xlat3 = u_xlat3 * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat2;
					    u_xlat16.xyz = u_xlat3.xyz * vec3(0.166666672, 0.166666672, 0.166666672);
					    u_xlat11.x = dot(u_xlat16.xyz, vec3(0.330000013, 0.330000013, 0.330000013));
					    u_xlat11.x = u_xlat22 / u_xlat11.x;
					    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
					    u_xlat11.x = u_xlat11.x * 0.5;
					    u_xlat6 = _MainTex_TexelSize.xyxy * vec4(-1.5, 0.0, 1.5, 0.0) + vs_TEXCOORD0.xyxy;
					    u_xlat7 = texture(_MainTex, u_xlat6.xy);
					    u_xlat6 = texture(_MainTex, u_xlat6.zw);
					    u_xlat8 = u_xlat6 + u_xlat7;
					    u_xlat2 = u_xlat8 * vec4(2.0, 2.0, 2.0, 2.0) + u_xlat2;
					    u_xlat8 = u_xlat2 * vec4(0.166666672, 0.166666672, 0.166666672, 0.166666672) + (-u_xlat4);
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.166666672, 0.166666672, 0.166666672);
					    u_xlat22 = dot(u_xlat2.xyz, vec3(0.330000013, 0.330000013, 0.330000013));
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.0, 0.0, 1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat9 = texture(_MainTex, u_xlat2.xy);
					    u_xlat2 = texture(_MainTex, u_xlat2.zw);
					    u_xlat16.xyz = u_xlat2.xyz + u_xlat9.xyz;
					    u_xlat16.xyz = (-u_xlat4.xyz) * vec3(2.0, 2.0, 2.0) + u_xlat16.xyz;
					    u_xlat16.xyz = abs(u_xlat16.xyz) * vec3(0.5, 0.5, 0.5);
					    u_xlat33 = dot(u_xlat16.xyz, vec3(0.330000013, 0.330000013, 0.330000013));
					    u_xlat33 = u_xlat33 * 3.0 + -0.100000001;
					    u_xlat22 = u_xlat33 / u_xlat22;
					    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
					    u_xlat8 = vec4(u_xlat22) * u_xlat8 + u_xlat4;
					    u_xlat4 = u_xlat4 + (-u_xlat9);
					    u_xlat3 = u_xlat3 * vec4(0.166666672, 0.166666672, 0.166666672, 0.166666672) + (-u_xlat8);
					    u_xlat3 = u_xlat11.xxxx * u_xlat3 + u_xlat8;
					    u_xlat1 = u_xlat1 + (-u_xlat3);
					    u_xlat1 = u_xlat0.xxxx * u_xlat1 + u_xlat3;
					    u_xlat8 = _MainTex_TexelSize.xyxy * vec4(3.5, 0.0, 5.5, 0.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10 = texture(_MainTex, u_xlat8.xy);
					    u_xlat8 = texture(_MainTex, u_xlat8.zw);
					    u_xlat6 = u_xlat6.wxyz + u_xlat10.wxyz;
					    u_xlat6 = u_xlat8.wxyz + u_xlat6;
					    u_xlat8 = _MainTex_TexelSize.xyxy * vec4(7.5, 0.0, -3.5, 0.0) + vs_TEXCOORD0.xyxy;
					    u_xlat10 = texture(_MainTex, u_xlat8.xy);
					    u_xlat8 = texture(_MainTex, u_xlat8.zw);
					    u_xlat6 = u_xlat6 + u_xlat10.wxyz;
					    u_xlat6 = u_xlat7.wxyz + u_xlat6;
					    u_xlat6 = u_xlat8.wxyz + u_xlat6;
					    u_xlat7 = _MainTex_TexelSize.xyxy * vec4(-5.5, 0.0, -7.5, 0.0) + vs_TEXCOORD0.xyxy;
					    u_xlat8 = texture(_MainTex, u_xlat7.xy);
					    u_xlat7 = texture(_MainTex, u_xlat7.zw);
					    u_xlat6 = u_xlat6 + u_xlat8.wxyz;
					    u_xlat6 = u_xlat7.wxyz + u_xlat6;
					    u_xlat11.xyz = u_xlat6.yzw * vec3(0.125, 0.125, 0.125);
					    u_xlat16.x = u_xlat6.x * 0.25 + -1.0;
					    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
					    u_xlat11.x = dot(u_xlat11.xyz, vec3(0.330000013, 0.330000013, 0.330000013));
					    u_xlat22 = dot(u_xlat9.xyz, vec3(0.330000013, 0.330000013, 0.330000013));
					    u_xlat33 = (-u_xlat22) + u_xlat11.x;
					    u_xlat11.x = (-u_xlat5) + u_xlat11.x;
					    u_xlat27 = (-u_xlat22) + u_xlat5;
					    u_xlatb22 = u_xlat22==u_xlat5;
					    u_xlat33 = u_xlat33 / u_xlat27;
					    u_xlat33 = clamp(u_xlat33, 0.0, 1.0);
					    u_xlat22 = (u_xlatb22) ? 0.0 : u_xlat33;
					    u_xlat4 = vec4(u_xlat22) * u_xlat4 + u_xlat9;
					    u_xlat4 = (-u_xlat2) + u_xlat4;
					    u_xlat22 = dot(u_xlat2.xyz, vec3(0.330000013, 0.330000013, 0.330000013));
					    u_xlat33 = (-u_xlat22) + u_xlat5;
					    u_xlatb22 = u_xlat22==u_xlat5;
					    u_xlat11.x = u_xlat11.x / u_xlat33;
					    u_xlat11.x = u_xlat11.x + 1.0;
					    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
					    u_xlat11.x = (u_xlatb22) ? 0.0 : u_xlat11.x;
					    u_xlat2 = u_xlat11.xxxx * u_xlat4 + u_xlat2;
					    u_xlat2 = (-u_xlat1) + u_xlat2;
					    u_xlat1 = u_xlat16.xxxx * u_xlat2 + u_xlat1;
					    u_xlat0.x = (-u_xlat0.x) + u_xlat16.x;
					    u_xlatb0 = 0.200000003<abs(u_xlat0.x);
					    SV_Target0 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat3;
					    return;
					}"
				}
			}
		}
	}
}