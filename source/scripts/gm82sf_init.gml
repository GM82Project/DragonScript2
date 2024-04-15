///gm82sf_init(font)
var font;

font=argument0

var s,u,v,b,bv,bi;

gm82sf_ready_area=false
gm82sf_ready_text=false

vertex_shader=__gm82sf_shader()

//initialize font parameters
draw_set_font(font)
char_w=string_width("M")
char_h=string_height("M")

//create the font atlas
atlas_width=char_w*16
atlas_height=char_h*16
s=surface_create(atlas_width,atlas_height)
surface_set_target(s)
draw_clear_alpha($ffffff,0)
draw_set_blend_alphamode(true,bm_one,bm_one)
for (u=0;u<16;u+=1) for (v=0;v<16;v+=1) {
    draw_text(u*char_w,v*char_h,chr(u+v*16))
}
draw_set_blend_alphamode(false)
surface_reset_target()
atlas=background_create_from_surface(s,0,0,atlas_width,atlas_height,0,0)
surface_free(s)
tex_font=background_get_texture(atlas)

//vertex format
vertex_format_begin()
    vertex_format_add_position(0)
    vertex_format_add_texcoord(0)
    vertex_format_add_color(0)
    vertex_format_add_position(1)
    vertex_format_add_texcoord(1)
format=vertex_format_end()

//vertex + index buffers
bv=buffer_create()
bi=buffer_create()
__gm82sf_vertex_helper_helper(bv,bi, 0       ,0 , $ff0000,0)
__gm82sf_vertex_helper_helper(bv,bi, char_w  ,4 , $00ff00,0)
__gm82sf_vertex_helper_helper(bv,bi, char_w*2,8 , $0000ff,0)
__gm82sf_vertex_helper_helper(bv,bi, char_w*3,12, $000000,1)
vertex_buffer=vertex_buffer_create(bv,format,0)
index_buffer=index_buffer_create(bi,ib_format_16)
buffer_destroy(bv)
buffer_destroy(bi)
