use allegro5

DisplayMode : cover from ALLEGRO_DISPLAY_MODE { 
   width, height, format, refresh_rate : extern Int;
   getNum : extern(al_get_num_display_modes) static func (Void) -> Int
   get : extern(al_get_display_mode) static func ( index:Int,  mode : DisplayMode *) -> DisplayMode *
}





