use allegro5


import allegro5/Event
import allegro5/Allegro



ALLEGRO_MOUSE_MAX_EXTRA_AXES : extern const Int

MouseState : cover from ALLEGRO_MOUSE_STATE {
  x             : extern Int
  y             : extern Int
  z             : extern Int
  w             : extern Int
  more_axes     : extern Int[ALLEGRO_MOUSE_MAX_EXTRA_AXES]
  buttons       : extern Int
  pressure      : extern Float
  display       : Display

  mouseButtonDown   : extern(al_mouse_button_down) static func ( state: MouseState *,  button:Int) -> Bool
  getMouseStateAxis : extern(al_get_mouse_state_axis) static func ( state: MouseState *,  axis:Int) -> Int
}

Mouse : cover from ALLEGRO_MOUSE * { 
  isInstalled : extern(al_is_mouse_installed) static func (Void) -> Bool
  install : extern(al_install_mouse) static func (Void) -> Bool
  uninstall : extern(al_uninstall_mouse) static func (Void) -> Void
  getNumButtons : extern(al_get_mouse_num_buttons) static func (Void) -> UInt
  getNumAxes : extern(al_get_mouse_num_axes) static func (Void) -> UInt
  setXy : extern(al_set_mouse_xy) static func ( display: Display,  x:Int,  y:Int) -> Bool
  setZ : extern(al_set_mouse_z) static func ( z:Int) -> Bool
  setW : extern(al_set_mouse_w) static func ( w:Int) -> Bool
  setAxis : extern(al_set_mouse_axis) static func ( axis:Int,  value:Int) -> Bool
  getState : extern(al_get_mouse_state) static func ( ret_state:MouseState *) -> Void
  getCursorPosition : extern(al_get_mouse_cursor_position) static func ( ret_x:Int *,  ret_y:Int *) -> Bool
  grab : extern(al_grab_mouse) static func ( display : Display) -> Bool
  ungrab : extern(al_ungrab_mouse) static func (Void) -> Bool
  getEventSource : extern(al_get_mouse_event_source) static func (Void) -> EventSource

}


ALLEGRO_SYSTEM_MOUSE_CURSOR_NONE        : extern const Int
ALLEGRO_SYSTEM_MOUSE_CURSOR_DEFAULT     : extern const Int
ALLEGRO_SYSTEM_MOUSE_CURSOR_ARROW       : extern const Int
ALLEGRO_SYSTEM_MOUSE_CURSOR_BUSY        : extern const Int
ALLEGRO_SYSTEM_MOUSE_CURSOR_QUESTION    : extern const Int
ALLEGRO_SYSTEM_MOUSE_CURSOR_EDIT        : extern const Int
ALLEGRO_SYSTEM_MOUSE_CURSOR_MOVE        : extern const Int
ALLEGRO_SYSTEM_MOUSE_CURSOR_RESIZE_N    : extern const Int
ALLEGRO_SYSTEM_MOUSE_CURSOR_RESIZE_W    : extern const Int
ALLEGRO_SYSTEM_MOUSE_CURSOR_RESIZE_S    : extern const Int
ALLEGRO_SYSTEM_MOUSE_CURSOR_RESIZE_E    : extern const Int
ALLEGRO_SYSTEM_MOUSE_CURSOR_RESIZE_NW   : extern const Int
ALLEGRO_SYSTEM_MOUSE_CURSOR_RESIZE_SW   : extern const Int
ALLEGRO_SYSTEM_MOUSE_CURSOR_RESIZE_SE   : extern const Int
ALLEGRO_SYSTEM_MOUSE_CURSOR_RESIZE_NE   : extern const Int
ALLEGRO_SYSTEM_MOUSE_CURSOR_PROGRESS    : extern const Int
ALLEGRO_SYSTEM_MOUSE_CURSOR_PRECISION   : extern const Int
ALLEGRO_SYSTEM_MOUSE_CURSOR_LINK        : extern const Int
ALLEGRO_SYSTEM_MOUSE_CURSOR_ALT_SELECT  : extern const Int
ALLEGRO_SYSTEM_MOUSE_CURSOR_UNAVAILABLE : extern const Int
ALLEGRO_NUM_SYSTEM_MOUSE_CURSORS        : extern const Int

  
MouseCursor : cover from ALLEGRO_MOUSE_CURSOR * { 
  create : extern(al_create_mouse_cursor) static func (sprite: Bitmap, xfocus:Int,  yfocus:Int) -> MouseCursor
  destroy : extern(al_destroy_mouse_cursor) func () -> Void
  set : extern(al_set_mouse_cursor) static func (display : Display,  cursor: MouseCursor) -> Bool
  setSystem : extern(al_set_system_mouse_cursor) static func ( display: Display,  cursor_id : Int) -> Bool
  show : extern(al_show_mouse_cursor) static func (display: Display) -> Bool
  hide : extern(al_hide_mouse_cursor) static func (display: Display) -> Bool
}





