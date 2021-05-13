Shader "Hidden/FXAA III (Console)" {
	Properties {
		_MainTex ("-", 2D) = "white" {}
		_EdgeThresholdMin ("Edge threshold min", Float) = 0.125
		_EdgeThreshold ("Edge Threshold", Float) = 0.25
		_EdgeSharpness ("Edge sharpness", Float) = 4
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 24738
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
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
					    vs_TEXCOORD1.xy = (-_MainTex_TexelSize.xy) * vec2(0.5, 0.5) + in_TEXCOORD0.xy;
					    vs_TEXCOORD1.zw = _MainTex_TexelSize.xy * vec2(0.5, 0.5) + in_TEXCOORD0.xy;
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-0.5, -0.5, 0.5, 0.5);
					    vs_TEXCOORD2 = u_xlat0;
					    vs_TEXCOORD3.xy = _MainTex_TexelSize.xy * vec2(-2.0, -2.0);
					    vs_TEXCOORD3.zw = _MainTex_TexelSize.xy + _MainTex_TexelSize.xy;
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
						float _EdgeThresholdMin;
						float _EdgeThreshold;
						float _EdgeSharpness;
						vec4 unused_0_4;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					in  vec4 vs_TEXCOORD1;
					in  vec4 vs_TEXCOORD2;
					in  vec4 vs_TEXCOORD3;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec3 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					vec4 u_xlat5;
					vec3 u_xlat6;
					vec3 u_xlat8;
					vec2 u_xlat12;
					float u_xlat14;
					float u_xlat18;
					bool u_xlatb18;
					float u_xlat19;
					bool u_xlatb19;
					float u_xlat20;
					void main()
					{
					    u_xlat0 = textureLod(_MainTex, vs_TEXCOORD1.xy, 0.0);
					    u_xlat0.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat1 = textureLod(_MainTex, vs_TEXCOORD1.xw, 0.0);
					    u_xlat6.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat1 = textureLod(_MainTex, vs_TEXCOORD1.zy, 0.0);
					    u_xlat12.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat1 = textureLod(_MainTex, vs_TEXCOORD1.zw, 0.0);
					    u_xlat6.z = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat1 = textureLod(_MainTex, vs_TEXCOORD0.xy, 0.0);
					    u_xlat19 = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat0.z = u_xlat12.x + 0.00260416674;
					    u_xlat2.xz = max(u_xlat6.xz, u_xlat0.xz);
					    u_xlat8.xz = min(u_xlat6.xz, u_xlat0.xz);
					    u_xlat2.x = max(u_xlat2.x, u_xlat2.z);
					    u_xlat8.x = min(u_xlat8.x, u_xlat8.z);
					    u_xlat14 = u_xlat2.x * _EdgeThreshold;
					    u_xlat20 = min(u_xlat19, u_xlat8.x);
					    u_xlat14 = max(u_xlat14, _EdgeThresholdMin);
					    u_xlat19 = max(u_xlat19, u_xlat2.x);
					    u_xlat19 = (-u_xlat20) + u_xlat19;
					    u_xlatb19 = u_xlat19>=u_xlat14;
					    if(u_xlatb19){
					        u_xlat0.xy = (-u_xlat0.xz) + u_xlat6.zx;
					        u_xlat3.x = u_xlat0.x + u_xlat0.y;
					        u_xlat3.y = (-u_xlat0.x) + u_xlat0.y;
					        u_xlat0.x = dot(u_xlat3.xy, u_xlat3.xy);
					        u_xlat0.x = inversesqrt(u_xlat0.x);
					        u_xlat0.xy = u_xlat0.xx * u_xlat3.xy;
					        u_xlat12.xy = (-u_xlat0.xy) * vs_TEXCOORD2.zw + vs_TEXCOORD0.xy;
					        u_xlat3 = textureLod(_MainTex, u_xlat12.xy, 0.0);
					        u_xlat12.xy = u_xlat0.xy * vs_TEXCOORD2.zw + vs_TEXCOORD0.xy;
					        u_xlat4 = textureLod(_MainTex, u_xlat12.xy, 0.0);
					        u_xlat12.x = min(abs(u_xlat0.y), abs(u_xlat0.x));
					        u_xlat12.x = u_xlat12.x * _EdgeSharpness;
					        u_xlat0.xy = u_xlat0.xy / u_xlat12.xx;
					        u_xlat0.xy = max(u_xlat0.xy, vec2(-2.0, -2.0));
					        u_xlat0.xy = min(u_xlat0.xy, vec2(2.0, 2.0));
					        u_xlat12.xy = (-u_xlat0.xy) * vs_TEXCOORD3.zw + vs_TEXCOORD0.xy;
					        u_xlat5 = textureLod(_MainTex, u_xlat12.xy, 0.0);
					        u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD3.zw + vs_TEXCOORD0.xy;
					        u_xlat0 = textureLod(_MainTex, u_xlat0.xy, 0.0);
					        u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
					        u_xlat0.xyz = u_xlat0.xyz + u_xlat5.xyz;
					        u_xlat4.xyz = u_xlat3.xyz * vec3(0.25, 0.25, 0.25);
					        u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + u_xlat4.xyz;
					        u_xlat18 = dot(u_xlat3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					        u_xlatb18 = u_xlat18<u_xlat8.x;
					        u_xlat19 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					        u_xlatb19 = u_xlat2.x<u_xlat19;
					        u_xlatb18 = u_xlatb18 || u_xlatb19;
					        u_xlat2.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5);
					        u_xlat1.xyz = (bool(u_xlatb18)) ? u_xlat2.xyz : u_xlat0.xyz;
					    }
					    SV_Target0.xyz = u_xlat1.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
			}
		}
	}
}