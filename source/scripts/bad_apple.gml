af=temp_directory+"\audio.mp3"

//initialize frame renderer
su=-1
b=buffer_create()
b2=buffer_create()

//load movie data
buffer_load(b,"ba.rav")

//renex audiovideo v1
buffer_read_string(b)

//read audio blob
len=buffer_read_u32(b)
pos=buffer_get_pos(b)
buffer_copy_part(b2,b,pos,len)
buffer_set_pos(b,pos+len)
buffer_save(b2,af)
audio=sound_add(af,3,1)

//read movie header
videofps=buffer_read_float(b)
count=buffer_read_u32(b)
spd=floor(1000/videofps)

//read frame size and initialize frame surface
w=buffer_read_u16(b)
h=buffer_read_u16(b)
su=surface_create(w,h)
scale=min(room_width/w,room_height/h)

//start playback
sound_play(audio)
texture_set_interpolation(1)
i=0 repeat (count) {
    //decode a frame and display it
    window_set_caption(argument0+" - "+string(videofps)+" fps, "+string(w)+" x "+string(h)+" - "+string(i*spd/1000)+" / "+string(count*spd/1000)+" seconds")
    buffer_clear(b2)
    len=buffer_read_u32(b)
    pos=buffer_get_pos(b)
    buffer_copy_part(b2,b,pos,len)
    buffer_inflate(b2)
    buffer_set_surface(b2,su)
    //draw_surface_stretched(su,0,0,w*scale,h*scale)

    dx=object1.x
    dy=object1.y

    if (gm82sf_ready_area && gm82sf_ready_text) {
        d3d_transform_add_translation(dx,dy,0)
        draw_rect(0,0,area_width,area_height,0)
        shader_pixel_set_passthrough()
        shader_vertex_set(vertex_shader)
        shader_vertex_uniform_matrix("rMatrixWVP",mtx_world_view_projection)
        shader_vertex_uniform_f("line_width",line_width)
        texture_set_stage_vertex("sText" ,surface_get_texture(surface_get("gm82sf_char" ,char_width,line_height)))
        texture_set_stage_vertex("sColor",surface_get_texture(su))
        vertex_instance_set(instance_buffer,format,1)
        vertex_buffer_draw(vertex_buffer,format,pr_trianglelist,tex_font,index_buffer)
        vertex_instance_reset()
        shader_reset()
        d3d_transform_add_translation(-dx,-dy,0)
    }


    screen_refresh()
    buffer_set_pos(b,pos+len)
    sleep(spd)
i+=1}

//cleanup
buffer_destroy(b)
buffer_destroy(b2)
surface_free(su)

do sleep(100) until (!sound_isplaying(audio))
