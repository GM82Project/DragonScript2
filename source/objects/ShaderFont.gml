#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
mode=1

gm82sf_init(fntJet)
gm82sf_set_area(800,412)
alarm[0]=2
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
gm82sf_set_text(test_string())

//optional
gm82sf_set_color_surface()
draw_background_stretched(bgGrarfileld,0,0,gm82sf_get_color_width(),gm82sf_get_color_height())
surface_reset_target()
