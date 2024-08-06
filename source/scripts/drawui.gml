d3d_set_projection_ortho(0,0,width,height,0)

tooltiptext=""
tty=0

statusx=0
statusy=height-32
statusw=width
statush=32

draw_button_ext(0,32,200,height-32-32,0,global.col_main)
rect(200,0,statusw,32,global.col_main,1)
draw_button_ext(200,32,48,height-32-32,0,global.col_high)
draw_button_ext(248,32,width-48,height-32-32,0,0)

with (ShaderFont) gm82sf_draw(x,y)
with (ObjectEvents) drawui_object()

//draw statusbar
draw_button_ext(statusx,height-32,144,32,0,global.col_main)
draw_button_ext(statusx+144,height-32,296,32,0,global.col_main)
draw_button_ext(statusx+440,height-32,statusw-440,32,0,global.col_main)
draw_set_color(global.col_text)
//draw_text(statusx+8,statusy+6,string(fmx)+","+string(fmy))
draw_text(statusx+8,statusy+6,"Ready.")

with (Button) button_draw()
with (Button) if (focus && alt!="") drawtooltip(alt)

if (tooltiptext!="") drawtooltip(tooltiptext)
