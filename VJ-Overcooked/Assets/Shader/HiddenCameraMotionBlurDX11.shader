Shader "Hidden/CameraMotionBlurDX11" {
	Properties {
		_MainTex ("-", 2D) = "" {}
		_NoiseTex ("-", 2D) = "grey" {}
		_VelTex ("-", 2D) = "black" {}
		_NeighbourMaxTex ("-", 2D) = "black" {}
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 40867
			Program "vp" {
				SubProgram "d3d11 " {
					"vs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					precise vec4 u_xlat_precise_vec4;
					precise ivec4 u_xlat_precise_ivec4;
					precise bvec4 u_xlat_precise_bvec4;
					precise uvec4 u_xlat_precise_uvec4;
					UNITY_BINDING(0) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_0_1[18];
					};
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec2 in_TEXCOORD0;
					layout(location = 0) out vec2 vs_TEXCOORD0;
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
					"ps_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					precise vec4 u_xlat_precise_vec4;
					precise ivec4 u_xlat_precise_ivec4;
					precise bvec4 u_xlat_precise_bvec4;
					precise uvec4 u_xlat_precise_uvec4;
					UNITY_BINDING(0) uniform PGlobals {
						vec4 unused_0_0[2];
						float _MaxRadiusOrKInPaper;
						vec4 _MainTex_TexelSize;
						vec4 unused_0_3[16];
					};
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					layout(location = 0) in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec2 u_xlat1;
					vec4 u_xlat2;
					float u_xlat3;
					bool u_xlatb3;
					float u_xlat7;
					int u_xlati8;
					vec2 u_xlat9;
					bool u_xlatb9;
					int u_xlati10;
					int u_xlati12;
					bool u_xlatb14;
					void main()
					{
					    u_xlat0.xy = vec2(_MaxRadiusOrKInPaper) * _MainTex_TexelSize.xy;
					    u_xlat0.xy = (-u_xlat0.xy) * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
					    u_xlati8 = int(_MaxRadiusOrKInPaper);
					    u_xlat1.x = float(0.0);
					    u_xlat1.y = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<u_xlati8 ; u_xlati_loop_1++)
					    {
					        u_xlat2.y = float(u_xlati_loop_1);
					        u_xlat9.xy = u_xlat1.xy;
					        for(int u_xlati_loop_2 = 0 ; u_xlati_loop_2<u_xlati8 ; u_xlati_loop_2++)
					        {
					            u_xlat2.x = float(u_xlati_loop_2);
					            u_xlat2.xw = u_xlat2.xy * _MainTex_TexelSize.xy + u_xlat0.xy;
					            u_xlat2.xw = texture(_MainTex, u_xlat2.xw).xy;
					            u_xlat3 = dot(u_xlat9.xy, u_xlat9.xy);
					            u_xlat7 = dot(u_xlat2.xw, u_xlat2.xw);
					            u_xlatb3 = u_xlat7<u_xlat3;
					            u_xlat9.xy = (bool(u_xlatb3)) ? u_xlat9.xy : u_xlat2.xw;
					        }
					        u_xlat1.xy = u_xlat9.xy;
					    }
					    SV_Target0.xy = u_xlat1.xy;
					    SV_Target0.zw = vec2(0.0, 1.0);
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
			GpuProgramID 122625
			Program "vp" {
				SubProgram "d3d11 " {
					"vs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					precise vec4 u_xlat_precise_vec4;
					precise ivec4 u_xlat_precise_ivec4;
					precise bvec4 u_xlat_precise_bvec4;
					precise uvec4 u_xlat_precise_uvec4;
					UNITY_BINDING(0) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_0_1[18];
					};
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec2 in_TEXCOORD0;
					layout(location = 0) out vec2 vs_TEXCOORD0;
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
					"ps_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					precise vec4 u_xlat_precise_vec4;
					precise ivec4 u_xlat_precise_ivec4;
					precise bvec4 u_xlat_precise_bvec4;
					precise uvec4 u_xlat_precise_uvec4;
					UNITY_BINDING(0) uniform PGlobals {
						vec4 unused_0_0[3];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[16];
					};
					UNITY_LOCATION(0) uniform  sampler2D _MainTex;
					layout(location = 0) in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec2 u_xlat1;
					bool u_xlatb1;
					vec2 u_xlat2;
					bool u_xlatb2;
					int u_xlati6;
					vec2 u_xlat7;
					float u_xlat8;
					int u_xlati9;
					bool u_xlatb9;
					void main()
					{
					    u_xlat0.x = float(0.0);
					    u_xlat0.y = float(0.0);
					    for(int u_xlati_loop_1 = int(int(0xFFFFFFFFu)) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
					    {
					        u_xlat1.y = float(u_xlati_loop_1);
					        u_xlat7.xy = u_xlat0.xy;
					        for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
					        {
					            u_xlat1.x = float(u_xlati_loop_2);
					            u_xlat2.xy = u_xlat1.xy * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
					            u_xlat2.xy = texture(_MainTex, u_xlat2.xy).xy;
					            u_xlat1.x = dot(u_xlat7.xy, u_xlat7.xy);
					            u_xlat8 = dot(u_xlat2.xy, u_xlat2.xy);
					            u_xlatb1 = u_xlat8<u_xlat1.x;
					            u_xlat7.xy = (bool(u_xlatb1)) ? u_xlat7.xy : u_xlat2.xy;
					        }
					        u_xlat0.xy = u_xlat7.xy;
					    }
					    SV_Target0.xy = u_xlat0.xy;
					    SV_Target0.zw = vec2(0.0, 1.0);
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
			GpuProgramID 134074
			Program "vp" {
				SubProgram "d3d11 " {
					"vs_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					precise vec4 u_xlat_precise_vec4;
					precise ivec4 u_xlat_precise_ivec4;
					precise bvec4 u_xlat_precise_bvec4;
					precise uvec4 u_xlat_precise_uvec4;
					UNITY_BINDING(0) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_0_1[18];
					};
					layout(location = 0) in  vec4 in_POSITION0;
					layout(location = 1) in  vec2 in_TEXCOORD0;
					layout(location = 0) out vec2 vs_TEXCOORD0;
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
					"ps_5_0
					
					#version 430
					#extension GL_ARB_explicit_attrib_location : require
					#extension GL_ARB_explicit_uniform_location : require
					
					#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
					#if HLSLCC_ENABLE_UNIFORM_BUFFERS
					#define UNITY_UNIFORM
					#else
					#define UNITY_UNIFORM uniform
					#endif
					#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
					#if UNITY_SUPPORTS_UNIFORM_LOCATION
					#define UNITY_LOCATION(x) layout(location = x)
					#define UNITY_BINDING(x) layout(binding = x, std140)
					#else
					#define UNITY_LOCATION(x)
					#define UNITY_BINDING(x) layout(std140)
					#endif
					precise vec4 u_xlat_precise_vec4;
					precise ivec4 u_xlat_precise_ivec4;
					precise bvec4 u_xlat_precise_bvec4;
					precise uvec4 u_xlat_precise_uvec4;
					UNITY_BINDING(0) uniform PGlobals {
						vec4 unused_0_0[2];
						float _MaxRadiusOrKInPaper;
						vec4 _MainTex_TexelSize;
						vec4 unused_0_3[14];
						float _Jitter;
						float _SoftZDistance;
					};
					UNITY_BINDING(1) uniform UnityPerCamera {
						vec4 unused_1_0[7];
						vec4 _ZBufferParams;
						vec4 unused_1_2;
					};
					UNITY_LOCATION(0) uniform  sampler2D _NeighbourMaxTex;
					UNITY_LOCATION(1) uniform  sampler2D _MainTex;
					UNITY_LOCATION(2) uniform  sampler2D _CameraDepthTexture;
					UNITY_LOCATION(3) uniform  sampler2D _VelTex;
					UNITY_LOCATION(4) uniform  sampler2D _NoiseTex;
					layout(location = 0) in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					bool u_xlatb0;
					vec2 u_xlat1;
					vec4 u_xlat2;
					float u_xlat3;
					vec4 u_xlat4;
					vec3 u_xlat5;
					bool u_xlatb5;
					vec4 u_xlat6;
					vec2 u_xlat7;
					vec2 u_xlat8;
					vec2 u_xlat11;
					vec2 u_xlat13;
					int u_xlati13;
					float u_xlat14;
					vec2 u_xlat17;
					float u_xlat19;
					vec2 u_xlat21;
					vec2 u_xlat22;
					float u_xlat24;
					float u_xlat25;
					int u_xlati27;
					float u_xlat29;
					float u_xlat30;
					void main()
					{
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat8.x = (-vs_TEXCOORD0.y) + 1.0;
					    u_xlat1.y = (u_xlatb0) ? u_xlat8.x : vs_TEXCOORD0.y;
					    u_xlat1.x = vs_TEXCOORD0.x;
					    u_xlat8.xy = texture(_NeighbourMaxTex, u_xlat1.xy).xy;
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat24 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
					    u_xlat24 = _ZBufferParams.x * u_xlat24 + _ZBufferParams.y;
					    u_xlat24 = float(1.0) / u_xlat24;
					    u_xlat1.xy = texture(_VelTex, u_xlat1.xy).xy;
					    u_xlat17.xy = vs_TEXCOORD0.xy * vec2(11.0, 11.0);
					    u_xlat17.x = texture(_NoiseTex, u_xlat17.xy).x;
					    u_xlat17.x = u_xlat17.x * 2.0 + -1.0;
					    u_xlat25 = _Jitter + 18.0;
					    u_xlat3 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat11.x = inversesqrt(u_xlat3);
					    u_xlat11.xy = u_xlat1.xy * u_xlat11.xx;
					    u_xlat11.xy = u_xlat11.xy * _MainTex_TexelSize.xy;
					    u_xlat11.xy = u_xlat11.xy * vec2(_MaxRadiusOrKInPaper);
					    u_xlat1.xy = min(u_xlat1.xy, u_xlat11.xy);
					    u_xlat1.xy = (-u_xlat8.xy) + u_xlat1.xy;
					    u_xlat3 = sqrt(u_xlat3);
					    u_xlat11.x = u_xlat3 * 0.0999999642;
					    u_xlat11.x = float(1.0) / u_xlat11.x;
					    u_xlat4 = u_xlat2;
					    u_xlat19 = float(1.0);
					    u_xlati27 = int(0);
					    while(true){
					        u_xlatb5 = u_xlati27>=19;
					        if(u_xlatb5){break;}
					        u_xlatb5 = u_xlati27==9;
					        if(u_xlatb5){
					            u_xlati27 = 10;
					            continue;
					        }
					        u_xlat5.x = float(u_xlati27);
					        u_xlat5.x = u_xlat17.x * _Jitter + u_xlat5.x;
					        u_xlat5.x = u_xlat5.x / u_xlat25;
					        u_xlat5.x = u_xlat5.x * 2.0 + -1.0;
					        u_xlati13 = int(uint(u_xlati27) & 1u);
					        u_xlat13.x = (u_xlati13 != 0) ? 0.0 : 1.0;
					        u_xlat13.xy = u_xlat13.xx * u_xlat1.xy + u_xlat8.xy;
					        u_xlat6.xy = u_xlat5.xx * u_xlat13.xy;
					        u_xlat5.xy = u_xlat13.xy * u_xlat5.xx + vs_TEXCOORD0.xy;
					        u_xlat29 = (-u_xlat5.y) + 1.0;
					        u_xlat5.z = (u_xlatb0) ? u_xlat29 : u_xlat5.y;
					        u_xlat21.xy = textureLod(_VelTex, u_xlat5.xz, 0.0).xy;
					        u_xlat22.x = textureLod(_CameraDepthTexture, u_xlat5.xy, 0.0).x;
					        u_xlat22.x = _ZBufferParams.x * u_xlat22.x + _ZBufferParams.y;
					        u_xlat22.x = float(1.0) / u_xlat22.x;
					        u_xlat30 = (-u_xlat24) + u_xlat22.x;
					        u_xlat22.y = u_xlat30 / _SoftZDistance;
					        u_xlat22.x = u_xlat24 + (-u_xlat22.x);
					        u_xlat22.x = u_xlat22.x / _SoftZDistance;
					        u_xlat22.xy = (-u_xlat22.xy) + vec2(1.0, 1.0);
					        u_xlat22.xy = clamp(u_xlat22.xy, 0.0, 1.0);
					        u_xlat6.x = dot(u_xlat6.xy, u_xlat6.xy);
					        u_xlat6.x = sqrt(u_xlat6.x);
					        u_xlat21.x = dot(u_xlat21.xy, u_xlat21.xy);
					        u_xlat21.x = sqrt(u_xlat21.x);
					        u_xlat29 = u_xlat6.x / u_xlat21.x;
					        u_xlat29 = (-u_xlat29) + 1.0;
					        u_xlat29 = max(u_xlat29, 0.0);
					        u_xlat7.xy = (-u_xlat5.xy) + vs_TEXCOORD0.xy;
					        u_xlat14 = dot(u_xlat7.xy, u_xlat7.xy);
					        u_xlat14 = sqrt(u_xlat14);
					        u_xlat7.x = u_xlat14 / u_xlat3;
					        u_xlat7.x = (-u_xlat7.x) + 1.0;
					        u_xlat7.x = max(u_xlat7.x, 0.0);
					        u_xlat22.x = u_xlat22.x * u_xlat7.x;
					        u_xlat29 = u_xlat22.y * u_xlat29 + u_xlat22.x;
					        u_xlat22.x = u_xlat21.x * 0.0999999642;
					        u_xlat21.x = (-u_xlat21.x) * 0.949999988 + u_xlat6.x;
					        u_xlat6.x = float(1.0) / u_xlat22.x;
					        u_xlat21.x = u_xlat21.x * u_xlat6.x;
					        u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
					        u_xlat6.x = u_xlat21.x * -2.0 + 3.0;
					        u_xlat21.x = u_xlat21.x * u_xlat21.x;
					        u_xlat21.x = (-u_xlat6.x) * u_xlat21.x + 1.0;
					        u_xlat6.x = (-u_xlat3) * 0.949999988 + u_xlat14;
					        u_xlat6.x = u_xlat11.x * u_xlat6.x;
					        u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					        u_xlat14 = u_xlat6.x * -2.0 + 3.0;
					        u_xlat6.x = u_xlat6.x * u_xlat6.x;
					        u_xlat6.x = (-u_xlat14) * u_xlat6.x + 1.0;
					        u_xlat21.x = dot(u_xlat21.xx, u_xlat6.xx);
					        u_xlat21.x = u_xlat21.x + u_xlat29;
					        u_xlat6 = textureLod(_MainTex, u_xlat5.xy, 0.0);
					        u_xlat4 = u_xlat6 * u_xlat21.xxxx + u_xlat4;
					        u_xlat19 = u_xlat19 + u_xlat21.x;
					        u_xlati27 = u_xlati27 + 1;
					    }
					    SV_Target0 = u_xlat4 / vec4(u_xlat19);
					    return;
					}"
				}
			}
		}
	}
}