use allegro5

import allegro5/Event

/* Keyboard wrappers and key codes. */

KeyboardState : cover frome ALLEGRO_KEYBOARD_STATE {
   display : Display
   keyDown : extern(al_key_down) func (keycode:Int) -> Bool
}

Keyboard : cover from ALLEGRO_KEYBOARD * { 
  isInstalled : extern(al_is_keyboard_installed) static func (Void) -> Bool
  install : extern(al_install_keyboard) static func (Void) -> Bool
  uninstall : extern(al_uninstall_keyboard) static func (Void) -> Void
  setLeds : extern(al_set_keyboard_leds) static func (leds:Int) -> Bool
  keycodeToName : extern(al_keycode_to_name) static func (keycode:Int) -> CString
  getState : extern(al_get_keyboard_state) static func (ret_state : KeyboardState *) -> Void
  getEventSource : extern(al_get_keyboard_event_source) static func (Void) -> EventSource *
} 





ALLEGRO_KEY_A                : extern const Int
ALLEGRO_KEY_B                : extern const Int
ALLEGRO_KEY_C                : extern const Int
ALLEGRO_KEY_D                : extern const Int
ALLEGRO_KEY_E                : extern const Int
ALLEGRO_KEY_F                : extern const Int
ALLEGRO_KEY_G                : extern const Int
ALLEGRO_KEY_H                : extern const Int
ALLEGRO_KEY_I                : extern const Int
ALLEGRO_KEY_J                : extern const Int
ALLEGRO_KEY_K                : extern const Int
ALLEGRO_KEY_L                : extern const Int
ALLEGRO_KEY_M                : extern const Int
ALLEGRO_KEY_N                : extern const Int
ALLEGRO_KEY_O                : extern const Int
ALLEGRO_KEY_P                : extern const Int
ALLEGRO_KEY_Q                : extern const Int
ALLEGRO_KEY_R                : extern const Int
ALLEGRO_KEY_S                : extern const Int
ALLEGRO_KEY_T                : extern const Int
ALLEGRO_KEY_U                : extern const Int
ALLEGRO_KEY_V                : extern const Int
ALLEGRO_KEY_W                : extern const Int
ALLEGRO_KEY_X                : extern const Int
ALLEGRO_KEY_Y                : extern const Int
ALLEGRO_KEY_Z                : extern const Int

ALLEGRO_KEY_0                : extern const Int
ALLEGRO_KEY_1                : extern const Int
ALLEGRO_KEY_2                : extern const Int
ALLEGRO_KEY_3                : extern const Int
ALLEGRO_KEY_4                : extern const Int
ALLEGRO_KEY_5                : extern const Int
ALLEGRO_KEY_6                : extern const Int
ALLEGRO_KEY_7                : extern const Int
ALLEGRO_KEY_8                : extern const Int
ALLEGRO_KEY_9                : extern const Int

ALLEGRO_KEY_PAD_0            : extern const Int
ALLEGRO_KEY_PAD_1            : extern const Int
ALLEGRO_KEY_PAD_2            : extern const Int
ALLEGRO_KEY_PAD_3            : extern const Int
ALLEGRO_KEY_PAD_4            : extern const Int
ALLEGRO_KEY_PAD_5            : extern const Int
ALLEGRO_KEY_PAD_6            : extern const Int
ALLEGRO_KEY_PAD_7            : extern const Int
ALLEGRO_KEY_PAD_8            : extern const Int
ALLEGRO_KEY_PAD_9            : extern const Int

ALLEGRO_KEY_F1               : extern const Int
ALLEGRO_KEY_F2               : extern const Int
ALLEGRO_KEY_F3               : extern const Int
ALLEGRO_KEY_F4               : extern const Int
ALLEGRO_KEY_F5               : extern const Int
ALLEGRO_KEY_F6               : extern const Int
ALLEGRO_KEY_F7               : extern const Int
ALLEGRO_KEY_F8               : extern const Int
ALLEGRO_KEY_F9               : extern const Int
ALLEGRO_KEY_F10              : extern const Int
ALLEGRO_KEY_F11              : extern const Int
ALLEGRO_KEY_F12              : extern const Int

ALLEGRO_KEY_ESCAPE   : extern const Int
ALLEGRO_KEY_TILDE            : extern const Int
ALLEGRO_KEY_MINUS            : extern const Int
ALLEGRO_KEY_EQUALS   : extern const Int
ALLEGRO_KEY_BACKSPACE        : extern const Int
ALLEGRO_KEY_TAB              : extern const Int
ALLEGRO_KEY_OPENBRACE        : extern const Int
ALLEGRO_KEY_CLOSEBRACE       : extern const Int
ALLEGRO_KEY_ENTER            : extern const Int
ALLEGRO_KEY_SEMICOLON        : extern const Int
ALLEGRO_KEY_QUOTE            : extern const Int
ALLEGRO_KEY_BACKSLASH        : extern const Int
ALLEGRO_KEY_BACKSLASH2       : extern const Int
ALLEGRO_KEY_COMMA            : extern const Int
ALLEGRO_KEY_FULLSTOP : extern const Int
ALLEGRO_KEY_SLASH            : extern const Int
ALLEGRO_KEY_SPACE            : extern const Int

