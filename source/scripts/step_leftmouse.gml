if (mouse_check_button_pressed(mb_left)) {
    with (TextField) textfield_actions()
    with (Button) if (instance_position(mouse_wx,mouse_wy,id)) {
        event_user(2)
    }
}
