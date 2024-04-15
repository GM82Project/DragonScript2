///gm82sf_set_area(width,height)
area_width=argument0
area_height=argument1

var u,v,b;

line_width=floor(area_width/char_w)
line_height=floor(area_height/char_h)

char_width=floor(line_width/4)

if (gm82sf_ready_area)
    vertex_buffer_delete(instance_buffer)

//textarea instance buffer
b=buffer_create()
for (u=0;u<line_width;u+=4) for (v=0;v<line_height;v+=1) {
    buffer_write_format_position(b,u*char_w,v*char_h,0)
    buffer_write_format_texcoord(b,(u+0.5)/line_width,(v+0.5)/line_height)
}
instance_buffer=vertex_buffer_create(b,format,1)
buffer_destroy(b)

gm82sf_ready_area=true

gm82sf_set_color_surface()
draw_clear_alpha(draw_get_color(),draw_get_alpha())
surface_reset_target()
