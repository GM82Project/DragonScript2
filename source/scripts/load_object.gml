//find room
if (parameter_count()) {
    //summoned from gm82
    savedir=parameter_string(1)
} else {
    //clicked on
    savedir=filename_dir(get_open_filename("GM8.2 Object|*.txt","object.txt"))
    window_default()
}

if (savedir="") {
    //this is for faster testing on my computer :)
    if (working_directory!=program_directory) {
        savedir="C:\Users\rene\Desktop\github\DragonScript2\source\objects"
    }
    if (!file_exists(savedir+"\Controller.txt")) {
        //shrug
        game_end()
        return 0
    }
}

objname="Controller"//filename_name(savedir)
room_caption+=" - "+objname
set_application_title(objname+" - Game Maker 8.2 Object Editor")
global.default_caption=room_caption

savedir+="\"
root=directory_previous(savedir)
pjfile=file_find_first(root+"*.gm82",0) file_find_close()
gamename=filename_change_ext(pjfile,"")

//load main project file
project=ds_map_create()
ds_map_read_ini(project,root+pjfile)
gm82version=real(ds_map_find_value(project,"gm82_version"))
if (gm82version==5) {
    has_backgrounds=real(ds_map_find_value(project,"has_backgrounds"))
    has_datafiles=real(ds_map_find_value(project,"has_datafiles"))
    has_fonts=real(ds_map_find_value(project,"has_fonts"))
    has_objects=real(ds_map_find_value(project,"has_objects"))
    has_paths=real(ds_map_find_value(project,"has_paths"))
    has_scripts=real(ds_map_find_value(project,"has_scripts"))
    has_sounds=real(ds_map_find_value(project,"has_sounds"))
    has_sprites=real(ds_map_find_value(project,"has_sprites"))
    has_timelines=real(ds_map_find_value(project,"has_timelines"))
} else {
    has_backgrounds=1
    has_datafiles=1
    has_fonts=1
    has_objects=1
    has_paths=1
    has_scripts=1
    has_sounds=1
    has_sprites=1
    has_timelines=1
}


if (gm82version!=4 && gm82version!=5) {
    if (gm82version<4) show_message("Error loading "+gamename+": "+crlf+"Project version ("+string(gm82version)+") is too old."+crlf+"Please update Game Maker 8.2 and Save As to refresh the project.")
    else show_message("Error loading "+gamename+": "+crlf+"Project version ("+string(gm82version)+") is too new!"+crlf+"Please update Game Maker 8.2.")
    game_end()
    exit
}


//set up thumbnails
if (directory_exists(root+"cache\backgrounds") && directory_exists(root+"cache\sprites")) {
    icon_mode=1
} else if (!file_exists(root+"cache\ignore_warning")) {
    if (show_question("Error loading icons: GM82 cache is missing, try to Save As the project to fix this.##You can still edit, but icons won't be displayed for resources.##Would you like to disable this warning?")) {
        file_text_close(file_text_open_write(root+"cache\ignore_warning"))
    }
}
thumbmap=ds_map_create()
thumbcount=0

load_sprite_tree(root+"sprites\tree.yyd")
