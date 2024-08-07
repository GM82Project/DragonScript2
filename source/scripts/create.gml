globalvar tty,width,height,mouse_wx,mouse_wy;
globalvar theme,buttontex,themebutton;
globalvar modified,mode;

draw_set_font(fntJet)

message_caption(1,"Message")
message_size(500,-1)

maxfps=display_get_frequency()
resizecount=0

room_speed=maxfps
room_caption="Game Maker 8.2 Code Editor"

theme_init()
theme_apply()

load_object()

mode=1

instance_create(0,0,Interface)
instance_create(448+4,32+4,ShaderFont)
bgtex=background_get_texture(bgBlack)

window_set_size(1200,500)
step_windowzoom()
window_center()

window_set_foreground()