ALLEGRO_KEY_INSERT   : extern const Int
ALLEGRO_KEY_DELETE   : extern const Int
ALLEGRO_KEY_HOME             : extern const Int
ALLEGRO_KEY_END              : extern const Int
ALLEGRO_KEY_PGUP             : extern const Int
ALLEGRO_KEY_PGDN             : extern const Int
ALLEGRO_KEY_LEFT             : extern const Int
ALLEGRO_KEY_RIGHT            : extern const Int
ALLEGRO_KEY_UP               : extern const Int
ALLEGRO_KEY_DOWN             : extern const Int

ALLEGRO_KEY_PAD_SLASH        : extern const Int
ALLEGRO_KEY_PAD_ASTERISK     : extern const Int
ALLEGRO_KEY_PAD_MINUS        : extern const Int
ALLEGRO_KEY_PAD_PLUS : extern const Int
ALLEGRO_KEY_PAD_DELETE       : extern const Int
ALLEGRO_KEY_PAD_ENTER        : extern const Int

ALLEGRO_KEY_PRINTSCREEN      : extern const Int
ALLEGRO_KEY_PAUSE            : extern const Int

ALLEGRO_KEY_ABNT_C1  : extern const Int
ALLEGRO_KEY_YEN              : extern const Int
ALLEGRO_KEY_KANA             : extern const Int
ALLEGRO_KEY_CONVERT  : extern const Int
ALLEGRO_KEY_NOCONVERT        : extern const Int
ALLEGRO_KEY_AT               : extern const Int
ALLEGRO_KEY_CIRCUMFLEX       : extern const Int
ALLEGRO_KEY_COLON2   : extern const Int
ALLEGRO_KEY_KANJI            : extern const Int

ALLEGRO_KEY_PAD_EQUALS       : extern const Int
ALLEGRO_KEY_BACKQUOTE        : extern const Int
ALLEGRO_KEY_SEMICOLON2       : extern const Int
ALLEGRO_KEY_COMMAND  : extern const Int 

ALLEGRO_KEY_BACK : extern const Int
ALLEGRO_KEY_VOLUME_UP : extern const Int
ALLEGRO_KEY_VOLUME_DOWN : extern const Int

ALLEGRO_KEY_UNKNOWN      : extern const Int



ALLEGRO_KEY_MODIFIERS        : extern const Int

ALLEGRO_KEY_LSHIFT   : extern const Int
ALLEGRO_KEY_RSHIFT   : extern const Int
ALLEGRO_KEY_LCTRL    : extern const Int
ALLEGRO_KEY_RCTRL    : extern const Int
ALLEGRO_KEY_ALT              : extern const Int
ALLEGRO_KEY_ALTGR    : extern const Int
ALLEGRO_KEY_LWIN             : extern const Int
ALLEGRO_KEY_RWIN             : extern const Int
ALLEGRO_KEY_MENU             : extern const Int
ALLEGRO_KEY_SCROLLLOCK : extern const Int
ALLEGRO_KEY_NUMLOCK  : extern const Int
ALLEGRO_KEY_CAPSLOCK : extern const Int

ALLEGRO_KEY_MAX : extern const Int



/* Key modifiers */

ALLEGRO_KEYMOD_SHIFT       : extern const Int
ALLEGRO_KEYMOD_CTRL        : extern const Int
ALLEGRO_KEYMOD_ALT         : extern const Int
ALLEGRO_KEYMOD_LWIN        : extern const Int
ALLEGRO_KEYMOD_RWIN        : extern const Int
ALLEGRO_KEYMOD_MENU        : extern const Int
ALLEGRO_KEYMOD_ALTGR       : extern const Int
ALLEGRO_KEYMOD_COMMAND     : extern const Int
ALLEGRO_KEYMOD_SCROLLLOCK  : extern const Int
ALLEGRO_KEYMOD_NUMLOCK     : extern const Int
ALLEGRO_KEYMOD_CAPSLOCK    : extern const Int
ALLEGRO_KEYMOD_INALTSEQ       : extern const Int
ALLEGRO_KEYMOD_ACCENT1     : extern const Int
ALLEGRO_KEYMOD_ACCENT2     : extern const Int
ALLEGRO_KEYMOD_ACCENT3     : extern const Int
ALLEGRO_KEYMOD_ACCENT4     : extern const Int

