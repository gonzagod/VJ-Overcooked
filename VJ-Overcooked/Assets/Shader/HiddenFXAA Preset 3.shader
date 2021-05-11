Shader "Hidden/FXAA Preset 3" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 3487
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
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec4 u_xlat6;
					int u_xlati6;
					vec4 u_xlat7;
					vec4 u_xlat8;
					vec2 u_xlat10;
					bool u_xlatb10;
					float u_xlat12;
					bool u_xlatb12;
					float u_xlat13;
					float u_xlat14;
					bool u_xlatb14;
					int u_xlati15;
					vec2 u_xlat16;
					int u_xlati16;
					bool u_xlatb16;
					float u_xlat19;
					vec2 u_xlat21;
					bool u_xlatb21;
					vec2 u_xlat22;
					vec2 u_xlat23;
					int u_xlati24;
					float u_xlat27;
					int u_xlati27;
					bool u_xlatb27;
					float u_xlat28;
					float u_xlat29;
					int u_xlati29;
					float u_xlat30;
					float u_xlat31;
					float u_xlat33;
					bool u_xlatb33;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
					    u_xlat1 = textureLod(_MainTex, u_xlat0.xy, 0.0);
					    u_xlat0 = textureLod(_MainTex, u_xlat0.zw, 0.0);
					    u_xlat2 = textureLod(_MainTex, vs_TEXCOORD0.xy, 0.0);
					    u_xlat3 = _MainTex_TexelSize.xyxy * vec4(1.0, 0.0, 0.0, 1.0) + vs_TEXCOORD0.xyxy;
					    u_xlat4 = textureLod(_MainTex, u_xlat3.xy, 0.0);
					    u_xlat3 = textureLod(_MainTex, u_xlat3.zw, 0.0);
					    u_xlat27 = u_xlat1.y * 1.9632107 + u_xlat1.x;
					    u_xlat28 = u_xlat0.y * 1.9632107 + u_xlat0.x;
					    u_xlat29 = u_xlat2.y * 1.9632107 + u_xlat2.x;
					    u_xlat30 = u_xlat4.y * 1.9632107 + u_xlat4.x;
					    u_xlat31 = u_xlat3.y * 1.9632107 + u_xlat3.x;
					    u_xlat5.x = min(u_xlat27, u_xlat28);
					    u_xlat14 = min(u_xlat30, u_xlat31);
					    u_xlat5.x = min(u_xlat14, u_xlat5.x);
					    u_xlat5.x = min(u_xlat29, u_xlat5.x);
					    u_xlat14 = max(u_xlat27, u_xlat28);
					    u_xlat23.x = max(u_xlat30, u_xlat31);
					    u_xlat14 = max(u_xlat23.x, u_xlat14);
					    u_xlat14 = max(u_xlat29, u_xlat14);
					    u_xlat5.x = (-u_xlat5.x) + u_xlat14;
					    u_xlat14 = u_xlat14 * 0.125;
					    u_xlat14 = max(u_xlat14, 0.0416666679);
					    u_xlatb14 = u_xlat5.x>=u_xlat14;
					    if(u_xlatb14){
					        u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
					        u_xlat0.xyz = u_xlat2.xyz + u_xlat0.xyz;
					        u_xlat0.xyz = u_xlat4.xyz + u_xlat0.xyz;
					        u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
					        u_xlat1.x = u_xlat27 + u_xlat28;
					        u_xlat1.x = u_xlat30 + u_xlat1.x;
					        u_xlat1.x = u_xlat31 + u_xlat1.x;
					        u_xlat1.x = u_xlat1.x * 0.25 + (-u_xlat29);
					        u_xlat1.x = abs(u_xlat1.x) / u_xlat5.x;
					        u_xlat1.x = u_xlat1.x + -0.25;
					        u_xlat1.x = max(u_xlat1.x, 0.0);
					        u_xlat1.x = u_xlat1.x * 1.33333337;
					        u_xlat1.x = min(u_xlat1.x, 0.75);
					        u_xlat10.xy = vs_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
					        u_xlat5 = textureLod(_MainTex, u_xlat10.xy, 0.0);
					        u_xlat6 = _MainTex_TexelSize.xyxy * vec4(1.0, -1.0, -1.0, 1.0) + vs_TEXCOORD0.xyxy;
					        u_xlat7 = textureLod(_MainTex, u_xlat6.xy, 0.0);
					        u_xlat6 = textureLod(_MainTex, u_xlat6.zw, 0.0);
					        u_xlat10.xy = vs_TEXCOORD0.xy + _MainTex_TexelSize.xy;
					        u_xlat8 = textureLod(_MainTex, u_xlat10.xy, 0.0);
					        u_xlat3.xyz = u_xlat5.xyz + u_xlat7.xyz;
					        u_xlat3.xyz = u_xlat6.xyz + u_xlat3.xyz;
					        u_xlat3.xyz = u_xlat8.xyz + u_xlat3.xyz;
					        u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
					        u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
					        u_xlat10.x = u_xlat5.y * 1.9632107 + u_xlat5.x;
					        u_xlat19 = u_xlat7.y * 1.9632107 + u_xlat7.x;
					        u_xlat3.x = u_xlat6.y * 1.9632107 + u_xlat6.x;
					        u_xlat12 = u_xlat8.y * 1.9632107 + u_xlat8.x;
					        u_xlat21.x = u_xlat27 * -0.5;
					        u_xlat21.x = u_xlat10.x * 0.25 + u_xlat21.x;
					        u_xlat21.x = u_xlat19 * 0.25 + u_xlat21.x;
					        u_xlat4.x = u_xlat28 * -0.5;
					        u_xlat13 = u_xlat28 * 0.5 + (-u_xlat29);
					        u_xlat22.x = u_xlat30 * -0.5;
					        u_xlat13 = u_xlat30 * 0.5 + u_xlat13;
					        u_xlat21.x = abs(u_xlat21.x) + abs(u_xlat13);
					        u_xlat13 = u_xlat31 * -0.5;
					        u_xlat13 = u_xlat3.x * 0.25 + u_xlat13;
					        u_xlat13 = u_xlat12 * 0.25 + u_xlat13;
					        u_xlat21.x = u_xlat21.x + abs(u_xlat13);
					        u_xlat10.x = u_xlat10.x * 0.25 + u_xlat4.x;
					        u_xlat10.x = u_xlat3.x * 0.25 + u_xlat10.x;
					        u_xlat3.x = u_xlat27 * 0.5 + (-u_xlat29);
					        u_xlat3.x = u_xlat31 * 0.5 + u_xlat3.x;
					        u_xlat10.x = abs(u_xlat10.x) + abs(u_xlat3.x);
					        u_xlat19 = u_xlat19 * 0.25 + u_xlat22.x;
					        u_xlat19 = u_xlat12 * 0.25 + u_xlat19;
					        u_xlat10.x = abs(u_xlat19) + u_xlat10.x;
					        u_xlatb10 = u_xlat10.x>=u_xlat21.x;
					        u_xlat19 = (u_xlatb10) ? (-_MainTex_TexelSize.y) : (-_MainTex_TexelSize.x);
					        u_xlat27 = (u_xlatb10) ? u_xlat27 : u_xlat28;
					        u_xlat28 = (u_xlatb10) ? u_xlat31 : u_xlat30;
					        u_xlat3.x = (-u_xlat29) + u_xlat27;
					        u_xlat12 = (-u_xlat29) + u_xlat28;
					        u_xlat27 = u_xlat29 + u_xlat27;
					        u_xlat27 = u_xlat27 * 0.5;
					        u_xlat28 = u_xlat29 + u_xlat28;
					        u_xlat28 = u_xlat28 * 0.5;
					        u_xlatb21 = abs(u_xlat3.x)>=abs(u_xlat12);
					        u_xlat27 = (u_xlatb21) ? u_xlat27 : u_xlat28;
					        u_xlat28 = (u_xlatb21) ? abs(u_xlat3.x) : abs(u_xlat12);
					        u_xlat19 = (u_xlatb21) ? u_xlat19 : (-u_xlat19);
					        u_xlat3.x = u_xlat19 * 0.5;
					        u_xlat3.y = (u_xlatb10) ? 0.0 : u_xlat3.x;
					        u_xlat3.x = u_xlatb10 ? u_xlat3.x : float(0.0);
					        u_xlat4.xy = u_xlat3.yx + vs_TEXCOORD0.xy;
					        u_xlat28 = u_xlat28 * 0.25;
					        u_xlat3.y = float(0.0);
					        u_xlat3.z = float(0.0);
					        u_xlat3.xw = _MainTex_TexelSize.xy;
					        u_xlat3.xy = (bool(u_xlatb10)) ? u_xlat3.xy : u_xlat3.zw;
					        u_xlat21.xy = (-u_xlat3.xy) + u_xlat4.xy;
					        u_xlat4.xy = u_xlat3.xy + u_xlat4.xy;
					        u_xlat22.xy = u_xlat21.xy;
					        u_xlat5.xy = u_xlat4.xy;
					        u_xlat23.xy = vec2(u_xlat27);
					        u_xlati6 = int(0);
					        u_xlati15 = int(0);
					        u_xlati24 = int(0);
					        while(true){
					            u_xlatb33 = u_xlati24>=16;
					            if(u_xlatb33){break;}
					            if(u_xlati6 == 0) {
					                u_xlat7 = textureLod(_MainTex, u_xlat22.xy, 0.0);
					                u_xlat33 = u_xlat7.y * 1.9632107 + u_xlat7.x;
					            } else {
					                u_xlat33 = u_xlat23.x;
					            }
					            if(u_xlati15 == 0) {
					                u_xlat7 = textureLod(_MainTex, u_xlat5.xy, 0.0);
					                u_xlat7.x = u_xlat7.y * 1.9632107 + u_xlat7.x;
					            } else {
					                u_xlat7.x = u_xlat23.y;
					            }
					            u_xlat16.x = (-u_xlat27) + u_xlat33;
					            u_xlatb16 = abs(u_xlat16.x)>=u_xlat28;
					            u_xlati6 = int(uint(u_xlati6) | (uint(u_xlatb16) * 0xffffffffu));
					            u_xlat16.x = (-u_xlat27) + u_xlat7.x;
					            u_xlatb16 = abs(u_xlat16.x)>=u_xlat28;
					            u_xlati15 = int(uint(u_xlati15) | (uint(u_xlatb16) * 0xffffffffu));
					            u_xlati16 = int(uint(u_xlati15) & uint(u_xlati6));
					            if(u_xlati16 != 0) {
					                u_xlat23.x = u_xlat33;
					                u_xlat23.y = u_xlat7.x;
					                break;
					            }
					            u_xlat16.xy = (-u_xlat3.xy) + u_xlat22.xy;
					            u_xlat22.xy = (int(u_xlati6) != 0) ? u_xlat22.xy : u_xlat16.xy;
					            u_xlat16.xy = u_xlat3.xy + u_xlat5.xy;
					            u_xlat5.xy = (int(u_xlati15) != 0) ? u_xlat5.xy : u_xlat16.xy;
					            u_xlati24 = u_xlati24 + 1;
					            u_xlat23.x = u_xlat33;
					            u_xlat23.y = u_xlat7.x;
					        }
					        u_xlat3.xy = (-u_xlat22.xy) + vs_TEXCOORD0.xy;
					        u_xlat28 = (u_xlatb10) ? u_xlat3.x : u_xlat3.y;
					        u_xlat3.xy = u_xlat5.xy + (-vs_TEXCOORD0.xy);
					        u_xlat3.x = (u_xlatb10) ? u_xlat3.x : u_xlat3.y;
					        u_xlatb12 = u_xlat28<u_xlat3.x;
					        u_xlat21.x = (u_xlatb12) ? u_xlat23.x : u_xlat23.y;
					        u_xlat29 = (-u_xlat27) + u_xlat29;
					        u_xlati29 = int((u_xlat29<0.0) ? 0xFFFFFFFFu : uint(0));
					        u_xlat27 = (-u_xlat27) + u_xlat21.x;
					        u_xlati27 = int((u_xlat27<0.0) ? 0xFFFFFFFFu : uint(0));
					        u_xlatb27 = u_xlati27==u_xlati29;
					        u_xlat27 = (u_xlatb27) ? 0.0 : u_xlat19;
					        u_xlat19 = u_xlat28 + u_xlat3.x;
					        u_xlat28 = (u_xlatb12) ? u_xlat28 : u_xlat3.x;
					        u_xlat19 = -1.0 / u_xlat19;
					        u_xlat19 = u_xlat28 * u_xlat19 + 0.5;
					        u_xlat27 = u_xlat27 * u_xlat19;
					        u_xlat19 = (u_xlatb10) ? 0.0 : u_xlat27;
					        u_xlat3.x = u_xlat19 + vs_TEXCOORD0.x;
					        u_xlat27 = u_xlatb10 ? u_xlat27 : float(0.0);
					        u_xlat3.y = u_xlat27 + vs_TEXCOORD0.y;
					        u_xlat3 = textureLod(_MainTex, u_xlat3.xy, 0.0);
					        u_xlat0.xyz = u_xlat0.xyz * vec3(0.111111112, 0.111111112, 0.111111112) + u_xlat3.xyz;
					        u_xlat2.xyz = (-u_xlat1.xxx) * u_xlat3.xyz + u_xlat0.xyz;
					    }
					    SV_Target0.xyz = u_xlat2.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
			}
		}
	}
	Fallback "Hidden/FXAA II"
}