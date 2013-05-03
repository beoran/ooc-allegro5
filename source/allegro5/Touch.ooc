use allegro5

import allegro5/Event


TouchState : cover from ALLEGRO_TOUCH_STATE {
  id : extern Int
  x, y: extern Float
  df, dy: extern Float
  primary : extern Bool
  display : Display
}

ALLEGRO_TOUCH_INPUT_MAX_TOUCH_COUNT : extern const Int


TouchInputState : cover from ALLEGRO_TOUCH_INPUT_STATE {
  touches : TouchState[ALLEGRO_TOUCH_INPUT_MAX_TOUCH_COUNT]
}

ALLEGRO_MOUSE_EMULATION_NONE: extern const Int
ALLEGRO_MOUSE_EMULATION_TRANSPARENT: extern const Int
ALLEGRO_MOUSE_EMULATION_INCLUSIVE: extern const Int
ALLEGRO_MOUSE_EMULATION_EXCLUSIVE: extern const Int
ALLEGRO_MOUSE_EMULATION_5_0_x: extern const Int


Touch : cover { 
  isInstalled : extern(al_is_touch_input_installed) static func (Void) -> Bool
  install : extern(al_install_touch_input) static func (Void) -> Bool
  uninstall : extern(al_uninstall_touch_input) static func (Void) -> Void
  getState : extern(al_get_touch_input_state) static func ( ret_state: TouchInputState *) -> Void
  setMouseEmulationMode : extern(al_set_mouse_emulation_mode) static func ( mode:Int) -> Void
  getMouseEmulationMode : extern(al_get_mouse_emulation_mode) static func (Void) -> Int
  getEventSource : extern(al_get_touch_input_event_source) static func (Void) -> EventSource
  getMouseEmulationEventSource : extern(al_get_touch_input_mouse_emulation_event_source) static   func (Void) -> EventSource
}
