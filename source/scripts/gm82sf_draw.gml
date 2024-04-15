///gm82sf_draw(x,y)
var dx,dy;

dx=argument0
dy=argument1

if (gm82sf_ready_area && gm82sf_ready_text) {
    //d3d_transform_add_translation(dx,dy,0)
    d3d_set_viewport(dx,dy,area_width,area_height)
    draw_clear(0)
    shader_pixel_set_passthrough()
    shader_vertex_set(vertex_shader)
    shader_vertex_uniform_matrix("rMatrixWVP",mtx_world_view_projection)
    shader_vertex_uniform_f("line_width",line_width)
    texture_set_stage_vertex("sText" ,surface_get_texture(surface_get("gm82sf_char" ,char_width,line_height)))
    texture_set_stage_vertex("sColor",surface_get_texture(surface_get("gm82sf_color",line_width,line_height)))
    vertex_instance_set(instance_buffer,format,1)
    vertex_buffer_draw(vertex_buffer,format,pr_trianglelist,tex_font,index_buffer)
    vertex_instance_reset()
    shader_reset()
    //d3d_transform_add_translation(-dx,-dy,0)
    d3d_set_viewport(0,0,width,height)
}
