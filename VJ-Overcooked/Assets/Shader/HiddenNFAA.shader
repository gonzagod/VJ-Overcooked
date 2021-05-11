Shader "Hidden/NFAA" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_BlurTex ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 7930
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
						float _OffsetScale;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD2;
					out vec2 vs_TEXCOORD3;
					out vec2 vs_TEXCOORD4;
					out vec2 vs_TEXCOORD5;
					out vec2 vs_TEXCOORD6;
					out vec2 vs_TEXCOORD7;
					vec4 u_xlat0;
					vec2 u_xlat1;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0.yz = _MainTex_TexelSize.yx * vec2(_OffsetScale);
					    u_xlat0.x = float(0.0);
					    u_xlat0.w = float(0.0);
					    vs_TEXCOORD0.xy = u_xlat0.xy + in_TEXCOORD0.xy;
					    vs_TEXCOORD1.xy = (-u_xlat0.xy) + in_TEXCOORD0.xy;
					    u_xlat1.xy = u_xlat0.zw + in_TEXCOORD0.xy;
					    vs_TEXCOORD2.xy = u_xlat1.xy;
					    u_xlat4.xy = (-u_xlat0.zw) + in_TEXCOORD0.xy;
					    vs_TEXCOORD3.xy = u_xlat4.xy;
					    vs_TEXCOORD4.xy = u_xlat0.xy + u_xlat4.xy;
					    vs_TEXCOORD5.xy = (-u_xlat0.xy) + u_xlat4.xy;
					    vs_TEXCOORD6.xy = u_xlat0.xy + u_xlat1.xy;
					    vs_TEXCOORD7.xy = (-u_xlat0.xy) + u_xlat1.xy;
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
						float _BlurRadius;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec2 vs_TEXCOORD2;
					in  vec2 vs_TEXCOORD3;
					in  vec2 vs_TEXCOORD4;
					in  vec2 vs_TEXCOORD5;
					in  vec2 vs_TEXCOORD6;
					in  vec2 vs_TEXCOORD7;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec3 u_xlat4;
					vec2 u_xlat9;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat0.y = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat1.z = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat0.x = u_xlat1.z;
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD5.xy);
					    u_xlat0.z = dot(u_xlat2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat12 = dot(vec3(1.0, 1.0, 1.0), u_xlat0.xyz);
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat2.y = dot(u_xlat2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat3 = texture(_MainTex, vs_TEXCOORD6.xy);
					    u_xlat0.y = dot(u_xlat3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat2.x = u_xlat0.y;
					    u_xlat3 = texture(_MainTex, vs_TEXCOORD7.xy);
					    u_xlat1.x = dot(u_xlat3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat2.z = u_xlat1.x;
					    u_xlat13 = dot(vec3(1.0, 1.0, 1.0), u_xlat2.xyz);
					    u_xlat2.y = (-u_xlat12) + u_xlat13;
					    u_xlat3 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat1.y = dot(u_xlat3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat12 = dot(vec3(1.0, 1.0, 1.0), u_xlat1.xyz);
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat0.x = dot(vec3(1.0, 1.0, 1.0), u_xlat0.xyz);
					    u_xlat2.x = (-u_xlat0.x) + u_xlat12;
					    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(vec2(_BlurRadius, _BlurRadius));
					    u_xlat0.xy = u_xlat0.xy * u_xlat2.xy;
					    u_xlat1.xy = vs_TEXCOORD0.xy + vs_TEXCOORD1.xy;
					    u_xlat9.xy = u_xlat1.xy * vec2(0.5, 0.5) + u_xlat0.xy;
					    u_xlat2 = texture(_MainTex, u_xlat9.xy);
					    u_xlat9.xy = u_xlat1.xy * vec2(0.5, 0.5);
					    u_xlat3 = texture(_MainTex, u_xlat9.xy);
					    u_xlat2 = u_xlat2 + u_xlat3;
					    u_xlat9.xy = u_xlat1.xy * vec2(0.5, 0.5) + (-u_xlat0.xy);
					    u_xlat3 = texture(_MainTex, u_xlat9.xy);
					    u_xlat2 = u_xlat2 + u_xlat3;
					    u_xlat0.z = (-u_xlat0.y);
					    u_xlat4.xz = u_xlat1.xy * vec2(0.5, 0.5) + u_xlat0.xz;
					    u_xlat0.xz = u_xlat1.xy * vec2(0.5, 0.5) + (-u_xlat0.xz);
					    u_xlat1 = texture(_MainTex, u_xlat0.xz);
					    u_xlat0 = texture(_MainTex, u_xlat4.xz);
					    u_xlat0 = u_xlat0 + u_xlat2;
					    u_xlat0 = u_xlat1 + u_xlat0;
					    SV_Target0 = u_xlat0 * vec4(0.200000003, 0.200000003, 0.200000003, 0.200000003);
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
			GpuProgramID 115260
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
						float _OffsetScale;
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec2 vs_TEXCOORD0;
					out vec2 vs_TEXCOORD1;
					out vec2 vs_TEXCOORD2;
					out vec2 vs_TEXCOORD3;
					out vec2 vs_TEXCOORD4;
					out vec2 vs_TEXCOORD5;
					out vec2 vs_TEXCOORD6;
					out vec2 vs_TEXCOORD7;
					vec4 u_xlat0;
					vec2 u_xlat1;
					vec2 u_xlat4;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0.yz = _MainTex_TexelSize.yx * vec2(_OffsetScale);
					    u_xlat0.x = float(0.0);
					    u_xlat0.w = float(0.0);
					    vs_TEXCOORD0.xy = u_xlat0.xy + in_TEXCOORD0.xy;
					    vs_TEXCOORD1.xy = (-u_xlat0.xy) + in_TEXCOORD0.xy;
					    u_xlat1.xy = u_xlat0.zw + in_TEXCOORD0.xy;
					    vs_TEXCOORD2.xy = u_xlat1.xy;
					    u_xlat4.xy = (-u_xlat0.zw) + in_TEXCOORD0.xy;
					    vs_TEXCOORD3.xy = u_xlat4.xy;
					    vs_TEXCOORD4.xy = u_xlat0.xy + u_xlat4.xy;
					    vs_TEXCOORD5.xy = (-u_xlat0.xy) + u_xlat4.xy;
					    vs_TEXCOORD6.xy = u_xlat0.xy + u_xlat1.xy;
					    vs_TEXCOORD7.xy = (-u_xlat0.xy) + u_xlat1.xy;
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
						float _BlurRadius;
					};
					uniform  sampler2D _MainTex;
					in  vec2 vs_TEXCOORD0;
					in  vec2 vs_TEXCOORD1;
					in  vec2 vs_TEXCOORD2;
					in  vec2 vs_TEXCOORD3;
					in  vec2 vs_TEXCOORD4;
					in  vec2 vs_TEXCOORD5;
					in  vec2 vs_TEXCOORD6;
					in  vec2 vs_TEXCOORD7;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					float u_xlat12;
					float u_xlat13;
					void main()
					{
					    u_xlat0 = texture(_MainTex, vs_TEXCOORD2.xy);
					    u_xlat0.y = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD4.xy);
					    u_xlat1.z = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat0.x = u_xlat1.z;
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD5.xy);
					    u_xlat0.z = dot(u_xlat2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat12 = dot(vec3(1.0, 1.0, 1.0), u_xlat0.xyz);
					    u_xlat2 = texture(_MainTex, vs_TEXCOORD3.xy);
					    u_xlat2.y = dot(u_xlat2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat3 = texture(_MainTex, vs_TEXCOORD6.xy);
					    u_xlat0.y = dot(u_xlat3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat2.x = u_xlat0.y;
					    u_xlat3 = texture(_MainTex, vs_TEXCOORD7.xy);
					    u_xlat1.x = dot(u_xlat3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat2.z = u_xlat1.x;
					    u_xlat13 = dot(vec3(1.0, 1.0, 1.0), u_xlat2.xyz);
					    u_xlat2.y = (-u_xlat12) + u_xlat13;
					    u_xlat3 = texture(_MainTex, vs_TEXCOORD1.xy);
					    u_xlat1.y = dot(u_xlat3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat12 = dot(vec3(1.0, 1.0, 1.0), u_xlat1.xyz);
					    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
					    u_xlat0.x = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
					    u_xlat0.x = dot(vec3(1.0, 1.0, 1.0), u_xlat0.xyz);
					    u_xlat2.x = (-u_xlat0.x) + u_xlat12;
					    u_xlat0.xy = u_xlat2.xy * vec2(vec2(_BlurRadius, _BlurRadius));
					    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
					    u_xlat0.z = 0.5;
					    u_xlat0.xyz = u_xlat0.xyz + vec3(0.5, 0.5, 0.5);
					    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
					    u_xlat12 = inversesqrt(u_xlat12);
					    SV_Target0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
					    SV_Target0.w = 1.0;
					    return;
					}"
				}
			}
		}
	}
}