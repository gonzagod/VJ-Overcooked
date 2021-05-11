Shader "Hidden/CameraMotionBlur" {
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
			Cull Off
			GpuProgramID 56450
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
						vec4 unused_0_0[3];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[10];
						mat4x4 _ToPrevViewProjCombined;
						float _VelocityScale;
						float _MaxVelocity;
						vec4 unused_0_6[3];
					};
					uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec3 u_xlat1;
					vec2 u_xlat2;
					vec2 u_xlat4;
					float u_xlat6;
					void main()
					{
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat2.x = (-vs_TEXCOORD0.y) + 1.0;
					    u_xlat0.y = (u_xlatb0) ? u_xlat2.x : vs_TEXCOORD0.y;
					    u_xlat0.x = vs_TEXCOORD0.x;
					    u_xlat0 = texture(_CameraDepthTexture, u_xlat0.xy);
					    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat1.xyz = u_xlat2.yyy * _ToPrevViewProjCombined[1].xyw;
					    u_xlat1.xyz = _ToPrevViewProjCombined[0].xyw * u_xlat2.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = _ToPrevViewProjCombined[2].xyw * u_xlat0.xxx + u_xlat1.xyz;
					    u_xlat1.xyz = u_xlat1.xyz + _ToPrevViewProjCombined[3].xyw;
					    u_xlat0.xw = u_xlat1.xy / u_xlat1.zz;
					    u_xlat0.xy = (-u_xlat0.xw) + u_xlat2.xy;
					    u_xlat4.xy = _MainTex_TexelSize.zw * vec2(vec2(_VelocityScale, _VelocityScale));
					    u_xlat0.xy = u_xlat0.xy * u_xlat4.xy;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
					    u_xlat4.x = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat4.x = sqrt(u_xlat4.x);
					    u_xlat6 = min(u_xlat4.x, _MaxVelocity);
					    u_xlat4.x = u_xlat4.x + 0.00999999978;
					    u_xlat6 = max(u_xlat6, 0.5);
					    u_xlat0.xy = vec2(u_xlat6) * u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy / u_xlat4.xx;
					    SV_Target0.xy = u_xlat0.xy * _MainTex_TexelSize.xy;
					    SV_Target0.zw = vec2(0.0, 0.0);
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
			GpuProgramID 77085
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
						vec4 unused_0_0[18];
						float _DisplayVelocityScale;
						vec4 unused_0_2[3];
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.y = abs(u_xlat0.y);
					    u_xlat1.xzw = u_xlat0.xxy * vec3(1.0, -1.0, -1.0);
					    SV_Target0 = u_xlat1 * vec4(vec4(_DisplayVelocityScale, _DisplayVelocityScale, _DisplayVelocityScale, _DisplayVelocityScale));
					    SV_Target0 = clamp(SV_Target0, 0.0, 1.0);
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
			GpuProgramID 139716
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
						float _MaxRadiusOrKInPaper;
						vec4 _MainTex_TexelSize;
						vec4 unused_0_3[18];
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					vec2 u_xlat1;
					vec2 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat6;
					bool u_xlatb6;
					int u_xlati8;
					vec2 u_xlat9;
					bool u_xlatb9;
					int u_xlati10;
					int u_xlati12;
					float u_xlat14;
					bool u_xlatb14;
					void main()
					{
					    u_xlat0.x = _MaxRadiusOrKInPaper * 0.5;
					    u_xlat0.xy = (-_MainTex_TexelSize.xy) * u_xlat0.xx + vs_TEXCOORD0.xy;
					    u_xlati8 = int(_MaxRadiusOrKInPaper);
					    u_xlat1.x = float(0.0);
					    u_xlat1.y = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<u_xlati8 ; u_xlati_loop_1++)
					    {
					        u_xlat2.x = float(u_xlati_loop_1);
					        u_xlat9.xy = u_xlat1.xy;
					        for(int u_xlati_loop_2 = 0 ; u_xlati_loop_2<u_xlati8 ; u_xlati_loop_2++)
					        {
					            u_xlat2.y = float(u_xlati_loop_2);
					            u_xlat6.xz = u_xlat2.xy * _MainTex_TexelSize.xy + u_xlat0.xy;
					            u_xlat3 = textureLod(_MainTex, u_xlat6.xz, 0.0);
					            u_xlat6.x = dot(u_xlat9.xy, u_xlat9.xy);
					            u_xlat14 = dot(u_xlat3.xy, u_xlat3.xy);
					            u_xlatb6 = u_xlat14<u_xlat6.x;
					            u_xlat9.xy = (bool(u_xlatb6)) ? u_xlat9.xy : u_xlat3.xy;
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
			GpuProgramID 196676
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
						vec4 unused_0_0[3];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[18];
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat6;
					bool u_xlatb6;
					float u_xlat9;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
					    u_xlat0 = texture(_MainTex, u_xlat0.xy);
					    u_xlat6 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(1.0, 0.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat9 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlatb6 = u_xlat9<u_xlat6;
					    u_xlat0.xy = (bool(u_xlatb6)) ? u_xlat0.xy : u_xlat2.xy;
					    u_xlat6 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat9 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlatb6 = u_xlat9<u_xlat6;
					    u_xlat0.xy = (bool(u_xlatb6)) ? u_xlat0.xy : u_xlat1.xy;
					    u_xlat6 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(0.0, 1.0, 0.0, -1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat9 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlatb6 = u_xlat9<u_xlat6;
					    u_xlat0.xy = (bool(u_xlatb6)) ? u_xlat0.xy : u_xlat2.xy;
					    u_xlat6 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat9 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlatb6 = u_xlat9<u_xlat6;
					    u_xlat0.xy = (bool(u_xlatb6)) ? u_xlat0.xy : u_xlat2.xy;
					    u_xlat6 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat9 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlatb6 = u_xlat9<u_xlat6;
					    u_xlat0.xy = (bool(u_xlatb6)) ? u_xlat0.xy : u_xlat1.xy;
					    u_xlat6 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
					    u_xlat2 = texture(_MainTex, u_xlat1.xy);
					    u_xlat1 = texture(_MainTex, u_xlat1.zw);
					    u_xlat9 = dot(u_xlat2.xy, u_xlat2.xy);
					    u_xlatb6 = u_xlat9<u_xlat6;
					    u_xlat0.xy = (bool(u_xlatb6)) ? u_xlat0.xy : u_xlat2.xy;
					    u_xlat6 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat9 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlatb6 = u_xlat9<u_xlat6;
					    u_xlat0.xy = (bool(u_xlatb6)) ? u_xlat0.xy : u_xlat1.xy;
					    u_xlat6 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat1.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
					    u_xlat1 = texture(_MainTex, u_xlat1.xy);
					    u_xlat9 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlatb6 = u_xlat9<u_xlat6;
					    SV_Target0.xy = (bool(u_xlatb6)) ? u_xlat0.xy : u_xlat1.xy;
					    SV_Target0.zw = vec2(0.0, 0.0);
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
			GpuProgramID 296783
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
						vec4 unused_0_0[3];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[14];
						float _Jitter;
						vec4 unused_0_4[2];
						float _SoftZDistance;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[7];
						vec4 _ZBufferParams;
						vec4 unused_1_2;
					};
					uniform  sampler2D _NeighbourMaxTex;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _VelTex;
					uniform  sampler2D _CameraDepthTexture;
					uniform  sampler2D _NoiseTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					float u_xlat9;
					float u_xlat10;
					float u_xlat14;
					vec2 u_xlat18;
					float u_xlat19;
					vec2 u_xlat20;
					bool u_xlatb20;
					vec2 u_xlat23;
					float u_xlat24;
					float u_xlat27;
					int u_xlati28;
					float u_xlat29;
					float u_xlat32;
					void main()
					{
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat9 = (-vs_TEXCOORD0.y) + 1.0;
					    u_xlat1.y = (u_xlatb0) ? u_xlat9 : vs_TEXCOORD0.y;
					    u_xlat1.x = vs_TEXCOORD0.x;
					    u_xlat2 = textureLod(_NeighbourMaxTex, u_xlat1.xy, 0.0);
					    u_xlat3 = textureLod(_MainTex, vs_TEXCOORD0.xy, 0.0);
					    u_xlat1 = textureLod(_VelTex, u_xlat1.xy, 0.0);
					    u_xlat4 = textureLod(_CameraDepthTexture, vs_TEXCOORD0.xy, 0.0);
					    u_xlat9 = _ZBufferParams.x * u_xlat4.x + _ZBufferParams.y;
					    u_xlat9 = float(1.0) / u_xlat9;
					    u_xlat18.xy = vs_TEXCOORD0.xy * vec2(11.0, 11.0);
					    u_xlat4 = textureLod(_NoiseTex, u_xlat18.xy, 0.0);
					    u_xlat18.x = u_xlat4.x * 2.0 + -1.0;
					    u_xlat3 = u_xlat3 * vec4(0.75, 0.75, 0.75, 0.75);
					    u_xlat27 = _Jitter + 10.0;
					    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.x = sqrt(u_xlat1.x);
					    u_xlat10 = u_xlat1.x * 0.0999999642;
					    u_xlat10 = float(1.0) / u_xlat10;
					    u_xlat4 = u_xlat3;
					    u_xlat19 = float(0.75);
					    u_xlati28 = int(0);
					    while(true){
					        u_xlatb20 = u_xlati28>=11;
					        if(u_xlatb20){break;}
					        u_xlatb20 = u_xlati28==5;
					        if(u_xlatb20){
					            u_xlati28 = 6;
					            continue;
					        }
					        u_xlat20.x = float(u_xlati28);
					        u_xlat20.x = u_xlat18.x * _Jitter + u_xlat20.x;
					        u_xlat20.x = u_xlat20.x / u_xlat27;
					        u_xlat20.x = u_xlat20.x * 2.0 + -1.0;
					        u_xlat5.xy = u_xlat20.xx * u_xlat2.xy;
					        u_xlat6.xy = u_xlat2.xy * u_xlat20.xx + vs_TEXCOORD0.xy;
					        u_xlat20.x = (-u_xlat6.y) + 1.0;
					        u_xlat6.z = (u_xlatb0) ? u_xlat20.x : u_xlat6.y;
					        u_xlat7 = textureLod(_VelTex, u_xlat6.xz, 0.0);
					        u_xlat8 = textureLod(_CameraDepthTexture, u_xlat6.xy, 0.0);
					        u_xlat20.x = _ZBufferParams.x * u_xlat8.x + _ZBufferParams.y;
					        u_xlat20.x = float(1.0) / u_xlat20.x;
					        u_xlat29 = (-u_xlat9) + u_xlat20.x;
					        u_xlat20.y = u_xlat29 / _SoftZDistance;
					        u_xlat20.x = u_xlat9 + (-u_xlat20.x);
					        u_xlat20.x = u_xlat20.x / _SoftZDistance;
					        u_xlat20.xy = (-u_xlat20.xy) + vec2(1.0, 1.0);
					        u_xlat20.xy = clamp(u_xlat20.xy, 0.0, 1.0);
					        u_xlat23.xy = (-u_xlat6.xy) + vs_TEXCOORD0.xy;
					        u_xlat23.x = dot(u_xlat23.xy, u_xlat23.xy);
					        u_xlat23.x = sqrt(u_xlat23.x);
					        u_xlat32 = u_xlat23.x / u_xlat1.x;
					        u_xlat32 = (-u_xlat32) + 1.0;
					        u_xlat32 = max(u_xlat32, 0.0);
					        u_xlat5.x = dot(u_xlat5.xy, u_xlat5.xy);
					        u_xlat5.y = dot(u_xlat7.xy, u_xlat7.xy);
					        u_xlat5.xy = sqrt(u_xlat5.xy);
					        u_xlat24 = u_xlat5.x / u_xlat5.y;
					        u_xlat24 = (-u_xlat24) + 1.0;
					        u_xlat24 = max(u_xlat24, 0.0);
					        u_xlat29 = u_xlat20.y * u_xlat24;
					        u_xlat20.x = u_xlat20.x * u_xlat32 + u_xlat29;
					        u_xlat29 = u_xlat5.y * 0.0999999642;
					        u_xlat5.x = (-u_xlat5.y) * 0.949999988 + u_xlat5.x;
					        u_xlat29 = float(1.0) / u_xlat29;
					        u_xlat29 = u_xlat29 * u_xlat5.x;
					        u_xlat29 = clamp(u_xlat29, 0.0, 1.0);
					        u_xlat5.x = u_xlat29 * -2.0 + 3.0;
					        u_xlat29 = u_xlat29 * u_xlat29;
					        u_xlat29 = (-u_xlat5.x) * u_xlat29 + 1.0;
					        u_xlat5.x = (-u_xlat1.x) * 0.949999988 + u_xlat23.x;
					        u_xlat5.x = u_xlat10 * u_xlat5.x;
					        u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
					        u_xlat14 = u_xlat5.x * -2.0 + 3.0;
					        u_xlat5.x = u_xlat5.x * u_xlat5.x;
					        u_xlat5.x = (-u_xlat14) * u_xlat5.x + 1.0;
					        u_xlat29 = dot(vec2(u_xlat29), u_xlat5.xx);
					        u_xlat20.x = u_xlat29 + u_xlat20.x;
					        u_xlat5 = textureLod(_MainTex, u_xlat6.xy, 0.0);
					        u_xlat4 = u_xlat5 * u_xlat20.xxxx + u_xlat4;
					        u_xlat19 = u_xlat19 + u_xlat20.x;
					        u_xlati28 = u_xlati28 + 1;
					    }
					    SV_Target0 = u_xlat4 / vec4(u_xlat19);
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
			GpuProgramID 390526
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
						vec4 unused_0_0[3];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[18];
					};
					uniform  sampler2D _VelTex;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					float u_xlat3;
					int u_xlati6;
					float u_xlat9;
					bool u_xlatb9;
					void main()
					{
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat3 = (-vs_TEXCOORD0.y) + 1.0;
					    u_xlat0.y = (u_xlatb0) ? u_xlat3 : vs_TEXCOORD0.y;
					    u_xlat0.x = vs_TEXCOORD0.x;
					    u_xlat0 = texture(_VelTex, u_xlat0.xy);
					    u_xlat1.x = float(0.0);
					    u_xlat1.y = float(0.0);
					    u_xlat1.z = float(0.0);
					    u_xlat1.w = float(0.0);
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<11 ; u_xlati_loop_1++)
					    {
					        u_xlat9 = float(u_xlati_loop_1);
					        u_xlat9 = u_xlat9 * 0.100000001 + -0.5;
					        u_xlat2.xy = (-u_xlat0.xy) * vec2(u_xlat9) + vs_TEXCOORD0.xy;
					        u_xlat2 = texture(_MainTex, u_xlat2.xy);
					        u_xlat1 = u_xlat1 + u_xlat2;
					    }
					    SV_Target0 = u_xlat1 * vec4(0.0909090936, 0.0909090936, 0.0909090936, 0.0909090936);
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
			GpuProgramID 413011
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
						vec4 unused_0_0[3];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[14];
						float _VelocityScale;
						float _MaxVelocity;
						float _MinVelocity;
						vec4 _BlurDirectionPacked;
						vec4 unused_0_7;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec3 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec2 u_xlat8;
					int u_xlati8;
					float u_xlat12;
					bool u_xlatb12;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat1.y = _MainTex_TexelSize.w / _MainTex_TexelSize.z;
					    u_xlat1.x = 1.0;
					    u_xlat0.xy = u_xlat0.xy * u_xlat1.xy;
					    u_xlat1 = _BlurDirectionPacked.xxyy * vec4(0.0, 1.0, 1.0, 0.0);
					    u_xlat1.xy = u_xlat1.zw + u_xlat1.xy;
					    u_xlat0.z = (-u_xlat0.x);
					    u_xlat8.xy = _BlurDirectionPacked.zz * u_xlat0.yz + u_xlat1.xy;
					    u_xlat0.xy = _BlurDirectionPacked.ww * u_xlat0.xy + u_xlat8.xy;
					    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_VelocityScale, _VelocityScale));
					    u_xlat12 = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat0.z = sqrt(u_xlat12);
					    u_xlatb12 = _MaxVelocity<u_xlat0.z;
					    u_xlat1.x = _MaxVelocity / u_xlat0.z;
					    u_xlat1.xy = u_xlat0.xy * u_xlat1.xx;
					    u_xlat1.z = _MaxVelocity;
					    u_xlat0.xyz = (bool(u_xlatb12)) ? u_xlat1.xyz : u_xlat0.xyz;
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat12 = _MinVelocity * 2.25;
					    u_xlat8.x = (-_MinVelocity) * 0.25 + u_xlat0.z;
					    u_xlat12 = float(1.0) / u_xlat12;
					    u_xlat8.x = u_xlat12 * u_xlat8.x;
					    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
					    u_xlat12 = u_xlat8.x * -2.0 + 3.0;
					    u_xlat8.x = u_xlat8.x * u_xlat8.x;
					    u_xlat8.x = u_xlat8.x * u_xlat12;
					    u_xlat0.xy = u_xlat8.xx * u_xlat0.xy;
					    u_xlat0.xy = u_xlat0.xy * _MainTex_TexelSize.xy;
					    u_xlat0.xy = u_xlat0.xy * vec2(0.0625, 0.0625);
					    u_xlat2 = u_xlat1;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<16 ; u_xlati_loop_1++)
					    {
					        u_xlat12 = float(u_xlati_loop_1);
					        u_xlat3.xy = vec2(u_xlat12) * u_xlat0.xy + vs_TEXCOORD0.xy;
					        u_xlat3 = texture(_MainTex, u_xlat3.xy);
					        u_xlat2 = u_xlat2 + u_xlat3;
					    }
					    SV_Target0 = u_xlat2 * vec4(0.0588235296, 0.0588235296, 0.0588235296, 0.0588235296);
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
			GpuProgramID 522020
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
					vec2 ImmCB_0_0_0[12];
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[3];
						vec4 _MainTex_TexelSize;
						vec4 unused_0_2[14];
						float _Jitter;
						float _MaxVelocity;
						vec4 unused_0_5[2];
						float _SoftZDistance;
					};
					layout(std140) uniform UnityPerCamera {
						vec4 unused_1_0[7];
						vec4 _ZBufferParams;
						vec4 unused_1_2;
					};
					uniform  sampler2D _NeighbourMaxTex;
					uniform  sampler2D _MainTex;
					uniform  sampler2D _VelTex;
					uniform  sampler2D _NoiseTex;
					uniform  sampler2D _CameraDepthTexture;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					bool u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					ivec4 u_xlati2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					ivec4 u_xlati5;
					vec4 u_xlat6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec4 u_xlat9;
					vec2 u_xlat10;
					int u_xlati14;
					float u_xlat15;
					vec2 u_xlat16;
					float u_xlat20;
					vec2 u_xlat24;
					bool u_xlatb24;
					float u_xlat27;
					float u_xlat30;
					float u_xlat34;
					float u_xlat36;
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
					    u_xlatb0 = _MainTex_TexelSize.y<0.0;
					    u_xlat10.x = (-vs_TEXCOORD0.y) + 1.0;
					    u_xlat1.y = (u_xlatb0) ? u_xlat10.x : vs_TEXCOORD0.y;
					    u_xlat1.x = vs_TEXCOORD0.x;
					    u_xlat2 = textureLod(_NeighbourMaxTex, u_xlat1.xy, 0.0);
					    u_xlat3 = textureLod(_MainTex, vs_TEXCOORD0.xy, 0.0);
					    u_xlat1 = textureLod(_VelTex, u_xlat1.xy, 0.0);
					    u_xlat10.xy = vs_TEXCOORD0.xy * vec2(11.0, 11.0);
					    u_xlat4 = textureLod(_NoiseTex, u_xlat10.xy, 0.0);
					    u_xlat4 = u_xlat4.xyxy * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
					    u_xlat5 = textureLod(_CameraDepthTexture, vs_TEXCOORD0.xy, 0.0);
					    u_xlat10.x = _ZBufferParams.x * u_xlat5.x + _ZBufferParams.y;
					    u_xlat10.x = float(1.0) / u_xlat10.x;
					    u_xlat5 = _MainTex_TexelSize.xyxy * vec4(_Jitter, _Jitter, _MaxVelocity, _MaxVelocity);
					    u_xlat2 = u_xlat4 * u_xlat5.xyxy + u_xlat2.xyxy;
					    u_xlat4 = u_xlat5.zwzw * vec4(0.5, 0.5, 0.5, 0.5);
					    u_xlat4 = max(abs(u_xlat2.zwzw), u_xlat4);
					    u_xlati5 = ivec4(uvec4(lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat2.zwzw)) * 0xFFFFFFFFu);
					    u_xlati2 = ivec4(uvec4(lessThan(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0))) * 0xFFFFFFFFu);
					    u_xlati2 = (-u_xlati5) + u_xlati2;
					    u_xlat2 = vec4(u_xlati2);
					    u_xlat2 = u_xlat2 * u_xlat4;
					    u_xlat20 = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat20 = sqrt(u_xlat20);
					    u_xlat30 = u_xlat20 * 0.0999999642;
					    u_xlat30 = float(1.0) / u_xlat30;
					    u_xlat1 = u_xlat3;
					    u_xlat4.x = float(1.0);
					    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<12 ; u_xlati_loop_1++)
					    {
					        u_xlat5 = u_xlat2 * ImmCB_0_0_0[u_xlati_loop_1].xyxy;
					        u_xlat6 = u_xlat5 * vec4(1.0, 1.0, -1.0, -1.0);
					        u_xlat5 = u_xlat5 * vec4(1.0, 1.0, -1.0, -1.0) + vs_TEXCOORD0.xyxy;
					        u_xlat24.xy = (-u_xlat5.yw) + vec2(1.0, 1.0);
					        u_xlat7.xy = (bool(u_xlatb0)) ? u_xlat24.xy : u_xlat5.yw;
					        u_xlat7.zw = u_xlat5.xz;
					        u_xlat8 = textureLod(_VelTex, u_xlat7.zx, 0.0);
					        u_xlat9 = textureLod(_CameraDepthTexture, u_xlat5.xy, 0.0);
					        u_xlat24.x = _ZBufferParams.x * u_xlat9.x + _ZBufferParams.y;
					        u_xlat24.x = float(1.0) / u_xlat24.x;
					        u_xlat34 = (-u_xlat10.x) + u_xlat24.x;
					        u_xlat24.y = u_xlat34 / _SoftZDistance;
					        u_xlat24.x = u_xlat10.x + (-u_xlat24.x);
					        u_xlat24.x = u_xlat24.x / _SoftZDistance;
					        u_xlat24.xy = (-u_xlat24.xy) + vec2(1.0, 1.0);
					        u_xlat24.xy = clamp(u_xlat24.xy, 0.0, 1.0);
					        u_xlat7.xz = (-u_xlat5.xy) + vs_TEXCOORD0.xy;
					        u_xlat7.x = dot(u_xlat7.xz, u_xlat7.xz);
					        u_xlat7.x = sqrt(u_xlat7.x);
					        u_xlat27 = u_xlat7.x / u_xlat20;
					        u_xlat27 = (-u_xlat27) + 1.0;
					        u_xlat27 = max(u_xlat27, 0.0);
					        u_xlat6.x = dot(u_xlat6.xy, u_xlat6.xy);
					        u_xlat6.y = dot(u_xlat8.xy, u_xlat8.xy);
					        u_xlat6.xy = sqrt(u_xlat6.xy);
					        u_xlat8.x = u_xlat6.x / u_xlat6.y;
					        u_xlat8.x = (-u_xlat8.x) + 1.0;
					        u_xlat8.x = max(u_xlat8.x, 0.0);
					        u_xlat34 = u_xlat24.y * u_xlat8.x;
					        u_xlat24.x = u_xlat24.x * u_xlat27 + u_xlat34;
					        u_xlat34 = u_xlat6.y * 0.0999999642;
					        u_xlat6.x = (-u_xlat6.y) * 0.949999988 + u_xlat6.x;
					        u_xlat34 = float(1.0) / u_xlat34;
					        u_xlat34 = u_xlat34 * u_xlat6.x;
					        u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
					        u_xlat6.x = u_xlat34 * -2.0 + 3.0;
					        u_xlat34 = u_xlat34 * u_xlat34;
					        u_xlat34 = (-u_xlat6.x) * u_xlat34 + 1.0;
					        u_xlat6.x = (-u_xlat20) * 0.949999988 + u_xlat7.x;
					        u_xlat6.x = u_xlat30 * u_xlat6.x;
					        u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
					        u_xlat16.x = u_xlat6.x * -2.0 + 3.0;
					        u_xlat6.x = u_xlat6.x * u_xlat6.x;
					        u_xlat6.x = (-u_xlat16.x) * u_xlat6.x + 1.0;
					        u_xlat34 = dot(vec2(u_xlat34), u_xlat6.xx);
					        u_xlat24.x = u_xlat34 + u_xlat24.x;
					        u_xlat8 = textureLod(_MainTex, u_xlat5.xy, 0.0);
					        u_xlat8 = u_xlat8 * u_xlat24.xxxx + u_xlat1;
					        u_xlat24.x = u_xlat24.x + u_xlat4.x;
					        u_xlat7 = textureLod(_VelTex, u_xlat7.wy, 0.0);
					        u_xlat9 = textureLod(_CameraDepthTexture, u_xlat5.zw, 0.0);
					        u_xlat34 = _ZBufferParams.x * u_xlat9.x + _ZBufferParams.y;
					        u_xlat34 = float(1.0) / u_xlat34;
					        u_xlat5.x = (-u_xlat10.x) + u_xlat34;
					        u_xlat5.x = u_xlat5.x / _SoftZDistance;
					        u_xlat5.x = (-u_xlat5.x) + 1.0;
					        u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
					        u_xlat34 = u_xlat10.x + (-u_xlat34);
					        u_xlat34 = u_xlat34 / _SoftZDistance;
					        u_xlat34 = (-u_xlat34) + 1.0;
					        u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
					        u_xlat6.xy = (-u_xlat5.zw) + vs_TEXCOORD0.xy;
					        u_xlat15 = dot(u_xlat6.xy, u_xlat6.xy);
					        u_xlat15 = sqrt(u_xlat15);
					        u_xlat6.x = u_xlat15 / u_xlat20;
					        u_xlat6.x = (-u_xlat6.x) + 1.0;
					        u_xlat16.x = dot(u_xlat6.zw, u_xlat6.zw);
					        u_xlat16.y = dot(u_xlat7.xy, u_xlat7.xy);
					        u_xlat16.xy = sqrt(u_xlat16.xy);
					        u_xlat36 = u_xlat16.x / u_xlat16.y;
					        u_xlat6.w = (-u_xlat36) + 1.0;
					        u_xlat6.xw = max(u_xlat6.xw, vec2(0.0, 0.0));
					        u_xlat5.x = u_xlat5.x * u_xlat6.w;
					        u_xlat34 = u_xlat34 * u_xlat6.x + u_xlat5.x;
					        u_xlat5.x = u_xlat16.y * 0.0999999642;
					        u_xlat6.x = (-u_xlat16.y) * 0.949999988 + u_xlat16.x;
					        u_xlat5.x = float(1.0) / u_xlat5.x;
					        u_xlat5.x = u_xlat5.x * u_xlat6.x;
					        u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
					        u_xlat6.x = u_xlat5.x * -2.0 + 3.0;
					        u_xlat5.x = u_xlat5.x * u_xlat5.x;
					        u_xlat5.x = (-u_xlat6.x) * u_xlat5.x + 1.0;
					        u_xlat15 = (-u_xlat20) * 0.949999988 + u_xlat15;
					        u_xlat15 = u_xlat30 * u_xlat15;
					        u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
					        u_xlat6.x = u_xlat15 * -2.0 + 3.0;
					        u_xlat15 = u_xlat15 * u_xlat15;
					        u_xlat15 = (-u_xlat6.x) * u_xlat15 + 1.0;
					        u_xlat5.x = dot(u_xlat5.xx, vec2(u_xlat15));
					        u_xlat34 = u_xlat34 + u_xlat5.x;
					        u_xlat5 = textureLod(_MainTex, u_xlat5.zw, 0.0);
					        u_xlat1 = u_xlat5 * vec4(u_xlat34) + u_xlat8;
					        u_xlat4.x = u_xlat34 + u_xlat24.x;
					    }
					    SV_Target0 = u_xlat1 / u_xlat4.xxxx;
					    return;
					}"
				}
			}
		}
	}
}