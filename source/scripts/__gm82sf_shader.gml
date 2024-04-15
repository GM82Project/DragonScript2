return shader_vertex_create_base64("
    eJxlkTGLE1EQx3/v7dslHGpAW8GU2gRzh0UKMV4sLO5AvYuW4fAiF4iubIKmfOkE
    my38AHugTeJHECz0I9jZRNjPkZV5+zaJ8VUzv5n5z7wZglWxKh7RPX14eBP4DRCs
    CgOIj4JfwAjQGHGZCgc+OAaS+8mzz1KORrHHV8++OaZQRPz0bDR8M+i/H55PLlhU
    UdGWlxyfTZLh9MXzJywCAozvK2/cjUdxwsJw5Z+a8elgOmHxH3837h/073I8fJnE
    4/jVpHH72Z3G46OTo8bJxdn5IGl049dvh6NB0mg399vN9r395kGr1eIphCH1DPgO
    9kGpZn8Ijxy39z3vQKdzq1yFhXoqdghWeXsPrPY2KBusc5Q1a06qavWssvXGFs3l
    RjNYbmkulcsJLOSpGN62wY4fQhZCoKhb6FlFnhl3OvFz+acwWzHt2DyV2lKnvvS6
    TkdyQr5kBpP2vS9xVaviZV+9nkO5vtKn7CH+3GrXY5sVVlPsMGxIcRnC5Q33X+2Y
    3ujOypzKx0aQbeV+vOpixsWA2XUwys9QztWb7WorZ29rB05Xkacym9xCdhbxJ5O/
    VvNqSCPmmabn8kpWpBGF23Pk+xh/k+3dlPe8ZkNXv9mjIXd7lpu7vdbyrCjgL5x9
    nXA=
")

/*
    struct VS_INPUT {
        float4 position: POSITION0;
        float2 quadcoord: TEXCOORD0;
        float4 color: COLOR0;
        float4 inst: POSITION1;
        float2 curchar: TEXCOORD1;
    };

    struct VS_OUTPUT {
        float4 position: POSITION0;
        float2 texcoord: TEXCOORD0;
        float4 color: COLOR0;
    };

    matrix rMatrixWVP;

    SamplerState sText: register(s1);
    SamplerState sColor: register(s2);

    float line_width;

    float2 col2coord(float4 color) {
        return float2((color.g+color.r*2.0+color.a*3.0)/line_width,0);
    }

    VS_OUTPUT main(VS_INPUT input) {
        VS_OUTPUT output;

        input.position.xy+=input.inst.xy-float2(0.5,0.5);
        input.position.w=1.0;

        output.position = mul(rMatrixWVP, input.position);

        float4 word = tex2D(sText, input.curchar) * input.color;
        float char = round((word.r+word.g+word.b+word.a)*256.0);
        float2 char_uv = float2(fmod(char,16.0),floor(char/16.0))/16.0;

        output.texcoord = char_uv + input.quadcoord/16.0;
        output.color = tex2D(sColor, input.curchar+col2coord(input.color));

        return output;
    }
*/
