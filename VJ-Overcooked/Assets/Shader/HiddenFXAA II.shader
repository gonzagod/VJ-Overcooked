Shader "Hidden/FXAA II" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Pass {
			ZClip Off
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 23445
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
					};
					layout(std140) uniform UnityPerDraw {
						mat4x4 glstate_matrix_mvp;
						vec4 unused_1_1[18];
					};
					in  vec4 in_POSITION0;
					in  vec2 in_TEXCOORD0;
					out vec4 vs_TEXCOORD0;
					vec4 u_xlat0;
					void main()
					{
					    u_xlat0 = in_POSITION0.yyyy * glstate_matrix_mvp[1];
					    u_xlat0 = glstate_matrix_mvp[0] * in_POSITION0.xxxx + u_xlat0;
					    u_xlat0 = glstate_matrix_mvp[2] * in_POSITION0.zzzz + u_xlat0;
					    gl_Position = glstate_matrix_mvp[3] * in_POSITION0.wwww + u_xlat0;
					    u_xlat0.xy = in_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
					    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
					    vs_TEXCOORD0.zw = (-_MainTex_TexelSize.xy) * vec2(0.75, 0.75) + u_xlat0.xy;
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
					in  vec4 vs_TEXCOORD0;
					layout(location = 0) out vec4 SV_Target0;
					vec4 u_xlat0;
					bvec2 u_xlatb0;
					vec4 u_xlat1;
					vec4 u_xlat2;
					vec4 u_xlat3;
					vec4 u_xlat4;
					float u_xlat5;
					vec3 u_xlat6;
					vec2 u_xlat10;
					float u_xlat11;
					float u_xlat15;
					float u_xlat17;
					void main()
					{
					    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(1.0, 0.0, 0.0, 1.0) + vs_TEXCOORD0.zwzw;
					    u_xlat1 = textureLod(_MainTex, u_xlat0.xy, 0.0);
					    u_xlat0 = textureLod(_MainTex, u_xlat0.zw, 0.0);
					    u_xlat0.x = dot(u_xlat0.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat5 = dot(u_xlat1.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat10.xy = vs_TEXCOORD0.zw + _MainTex_TexelSize.xy;
					    u_xlat1 = textureLod(_MainTex, u_xlat10.xy, 0.0);
					    u_xlat10.x = dot(u_xlat1.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat15 = u_xlat10.x + u_xlat5;
					    u_xlat1 = textureLod(_MainTex, vs_TEXCOORD0.zw, 0.0);
					    u_xlat1.x = dot(u_xlat1.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat6.x = u_xlat0.x + u_xlat1.x;
					    u_xlat2.yw = (-vec2(u_xlat15)) + u_xlat6.xx;
					    u_xlat15 = u_xlat5 + u_xlat1.x;
					    u_xlat6.x = u_xlat10.x + u_xlat0.x;
					    u_xlat6.x = u_xlat15 + (-u_xlat6.x);
					    u_xlat15 = u_xlat0.x + u_xlat15;
					    u_xlat15 = u_xlat10.x + u_xlat15;
					    u_xlat15 = u_xlat15 * 0.03125;
					    u_xlat15 = max(u_xlat15, 0.0078125);
					    u_xlat11 = min(abs(u_xlat2.w), abs(u_xlat6.x));
					    u_xlat2.xz = (-u_xlat6.xx);
					    u_xlat15 = u_xlat15 + u_xlat11;
					    u_xlat15 = float(1.0) / u_xlat15;
					    u_xlat2 = vec4(u_xlat15) * u_xlat2;
					    u_xlat2 = max(u_xlat2, vec4(-8.0, -8.0, -8.0, -8.0));
					    u_xlat2 = min(u_xlat2, vec4(8.0, 8.0, 8.0, 8.0));
					    u_xlat2 = u_xlat2 * _MainTex_TexelSize.xyxy;
					    u_xlat3 = u_xlat2 * vec4(-0.5, -0.5, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
					    u_xlat2 = u_xlat2.zwzw * vec4(-0.166666672, -0.166666672, 0.166666672, 0.166666672) + vs_TEXCOORD0.xyxy;
					    u_xlat4 = textureLod(_MainTex, u_xlat3.xy, 0.0);
					    u_xlat3 = textureLod(_MainTex, u_xlat3.zw, 0.0);
					    u_xlat6.xyz = u_xlat3.xyz + u_xlat4.xyz;
					    u_xlat6.xyz = u_xlat6.xyz * vec3(0.25, 0.25, 0.25);
					    u_xlat3 = textureLod(_MainTex, u_xlat2.xy, 0.0);
					    u_xlat2 = textureLod(_MainTex, u_xlat2.zw, 0.0);
					    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
					    u_xlat6.xyz = u_xlat2.xyz * vec3(0.25, 0.25, 0.25) + u_xlat6.xyz;
					    u_xlat2.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5);
					    u_xlat0.w = dot(u_xlat6.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat17 = min(u_xlat10.x, u_xlat0.x);
					    u_xlat0.x = max(u_xlat10.x, u_xlat0.x);
					    u_xlat10.x = min(u_xlat5, u_xlat1.x);
					    u_xlat5 = max(u_xlat5, u_xlat1.x);
					    u_xlat0.x = max(u_xlat0.x, u_xlat5);
					    u_xlat5 = min(u_xlat17, u_xlat10.x);
					    u_xlat3 = textureLod(_MainTex, vs_TEXCOORD0.xy, 0.0);
					    u_xlat10.x = dot(u_xlat3.xyz, vec3(0.298999995, 0.587000012, 0.114));
					    u_xlat0.y = min(u_xlat5, u_xlat10.x);
					    u_xlat0.x = max(u_xlat0.x, u_xlat10.x);
					    u_xlatb0.xy = lessThan(u_xlat0.xwxx, u_xlat0.wyww).xy;
					    u_xlatb0.x = u_xlatb0.x || u_xlatb0.y;
					    SV_Target0.xyz = (u_xlatb0.x) ? u_xlat2.xyz : u_xlat6.xyz;
					    SV_Target0.w = 0.0;
					    return;
					}"
				}
			}
		}
	}
}