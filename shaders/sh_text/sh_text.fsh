//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_vTexel;
uniform vec3 u_vColor;
uniform vec3 u_vAlpha;
uniform float u_vSize;

void main()
{
	vec4 color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	vec2 pixelSize = u_vTexel * u_vSize;
	
	if(color.a > 0.0) {		
		if(texture2D( gm_BaseTexture, vec2(v_vTexcoord.x + pixelSize.x, v_vTexcoord.y)).a <= 0.0
		|| texture2D( gm_BaseTexture, vec2(v_vTexcoord.x - pixelSize.x, v_vTexcoord.y)).a <= 0.0
		|| texture2D( gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y + pixelSize.y)).a <= 0.0
		|| texture2D( gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y - pixelSize.y)).a <= 0.0
		) {
			color = vec4(u_vColor, u_vAlpha);
		}
	}
	
    gl_FragColor = color;
}
