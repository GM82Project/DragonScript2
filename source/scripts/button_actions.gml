var sx,sy,cx,cy,nsel,cl,ct,cr,cb,mycx,mycy;

with (Controller) switch (argument0) {
    //top panel
    case "save and quit": {save_file() game_end()}break
    case "help"         : {show_info()}break
    case "prefs"        : {show_prefs()}break
    case "undo"         : {pop_undo()}break
}
