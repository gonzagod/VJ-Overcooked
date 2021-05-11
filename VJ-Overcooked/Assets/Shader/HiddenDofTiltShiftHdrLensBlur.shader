Shader "Hidden/Dof/TiltShiftHdrLensBlur" {
	Properties {
		_MainTex ("-", 2D) = "" {}
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 16901
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
					    phase0_Output0_1.w = (u_xlatb0) ? u_xlat1 : in_TEXCOORD0.y;
					    phase0_Output0_1.xyz = in_TEXCOORD0.xyx;
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
						float _BlurArea;
					};
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					float u_xlat0;
					void main()
					{
					    u_xlat0 = vs_TEXCOORD0.y * 2.0 + -1.0;
					    u_xlat0 = u_xlat0 * _BlurArea;
					    SV_Target0 = abs(vec4(u_xlat0)) * vec4(0.5, 0.5, 0.5, 0.5);
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
			GpuProgramID 67971
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
					    phase0_Output0_1.w = (u_xlatb0) ? u_xlat1 : in_TEXCOORD0.y;
					    phase0_Output0_1.xyz = in_TEXCOORD0.xyx;
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
						float _BlurArea;
					};
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec2 u_xlat0;
					void main()
					{
					    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
					    u_xlat0.x = u_xlat0.x * _BlurArea;
					    SV_Target0 = u_xlat0.xxxx * vec4(0.5, 0.5, 0.5, 0.5);
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
			GpuProgramID 161363
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
					    phase0_Output0_1.w = (u_xlatb0) ? u_xlat1 : in_TEXCOORD0.y;
					    phase0_Output0_1.xyz = in_TEXCOORD0.xyx;
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
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _MainTex_TexelSize;
						float _BlurSize;
						float _BlurArea;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec2 u_xlat5;
					bool u_xlatb5;
					int u_xlati12;
					bool u_xlatb13;
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
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1 = vs_TEXCOORD0.y * 2.0 + -1.0;
					    u_xlat1 = u_xlat1 * _BlurArea;
					    u_xlat1 = min(abs(u_xlat1), _BlurSize);
					    u_xlatb5 = u_xlat1<0.00999999978;
					    if(u_xlatb5){
					        SV_Target0 = u_xlat0;
					        return;
					    }
					    u_xlat5.xy = vec2(u_xlat1) * _MainTex_TexelSize.xy;
					    u_xlat2.xyz = u_xlat0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<28 ; u_xlati_loop_1++)
					    {
					        u_xlat3.xy = ImmCB_0_0_0[u_xlati_loop_1].xy * u_xlat5.xy + vs_TEXCOORD0.xy;
					        u_xlat3 = textureLod(_MainTex, u_xlat3.xy, 1.0);
					        u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
					    }
					    SV_Target0.xyz = u_xlat2.xyz * vec3(0.0344827585, 0.0344827585, 0.0344827585);
					    SV_Target0.w = u_xlat1;
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
			GpuProgramID 202391
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
					    phase0_Output0_1.w = (u_xlatb0) ? u_xlat1 : in_TEXCOORD0.y;
					    phase0_Output0_1.xyz = in_TEXCOORD0.xyx;
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
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _MainTex_TexelSize;
						float _BlurSize;
						float _BlurArea;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec2 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec2 u_xlat5;
					bool u_xlatb5;
					int u_xlati12;
					bool u_xlatb13;
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
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.x = u_xlat1.x * _BlurArea;
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat1.x = min(u_xlat1.x, _BlurSize);
					    u_xlatb5 = u_xlat1.x<0.00999999978;
					    if(u_xlatb5){
					        SV_Target0 = u_xlat0;
					        return;
					    }
					    u_xlat5.xy = u_xlat1.xx * _MainTex_TexelSize.xy;
					    u_xlat2.xyz = u_xlat0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<28 ; u_xlati_loop_1++)
					    {
					        u_xlat3.xy = ImmCB_0_0_0[u_xlati_loop_1].xy * u_xlat5.xy + vs_TEXCOORD0.xy;
					        u_xlat3 = textureLod(_MainTex, u_xlat3.xy, 1.0);
					        u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
					    }
					    SV_Target0.xyz = u_xlat2.xyz * vec3(0.0344827585, 0.0344827585, 0.0344827585);
					    SV_Target0.w = u_xlat1.x;
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
			GpuProgramID 299771
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
					    phase0_Output0_1.w = (u_xlatb0) ? u_xlat1 : in_TEXCOORD0.y;
					    phase0_Output0_1.xyz = in_TEXCOORD0.xyx;
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
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _MainTex_TexelSize;
						float _BlurSize;
						float _BlurArea;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec3 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					bool u_xlatb3;
					vec4 u_xlat4;
					vec3 u_xlat6;
					int u_xlati15;
					bool u_xlatb16;
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
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.x = vs_TEXCOORD0.y * 2.0 + -1.0;
					    u_xlat1.x = u_xlat1.x * _BlurArea;
					    u_xlat1.x = min(abs(u_xlat1.x), _BlurSize);
					    u_xlatb16 = u_xlat1.x<0.00999999978;
					    if(u_xlatb16){
					        SV_Target0 = u_xlat0;
					        return;
					    }
					    u_xlat1.y = float(1.0);
					    u_xlat1.z = float(-1.0);
					    u_xlat2 = u_xlat1.yyxx * _MainTex_TexelSize.xyxy;
					    u_xlat2 = u_xlat1.xxzz * u_xlat2;
					    u_xlat6.xyz = u_xlat0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<28 ; u_xlati_loop_1++)
					    {
					        u_xlat3 = ImmCB_0_0_0[u_xlati_loop_1].xyxy * u_xlat2 + vs_TEXCOORD0.xyxy;
					        u_xlat4 = textureLod(_MainTex, u_xlat3.xy, 1.0);
					        u_xlat3 = textureLod(_MainTex, u_xlat3.zw, 1.0);
					        u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
					        u_xlat6.xyz = u_xlat6.xyz + u_xlat3.xyz;
					    }
					    SV_Target0.xyz = u_xlat6.xyz * vec3(0.0175438598, 0.0175438598, 0.0175438598);
					    SV_Target0.w = u_xlat1.x;
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
			GpuProgramID 348277
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
					    phase0_Output0_1.w = (u_xlatb0) ? u_xlat1 : in_TEXCOORD0.y;
					    phase0_Output0_1.xyz = in_TEXCOORD0.xyx;
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
					layout(std140) uniform PGlobals {
						vec4 unused_0_0[2];
						vec4 _MainTex_TexelSize;
						float _BlurSize;
						float _BlurArea;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec2 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					bool u_xlatb3;
					vec4 u_xlat4;
					vec3 u_xlat6;
					bool u_xlatb6;
					int u_xlati15;
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
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
					    u_xlat1.x = u_xlat1.x * _BlurArea;
					    u_xlat1.x = max(u_xlat1.x, 0.0);
					    u_xlat1.x = min(u_xlat1.x, _BlurSize);
					    u_xlatb6 = u_xlat1.x<0.00999999978;
					    if(u_xlatb6){
					        SV_Target0 = u_xlat0;
					        return;
					    }
					    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(2.0, 2.0, -2.0, -2.0);
					    u_xlat6.xyz = u_xlat0.xyz;
					    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<28 ; u_xlati_loop_1++)
					    {
					        u_xlat3 = ImmCB_0_0_0[u_xlati_loop_1].xyxy * u_xlat2 + vs_TEXCOORD0.xyxy;
					        u_xlat4 = textureLod(_MainTex, u_xlat3.xy, 1.0);
					        u_xlat3 = textureLod(_MainTex, u_xlat3.zw, 1.0);
					        u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
					        u_xlat6.xyz = u_xlat6.xyz + u_xlat3.xyz;
					    }
					    SV_Target0.xyz = u_xlat6.xyz * vec3(0.0175438598, 0.0175438598, 0.0175438598);
					    SV_Target0.w = u_xlat1.x;
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
			GpuProgramID 409905
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
					    phase0_Output0_1.w = (u_xlatb0) ? u_xlat1 : in_TEXCOORD0.y;
					    phase0_Output0_1.xyz = in_TEXCOORD0.xyx;
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
					uniform  sampler2D _Blurred;
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					float u_xlat1;
					vec4 u_xlat2;
					void main()
					{
					    u_xlat0 = texture(_Blurred, vs_TEXCOORD1.xy);
					    u_xlat1 = u_xlat0.w;
					    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0 = u_xlat0 + (-u_xlat2);
					    SV_Target0 = vec4(u_xlat1) * u_xlat0 + u_xlat2;
					    return;
					}"
				}
			}
		}
	}
}