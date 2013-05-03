use allegro5

import allegro5/Allegro
import allegro5/Altime


EventType : cover from Int 

   ALLEGRO_EVENT_JOYSTICK_AXIS               : extern const Int
   ALLEGRO_EVENT_JOYSTICK_BUTTON_DOWN        : extern const Int
   ALLEGRO_EVENT_JOYSTICK_BUTTON_UP          : extern const Int
   ALLEGRO_EVENT_JOYSTICK_CONFIGURATION      : extern const Int

   ALLEGRO_EVENT_KEY_DOWN                    : extern const Int
   ALLEGRO_EVENT_KEY_CHAR                    : extern const Int
   ALLEGRO_EVENT_KEY_UP                      : extern const Int

   ALLEGRO_EVENT_MOUSE_AXES                  : extern const Int
   ALLEGRO_EVENT_MOUSE_BUTTON_DOWN           : extern const Int
   ALLEGRO_EVENT_MOUSE_BUTTON_UP             : extern const Int
   ALLEGRO_EVENT_MOUSE_ENTER_DISPLAY         : extern const Int
   ALLEGRO_EVENT_MOUSE_LEAVE_DISPLAY         : extern const Int
   ALLEGRO_EVENT_MOUSE_WARPED                : extern const Int

   ALLEGRO_EVENT_TIMER                       : extern const Int

   ALLEGRO_EVENT_DISPLAY_EXPOSE              : extern const Int
   ALLEGRO_EVENT_DISPLAY_RESIZE              : extern const Int
   ALLEGRO_EVENT_DISPLAY_CLOSE               : extern const Int
   ALLEGRO_EVENT_DISPLAY_LOST                : extern const Int
   ALLEGRO_EVENT_DISPLAY_FOUND               : extern const Int
   ALLEGRO_EVENT_DISPLAY_SWITCH_IN           : extern const Int
   ALLEGRO_EVENT_DISPLAY_SWITCH_OUT          : extern const Int
   ALLEGRO_EVENT_DISPLAY_ORIENTATION         : extern const Int
   ALLEGRO_EVENT_DISPLAY_HALT_DRAWING        : extern const Int
   ALLEGRO_EVENT_DISPLAY_RESUME_DRAWING      : extern const Int

   ALLEGRO_EVENT_TOUCH_BEGIN                 : extern const Int
   ALLEGRO_EVENT_TOUCH_END                   : extern const Int
   ALLEGRO_EVENT_TOUCH_MOVE                  : extern const Int
   ALLEGRO_EVENT_TOUCH_CANCEL                : extern const Int
   
   ALLEGRO_EVENT_DISPLAY_CONNECTED           : extern const Int
   ALLEGRO_EVENT_DISPLAY_DISCONNECTED        : extern const Int



eventTypeIsUser: func (t : UInt)  -> Bool {
  return t>= 512
}


getEventType: func (a, b,c , d : UInt) -> UInt {
  return Al ID(a,b,c,d)
}


AnyEvent : cover from ALLEGRO_ANY_EVENT {
   type         : extern UInt
   source       : extern Pointer
   timestamp    : extern Double
}


DisplayEvent : cover from ALLEGRO_DISPLAY_EVENT { 
   type         : extern UInt
   source       : extern Pointer
   timestamp    : extern Double
   x            : extern Int
   y            : extern Int
   width, height: extern Int
   orientation  : extern Int
}

JoystickEvent : cover from ALLEGRO_JOYSTICK_EVENT { 
   type         : extern UInt
   source       : extern Pointer
   timestamp    : extern Double
   stick, axis  : extern Int;
   pos          : extern Float;
   button       : extern Int;
}


KeyboardEvent : cover from ALLEGRO_KEYBOARD_EVENT {
   type         : extern UInt
   source       : extern Pointer
   timestamp    : extern Double
   display      : extern Display
   keycode      : extern Int
   unichar      : extern Int
   modifiers    : extern UInt;
   repeat       : extern Bool
}

MouseEvent : cover from ALLEGRO_MOUSE_EVENT {
   type                 : extern UInt
   source               : extern Pointer
   timestamp            : extern Double
   display              : extern Display
   x, y, z, w           : extern Int
   dx, dy, dz, dw       : extern Int
   button               : extern UInt
   pressure             : extern Float;
} 



TimerEvent : cover from ALLEGRO_TIMER_EVENT {
   type                 : extern UInt
   source               : extern Pointer
   timestamp            : extern Double
   count                : extern Int64
   error                : extern Double
}


TouchEvent : cover from ALLEGRO_TOUCH_EVENT {
   type                 : extern UInt
   source               : extern Pointer
   timestamp            : extern Double
   display              : extern Display
   id                   : extern Int;
   x, y                 : extern Float;
   dx, dy               : extern Float;
   primary              : extern Bool;
}

UserEvent : cover from ALLEGRO_USER_EVENT {
   type                 : extern UInt
   source               : extern Pointer
   timestamp            : extern Double
   __internal__descr    : extern Pointer
   data1                : extern Pointer
   data2                : extern Pointer
   data3                : extern Pointer
   data4                : extern Pointer
   
   unref : extern(al_unref_user_event) static func (uevent : UserEvent*) -> Void
   
}

Event : cover from ALLEGRO_EVENT {
  type                  : extern UInt
  any                   : extern AnyEvent
  display               : extern DisplayEvent
  joystick              : extern JoystickEvent
  keyboard              : extern KeyboardEvent
  mouse                 : extern MouseEvent
  timer                 : extern TimerEvent
  touch                 : extern TouchEvent
  user                  : extern UserEvent
}


EventSourceStruct : cover from ALLEGRO_EVENT_SOURCE {}

EventSource : cover from ALLEGRO_EVENT_SOURCE * {
  initUser    : extern(al_init_user_event_source) func ()    -> Void
  destroyUser : extern(al_destroy_user_event_source) func () -> Void
  setData : extern(al_set_event_source_data) func ( data : Pointer) -> Void
  getData : extern(al_get_event_source_data) func () -> Pointer
}

EventQueue : cover from ALLEGRO_EVENT_QUEUE * {
  create : extern(al_create_event_queue) static func (Void) -> EventQueue
  destroy: extern(al_destroy_event_queue) func () -> Void
  registerEventSource : extern(al_register_event_source) func (src : EventSource) -> Void
  unregisterEventSource : extern(al_unregister_event_source) func (src : EventSource) -> Void
  pause : extern(al_pause_event_queue) func (b : Bool) -> Void
  isPaused : extern(al_is_event_queue_paused) func () -> Bool
  isEmpty : extern(al_is_event_queue_empty) func () -> Bool
  getNextEvent : extern(al_get_next_event)func (ret_event : Event*) -> Bool
  peekNextEvent : extern(al_peek_next_event) func (ret_event:Event*) -> Bool
  dropNextEvent : extern(al_drop_next_event) func () -> Bool
  flush : extern(al_flush_event_queue) func () -> Void
  waitForEvent : extern(al_wait_for_event) func (ret_event: Event *) -> Void
  waitForEventTimed : extern(al_wait_for_event_timed) func (ret_event:Event*,  secs:Float) -> Bool
  waitForEventUntil : extern(al_wait_for_event_until) func (ret_event:Event*,  timeout:Timeout*) -> Bool
}




