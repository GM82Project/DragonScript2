if (mode) {
    gm82sf_draw(48+6,32+6)
} else {
    draw_text(x,y,text_normal)
}

if (keyboard_check_pressed(vk_space)) {
    mode=!mode
    alarm[0]=100
}
