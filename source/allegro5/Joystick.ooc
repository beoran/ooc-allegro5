use allegro5

import allegro5/Event

/* Joystick wrappers. */
JoystickState : cover from ALLEGRO_JOYSTICK_STATE {
  /* Todo:  
   *  struct {
      float axis[_AL_MAX_JOYSTICK_AXES];        
   } stick[_AL_MAX_JOYSTICK_STICKS];
   int button[_AL_MAX_JOYSTICK_BUTTONS];        
*/
}

ALLEGRO_JOYFLAG_DIGITAL         : extern const Int
ALLEGRO_JOYFLAG_ANALOGUE        : extern const Int



Joystick : cover from ALLEGRO_JOYSTICK * {
  install       : extern(al_install_joystick) static func (Void) -> Bool
  uninstall     : extern(al_uninstall_joystick) static func (Void) -> Void
  isInstalled   : extern(al_is_joystick_installed) static func (Void) -> Bool
  reconfigure   : extern(al_reconfigure_joysticks) static func (Void) -> Bool
  getNum        : extern(al_get_num_joysticks) static func (Void) -> Int
  get           : extern(al_get_joystick) static func ( joyn:Int) -> Joystick
  release       : extern(al_release_joystick) func () -> Void
  getActive     : extern(al_get_joystick_active) func () -> Bool
  getName       : extern(al_get_joystick_name) func () -> CString
  getNumSticks  : extern(al_get_joystick_num_sticks) func () -> Int
  getStickFlags : extern(al_get_joystick_stick_flags) func ( stick:Int) -> Int
  getStickName  : extern(al_get_joystick_stick_name) func ( stick:Int) -> CString
  getNumAxes    : extern(al_get_joystick_num_axes) func ( stick:Int) -> Int
  getAxisName   : extern(al_get_joystick_axis_name) func ( stick:Int,  axis:Int) -> CString
  getNumButtons : extern(al_get_joystick_num_buttons) func () -> Int
  getButtonName : extern(al_get_joystick_button_name) func ( buttonn:Int) -> CString
  getState      : extern(al_get_joystick_state) func (ret_state : JoystickState*) -> Void
  getEventSource : extern(al_get_joystick_event_source) static func (Void) -> EventSource
}


