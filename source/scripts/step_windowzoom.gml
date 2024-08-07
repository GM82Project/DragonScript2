if (resizecount<10) {
    if (window_get_width()!=width || window_get_height()!=height) {
        with (Button) {
            if (anchor==1 || anchor==3) offx=width-x
            if (anchor==2 || anchor==3) offy=height-y
        }
        width=max(min_width,window_get_width())
        height=max(min_height,window_get_height())
        surface_forget_all()
        window_set_size(width,height)
        window_set_region_size(width,height,0)
        window_resize_buffer(width,height,1,0)
        view_wport[0]=width
        view_hport[0]=height
        with (ShaderFont) alarm[0]=2
        with (Button) {
            if (anchor==1 || anchor==3) x=width-offx
            if (anchor==2 || anchor==3) y=height-offy
        }
        resizecount+=1
        if (resizecount>=10) show_message("Resizing the window failed multiple times. Do you have some sort of weird DPI settings? Either way, I'm disabling resizing for now.")
    } else resizecount=0
}

mouse_wx=window_mouse_get_x()
mouse_wy=window_mouse_get_y()
