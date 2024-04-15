///gm82sf_set_text(string)
//create the character buffer
var str;

str=argument0

var b,s,p,l;

if (gm82sf_ready_area) {
    //process line breaks
    str=string_replace(str,chr_crlf,chr_lf)
    s=1
    p=string_pos(chr_lf,str)
    while (p) {
        l=line_width-(p-s)
        str=string_insert(string_repeat(" ",l),string_delete(str,p,1),p)
        s=p+l
        p=string_pos(chr_lf,str)
    }

    s=surface_get("gm82sf_char",char_width,line_height)
    b=buffer_create()
    buffer_set_size(b,char_width*line_height*4)
    buffer_write_data(b,str)
    buffer_set_surface(b,s)
    buffer_destroy(b)

    gm82sf_ready_text=true
}
