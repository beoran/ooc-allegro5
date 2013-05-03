use allegro5

import allegro5/Event
import allegro5/AllegroFile
import allegro5/Path

ALLEGRO_VERSION         : extern const UInt32
ALLEGRO_SUB_VERSION     : extern const UInt32
ALLEGRO_WIP_VERSION     : extern const UInt32
ALLEGRO_RELEASE_NUMBER  : extern const UInt32
ALLEGRO_VERSION_STR     : extern const CString
ALLEGRO_DATE_STR        : extern const CString
ALLEGRO_DATE            : extern const Int
ALLEGRO_PI              : extern const Double
ALLEGRO_VERSION_INT     : extern const UInt32

/*
#define ALLEGRO_VERSION_INT \
    ((ALLEGRO_VERSION << 24) | (ALLEGRO_SUB_VERSION << 16) | \
    (ALLEGRO_WIP_VERSION << 8) | ALLEGRO_RELEASE_NUMBER)
*/


ConfigSection : cover from ALLEGRO_CONFIG_SECTION * {
  
}

ConfigEntry : cover from ALLEGRO_CONFIG_ENTRY * {
  
}

AllegroSystem : cover from ALLEGRO_SYSTEM * { 

}

/** Cover for config functions. */
Config : cover from ALLEGRO_CONFIG  * {
  create     : extern(al_create_config) static func (Void) -> Config
  addSection : extern(al_add_config_section) func(s : CString) -> Void
  setValue : extern(al_set_config_value)     func(s : CString, k : CString, v: CString) -> Void
  addComment : extern(al_add_config_comment) func (s : CString, c : CString) -> Void
  getValue : extern(al_get_config_value) static func (s : CString, k : CString) -> const CString
  loadFile : extern(al_load_config_file) static func (s : CString) -> Config
  loadFileF : extern(al_load_config_file_f) static func (filename : AllegroFile) -> Config
  saveFile : extern(al_save_config_file) static func (s : CString, c: Config) -> Bool
  saveFileF : extern(al_save_config_file_f) static func (file:AllegroFile, c: Config) -> Bool
  mergeInto : extern(al_merge_config_into) func (c: Config) -> Void
  merge : extern(al_merge_config) static func (c1 : Config, c2 : Config) -> Config
  destroy : extern(al_destroy_config) func () -> Void
  removeSection : extern(al_remove_config_section) func (s : CString) -> Bool
  removeKey : extern(al_remove_config_key) func (config:Config, s : CString, k : CString) -> Bool
  
  /* XXX: double pointers these are bound to be a bit iffy... */
  getFirstSection : extern(al_get_first_config_section) func (iterator : ConfigSection *) -> CString
  getNextSection : extern(al_get_next_config_section) static func (iterator : ConfigSection *) -> CString
  getFirstEntry : extern(al_get_first_config_entry) func (s : CString, iterator : ConfigEntry *) -> CString
  getNextEntry : extern(al_get_next_config_entry) static func (ConfigEntry**) -> CString
}


ALLEGRO_STATE_NEW_DISPLAY_PARAMETERS : extern const Int
ALLEGRO_STATE_NEW_BITMAP_PARAMETERS  : extern const Int
ALLEGRO_STATE_DISPLAY                : extern const Int
ALLEGRO_STATE_TARGET_BITMAP          : extern const Int
ALLEGRO_STATE_BLENDER                : extern const Int
ALLEGRO_STATE_NEW_FILE_INTERFACE     : extern const Int
ALLEGRO_STATE_TRANSFORM              : extern const Int

ALLEGRO_STATE_BITMAP                 : extern const Int
ALLEGRO_STATE_ALL                    : extern const Int

AllegroStateStruct : cover from ALLEGRO_STATE

AllegroState : cover from ALLEGRO_STATE * {
  store : extern(al_store_state)  func (flags : Int) -> Void
  restore: extern(al_restore_state) func() -> Void
}



Al : cover { 
  getTime: extern(al_get_time) static func () -> Double
  rest: extern(al_rest)  static func (seconds : Double) 
  
  mallocWithContext: extern(al_malloc_with_context) \
    static func(n:  SizeT, line : Int, file : CString, funcname : CString) -> Pointer
  freeWithContext: extern(al_free_with_context) \
    static func(ptr : Pointer, line : Int, file : CString, funcname : CString) -> Void
  
  malloc : static func(n : SizeT) -> Pointer {
    return mallocWithContext(n, 0, "Allegro.ooc", "malloc") 
  }
  
  free : static func(ptr : Pointer) -> Void {
    freeWithContext(ptr, 0, "Allegro.ooc", "malloc") 
  }
  
  versionInt : static func() -> UInt32 {
    return ((ALLEGRO_VERSION << 24) | (ALLEGRO_SUB_VERSION << 16) | \
            (ALLEGRO_WIP_VERSION << 8) | ALLEGRO_RELEASE_NUMBER)
  }
  
  /* Generates an Allegro ID based on 4 input numbers. */
  ID: static func (a , b, c, d : UInt32) -> UInt32 {
    return (((a)<<24) | ((b)<<16) | ((c)<<8) | (d))
  }
  
  // MainFunc : Func(a : Int, v : CString *) -> Int
  
  getVersion : extern(al_get_allegro_version) static func () ->  UInt32
  
  // XXX: this prototype is probably not correct.
  runMain : extern(al_run_main) static func (argc : Int, argv : CString*, f : Func) -> Int
  
  
  getErrno : extern(al_get_errno) static func (Void) -> Int
  setErrno : extern(al_set_errno) static func (errnum:Int) -> Void

  
  installSystem   : extern(al_install_system) static func(version : Int, atexit : Pointer) -> Bool
  uninstallSystem : extern(al_uninstall_system) static func (Void) -> Void
  isSystemInstalled : extern(al_is_system_installed) static func (Void) -> Bool
  getSystemDriver : extern(al_get_system_driver) static func (Void) -> AllegroSystem
  getSystemConfig : extern(al_get_system_config) static func (Void) -> Config
  getStandardPath : extern(al_get_standard_path) static func ( id:Int) -> Path
  setExeName : extern(al_set_exe_name) static func ( path: CString) -> Void
  setOrgName : extern(al_set_org_name) static func ( org_name:CString) -> Void
  setAppName : extern(al_set_app_name) static func ( app_name:CString) -> Void
  getOrgName : extern(al_get_org_name) static func (Void) -> CString
  getAppName : extern(al_get_app_name) static func (Void) -> CString
  inhibitScreensaver : extern(al_inhibit_screensaver) static func (inhibit:Bool) -> Bool
  atexit : extern(atexit) static func(fptr: Pointer) -> Int
  init : static func() -> Bool {
    installSystem(ALLEGRO_VERSION_INT, atexit)
  }
 

}

/*
 * Bitmap flags
 */
ALLEGRO_MEMORY_BITMAP            : extern const Int
_ALLEGRO_KEEP_BITMAP_FORMAT      : extern const Int
ALLEGRO_FORCE_LOCKING            : extern const Int
ALLEGRO_NO_PRESERVE_TEXTURE      : extern const Int
_ALLEGRO_ALPHA_TEST              : extern const Int
_ALLEGRO_INTERNAL_OPENGL         : extern const Int
ALLEGRO_MIN_LINEAR               : extern const Int
ALLEGRO_MAG_LINEAR               : extern const Int
ALLEGRO_MIPMAP                   : extern const Int
_ALLEGRO_NO_PREMULTIPLIED_ALPHA  : extern const Int
ALLEGRO_VIDEO_BITMAP             : extern const Int
ALLEGRO_CONVERT_BITMAP           : extern const Int
ALLEGRO_FLIP_HORIZONTAL          : extern const Int
ALLEGRO_FLIP_VERTICAL            : extern const Int
ALLEGRO_KEEP_BITMAP_FORMAT       : extern const Int
ALLEGRO_NO_PREMULTIPLIED_ALPHA   : extern const Int
ALLEGRO_KEEP_INDEX               : extern const Int


ALLEGRO_LOCK_READWRITE  : extern const Int
ALLEGRO_LOCK_READONLY   : extern const Int
ALLEGRO_LOCK_WRITEONLY  : extern const Int

ALLEGRO_PIXEL_FORMAT_ANY: extern const Int
ALLEGRO_PIXEL_FORMAT_ANY_NO_ALPHA: extern const Int
ALLEGRO_PIXEL_FORMAT_ANY_WITH_ALPHA: extern const Int
ALLEGRO_PIXEL_FORMAT_ANY_15_NO_ALPHA: extern const Int
ALLEGRO_PIXEL_FORMAT_ANY_16_NO_ALPHA: extern const Int
ALLEGRO_PIXEL_FORMAT_ANY_16_WITH_ALPHA: extern const Int
ALLEGRO_PIXEL_FORMAT_ANY_24_NO_ALPHA: extern const Int
ALLEGRO_PIXEL_FORMAT_ANY_32_NO_ALPHA: extern const Int
ALLEGRO_PIXEL_FORMAT_ANY_32_WITH_ALPHA: extern const Int
ALLEGRO_PIXEL_FORMAT_ARGB_8888: extern const Int
ALLEGRO_PIXEL_FORMAT_RGBA_8888: extern const Int
ALLEGRO_PIXEL_FORMAT_ARGB_4444: extern const Int
ALLEGRO_PIXEL_FORMAT_RGB_888: extern const Int        /* 24 bit format */
ALLEGRO_PIXEL_FORMAT_RGB_565: extern const Int
ALLEGRO_PIXEL_FORMAT_RGB_555: extern const Int
ALLEGRO_PIXEL_FORMAT_RGBA_5551: extern const Int
ALLEGRO_PIXEL_FORMAT_ARGB_1555: extern const Int
ALLEGRO_PIXEL_FORMAT_ABGR_8888: extern const Int
ALLEGRO_PIXEL_FORMAT_XBGR_8888: extern const Int
ALLEGRO_PIXEL_FORMAT_BGR_888: extern const Int        /* 24 bit format */
ALLEGRO_PIXEL_FORMAT_BGR_565: extern const Int
ALLEGRO_PIXEL_FORMAT_BGR_555: extern const Int
ALLEGRO_PIXEL_FORMAT_RGBX_8888: extern const Int
ALLEGRO_PIXEL_FORMAT_XRGB_8888: extern const Int
ALLEGRO_PIXEL_FORMAT_ABGR_F32: extern const Int
ALLEGRO_PIXEL_FORMAT_ABGR_8888_LE: extern const Int
ALLEGRO_PIXEL_FORMAT_RGBA_4444: extern const Int
ALLEGRO_PIXEL_FORMAT_SINGLE_CHANNEL_8: extern const Int
ALLEGRO_NUM_PIXEL_FORMATS: extern const Int





/*
IioLoaderFunction  : cover from ALLEGRO_IIO_LOADER_FUNCTION
IioFsLoaderFunction : cover from  ALLEGRO_FS_LOADER_FUNCTION
IioSaverFunction : cover from  ALLEGRO_IIO_SAVER_FUNCTION
IioFsSaverFunction : cover from  ALLEGRO_FS_SAVER_FUNCTION
*/


Color : cover from ALLEGRO_COLOR {
    r, g, b, a : Float;
    mapRgb          : extern(al_map_rgb) static func (r : UChar, g : UChar, b : UChar) -> Color
    mapRgba         : extern(al_map_rgba) static func (r : UChar, g : UChar, b : UChar, a : UChar) -> Color
    mapRgb          : extern(al_map_rgb_f) static func~F (r:Float, g:Float, b:Float) -> Color
    mapRgba         : extern(al_map_rgba_f) static func~F (r:Float, g:Float, b:Float, a:Float) -> Color
    unmapRgb        : extern(al_unmap_rgb)  func (r : UChar *, g : UChar *, b : UChar *) -> Void
    unmapRgba       : extern(al_unmap_rgba) func (r : UChar *, g : UChar *, b : UChar *, a : UChar *) -> Void
    unmapRgb        : extern(al_unmap_rgb_f) func~F (r:Float *, g:Float *, b:Float *) -> Void
    unmapRgba       : extern(al_unmap_rgba_f) func~F (r:Float *, g:Float *, b:Float *, a:Float *) -> Void
    pixelSize       : extern(al_get_pixel_size) static func (format:Int) -> Int
    pixelFormatBits : extern(al_get_pixel_format_bits) static func (format:Int) -> Int
}


LockedRegion : cover from  ALLEGRO_LOCKED_REGION { 
  data          : Pointer
  format        : Int
  pitch         : Int
  pixel_size    : Int
}



Bitmap : cover from ALLEGRO_BITMAP * { 

setNewFormat : extern(al_set_new_bitmap_format) static func (format:Int) -> Void
setNewFlags : extern(al_set_new_bitmap_flags) static func (flags:Int) -> Void
getNewFormat : extern(al_get_new_bitmap_format) static func (Void) -> Int
getNewFlags : extern(al_get_new_bitmap_flags) static func (Void) -> Int
addNewFlag : extern(al_add_new_bitmap_flag) static func (flag:Int) -> Void
getWidth : extern(al_get_bitmap_width) func () -> Int
getHeight : extern(al_get_bitmap_height) func () -> Int
getFormat : extern(al_get_bitmap_format) func () -> Int
getlags : extern(al_get_bitmap_flags) func () -> Int
create : extern(al_create_bitmap) static func (w:Int, h:Int) -> Bitmap
destroy : extern(al_destroy_bitmap) func () -> Void
putPixel : extern(al_put_pixel) static func (x:Int, y:Int, color:Color) -> Void
putBlendedPixel : extern(al_put_blended_pixel) static func (x:Int, y:Int, color:Color) -> Void
getPixel : extern(al_get_pixel) func (x:Int, y:Int) -> Color
convertMaskToAlpha : extern(al_convert_mask_to_alpha) func (mask_color:Color) -> Void
setClippingRectangle : extern(al_set_clipping_rectangle) static func (x:Int, y:Int, width:Int, height:Int) -> Void
resetClippingRectangle : extern(al_reset_clipping_rectangle) static func (Void) -> Void
getClippingRectangle : extern(al_get_clipping_rectangle) static func (x:Int *, y:Int *, w:Int *, h:Int *) -> Void
createSubBitmap : extern(al_create_sub_bitmap) func (x:Int, y:Int, w:Int, h:Int) -> Bitmap
isSubBitmap : extern(al_is_sub_bitmap) func () -> Bool
getParentBitmap : extern(al_get_parent_bitmap) func () -> Bitmap
cloneBitmap : extern(al_clone_bitmap) func () -> Bitmap
convertBitmap : extern(al_convert_bitmap) func () -> Void
convertBitmaps : extern(al_convert_bitmaps) static func (Void) -> Void
_putPixel : extern(_al_put_pixel) func (x:Int, y:Int, color:Color) -> Void

draw: extern(al_draw_bitmap) func (dx:Float, dy:Float, flags:Int) -> Void
drawRegion : extern(al_draw_bitmap_region) func (sx:Float, sy:Float, sw:Float, sh:Float, dx:Float, dy:Float, flags:Int) -> Void
drawScaled : extern(al_draw_scaled_bitmap) func (sx:Float, sy:Float, sw:Float, sh:Float, dx:Float, dy:Float, dw:Float, dh:Float, flags:Int) -> Void
drawRotated : extern(al_draw_rotated_bitmap) func (cx:Float, cy:Float, dx:Float, dy:Float, angle:Float, flags:Int) -> Void
drawScaledRotated : extern(al_draw_scaled_rotated_bitmap) func (cx:Float, cy:Float, dx:Float, dy:Float, xscale:Float, yscale:Float, angle:Float, flags:Int) -> Void
drawTinted : extern(al_draw_tinted_bitmap) func (tint:Color, dx:Float, dy:Float, flags:Int) -> Void
drawTintedRegion : extern(al_draw_tinted_bitmap_region) func (tint:Color, sx:Float, sy:Float, sw:Float, sh:Float, dx:Float, dy:Float, flags:Int) -> Void
drawTintedScaled : extern(al_draw_tinted_scaled_bitmap) func (tint:Color, sx:Float, sy:Float, sw:Float, sh:Float, dx:Float, dy:Float, dw:Float, dh:Float, flags:Int) -> Void
drawTintedRotated : extern(al_draw_tinted_rotated_bitmap) func (tint:Color, cx:Float, cy:Float, dx:Float, dy:Float, angle:Float, flags:Int) -> Void
drawTintedScaledRotated : extern(al_draw_tinted_scaled_rotated_bitmap) func (tint:Color, cx:Float, cy:Float, dx:Float, dy:Float, xscale:Float, yscale:Float, angle:Float, flags:Int) -> Void
drawTintedScaledRotatedRegion : extern(al_draw_tinted_scaled_rotated_bitmap_region) func (sx:Float, sy:Float, sw:Float, sh:Float, tint:Color, cx:Float, cy:Float, dx:Float, dy:Float, xscale:Float, yscale:Float, angle:Float, flags:Int) -> Void


/*
 * TODO: (how to wrap C function pointers???) 
registerLoader : extern(al_register_bitmap_loader) static func (s : CString, loader:ALLEGRO_IIO_LOADER_FUNCTION) -> Bool
registerSaver : extern(al_register_bitmap_saver) static func (s : CString, saver:ALLEGRO_IIO_SAVER_FUNCTION) -> Bool
registerLoaderF : extern(al_register_bitmap_loader_f) static func (s : CString, fs_loader:ALLEGRO_IIO_FS_LOADER_FUNCTION) -> Bool
registerSaverF : extern(al_register_bitmap_saver_f) static func (s : CString, fs_saver:ALLEGRO_IIO_FS_SAVER_FUNCTION) -> Bool
*/

load : extern(al_load_bitmap) static func (s : CString) -> Bitmap
loadFlags : extern(al_load_bitmap_flags) static func (s : CString, flags:Int) -> Bitmap
loadF : extern(al_load_bitmap_f) static func (fp:AllegroFile, s : CString) -> Bitmap
loadFlagsF : extern(al_load_bitmap_flags_f) static func (fp:AllegroFile*, s : CString, flags:Int) -> Bitmap
save : extern(al_save_bitmap) static func (s : CString, bitmap:Bitmap) -> Bool
saveF : extern(al_save_bitmap_f) static func (fp:AllegroFile, s : CString, bitmap:Bitmap) -> Bool

lock : extern(al_lock_bitmap) func (format:Int, flags:Int) -> LockedRegion
lockRegion : extern(al_lock_bitmap_region) func (x:Int, y:Int, width:Int, height:Int, format:Int, flags:Int) -> LockedRegion
unlock : extern(al_unlock_bitmap) func () -> Void
isLocked : extern(al_is_bitmap_locked) func () -> Bool

}


/* Blending flags. */
ALLEGRO_ZERO                 : extern const Int
ALLEGRO_ONE                  : extern const Int
ALLEGRO_ALPHA                : extern const Int
ALLEGRO_INVERSE_ALPHA        : extern const Int
ALLEGRO_SRC_COLOR            : extern const Int
ALLEGRO_DST_COLOR            : extern const Int
ALLEGRO_INVERSE_SRC_COLOR    : extern const Int
ALLEGRO_INVERSE_DST_COLOR    : extern const Int
ALLEGRO_ADD                  : extern const Int
ALLEGRO_SRC_MINUS_DEST       : extern const Int
ALLEGRO_DEST_MINUS_SRC       : extern const Int
ALLEGRO_NUM_BLEND_OPERATIONS : extern const Int

/** Cover for blending functions. */
Blender : cover { 
  set : extern(al_set_blender) static func (op:Int, source:Int, dest:Int) -> Void
  get : extern(al_get_blender) static func (op:Int *, source:Int *, dest:Int *) -> Void
  set : extern(al_set_separate_blender) \
  static func~Separate (op:Int, source:Int, dest:Int, alpha_op:Int, alpha_source:Int, alpha_dest:Int) -> Void
  get : extern(al_get_separate_blender) \
  static func~Separate (op:Int *, source:Int *, dest:Int *, alpha_op:Int *, alpha_src:Int *, alpha_dest:Int *) -> Void
}


/* debug.h is not wrapped */

/* Possible bit combinations for the flags parameter of al_create_display. */
ALLEGRO_WINDOWED                    : extern const Int
ALLEGRO_FULLSCREEN                  : extern const Int
ALLEGRO_OPENGL                      : extern const Int
ALLEGRO_DIRECT3D_INTERNAL           : extern const Int
ALLEGRO_RESIZABLE                   : extern const Int
ALLEGRO_FRAMELESS                   : extern const Int
ALLEGRO_NOFRAME                     : extern const Int /* older synonym */
ALLEGRO_GENERATE_EXPOSE_EVENTS      : extern const Int
ALLEGRO_OPENGL_3_0                  : extern const Int
ALLEGRO_OPENGL_FORWARD_COMPATIBLE   : extern const Int
ALLEGRO_FULLSCREEN_WINDOW           : extern const Int
ALLEGRO_MINIMIZED                   : extern const Int
ALLEGRO_USE_PROGRAMMABLE_PIPELINE   : extern const Int
ALLEGRO_GTK_TOPLEVEL_INTERNAL       : extern const Int


/* Possible parameters for al_set_display_option.
 */
ALLEGRO_RED_SIZE: extern const Int
ALLEGRO_GREEN_SIZE: extern const Int
ALLEGRO_BLUE_SIZE: extern const Int
ALLEGRO_ALPHA_SIZE: extern const Int
ALLEGRO_RED_SHIFT: extern const Int
ALLEGRO_GREEN_SHIFT: extern const Int
ALLEGRO_BLUE_SHIFT: extern const Int
ALLEGRO_ALPHA_SHIFT: extern const Int
ALLEGRO_ACC_RED_SIZE: extern const Int
ALLEGRO_ACC_GREEN_SIZE: extern const Int
ALLEGRO_ACC_BLUE_SIZE: extern const Int
ALLEGRO_ACC_ALPHA_SIZE: extern const Int
ALLEGRO_STEREO: extern const Int
ALLEGRO_AUX_BUFFERS: extern const Int
ALLEGRO_COLOR_SIZE: extern const Int
ALLEGRO_DEPTH_SIZE: extern const Int
ALLEGRO_STENCIL_SIZE: extern const Int
ALLEGRO_SAMPLE_BUFFERS: extern const Int
ALLEGRO_SAMPLES: extern const Int
ALLEGRO_RENDER_METHOD: extern const Int
ALLEGRO_FLOAT_COLOR: extern const Int
ALLEGRO_FLOAT_DEPTH: extern const Int
ALLEGRO_SINGLE_BUFFER: extern const Int
ALLEGRO_SWAP_METHOD: extern const Int
ALLEGRO_COMPATIBLE_DISPLAY: extern const Int
ALLEGRO_UPDATE_DISPLAY_REGION: extern const Int
ALLEGRO_VSYNC: extern const Int
ALLEGRO_MAX_BITMAP_SIZE: extern const Int
ALLEGRO_SUPPORT_NPOT_BITMAP: extern const Int
ALLEGRO_CAN_DRAW_INTO_BITMAP: extern const Int
ALLEGRO_SUPPORT_SEPARATE_ALPHA: extern const Int
ALLEGRO_AUTO_CONVERT_BITMAPS: extern const Int
ALLEGRO_SUPPORTED_ORIENTATIONS: extern const Int
ALLEGRO_DISPLAY_OPTIONS_COUNT: extern const Int


ALLEGRO_DONTCARE: extern const Int
ALLEGRO_REQUIRE: extern const Int
ALLEGRO_SUGGEST: extern const Int


/* Bitflags so they can be used for the ALLEGRO_SUPPORTED_ORIENTATIONS option. */
ALLEGRO_DISPLAY_ORIENTATION_UNKNOWN : extern const Int
ALLEGRO_DISPLAY_ORIENTATION_0_DEGREES : extern const Int
ALLEGRO_DISPLAY_ORIENTATION_90_DEGREES : extern const Int
ALLEGRO_DISPLAY_ORIENTATION_180_DEGREES : extern const Int
ALLEGRO_DISPLAY_ORIENTATION_270_DEGREES : extern const Int
ALLEGRO_DISPLAY_ORIENTATION_PORTRAIT : extern const Int
ALLEGRO_DISPLAY_ORIENTATION_LANDSCAPE : extern const Int
ALLEGRO_DISPLAY_ORIENTATION_ALL : extern const Int
ALLEGRO_DISPLAY_ORIENTATION_FACE_UP : extern const Int
ALLEGRO_DISPLAY_ORIENTATION_FACE_DOWN : extern const Int




Display : cover from ALLEGRO_DISPLAY * {
  setNewRefreshRate : extern(al_set_new_display_refresh_rate) static func (refresh_rate:Int) -> Void
  setNewFlags : extern(al_set_new_display_flags) static func (flags:Int) -> Void
  getNewRefreshRate : extern(al_get_new_display_refresh_rate) static func (Void) -> Int
  getNewFlags : extern(al_get_new_display_flags) static func (Void) -> Int
  getWidth : extern(al_get_display_width) func () -> Int
  getHeight : extern(al_get_display_height) func () -> Int
  getFormat : extern(al_get_display_format) func () -> Int
  getRefreshRate : extern(al_get_display_refresh_rate) func () -> Int
  getFlags : extern(al_get_display_flags) func () -> Int
  getOrientation : extern(al_get_display_orientation) func () -> Int
  setFlag : extern(al_set_display_flag) func (flag:Int, onoff:Bool) -> Bool
  create : extern(al_create_display) static func (w:Int, h:Int) -> Display
  destroy : extern(al_destroy_display) func () -> Void
  getCurrent : extern(al_get_current_display) static func (Void) -> Display
  setTargetBitmap : extern(al_set_target_bitmap) static func (bitmap:Bitmap) -> Void
  setTargetBackbuffer : extern(al_set_target_backbuffer) func () -> Void
  getBackbuffer : extern(al_get_backbuffer) func () -> Bitmap
  getTargetBitmap : extern(al_get_target_bitmap) static func (Void) -> Bitmap
  acknowledgeResize : extern(al_acknowledge_resize) func () -> Bool
  resize : extern(al_resize_display) func (width:Int, height:Int) -> Bool
  flip : extern(al_flip_display) static func (Void) -> Void
  updateDisplayRegion : extern(al_update_display_region) static func (x:Int, y:Int, width:Int, height:Int) -> Void
  isCompatibleBitmap : extern(al_is_compatible_bitmap) static func (bitmap:Bitmap) -> Bool
  waitForVsync : extern(al_wait_for_vsync) static func (Void) -> Bool
  getEventSource : extern(al_get_display_event_source) func () -> EventSource
  setIcon : extern(al_set_display_icon) func (icon:Bitmap) -> Void
  setIcons : extern(al_set_display_icons) func (num_icons:Int, icons:Bitmap*) -> Void
  getNewAdapter : extern(al_get_new_display_adapter) static func (Void) -> Int
  setNewAdapter : extern(al_set_new_display_adapter) static func (adapter:Int) -> Void
  setNewWindowPosition : extern(al_set_new_window_position) static func (x:Int, y:Int) -> Void
  getNewWindowPosition : extern(al_get_new_window_position) static func (x:Int *, y:Int *) -> Void
  setWindowPosition : extern(al_set_window_position) func (x:Int, y:Int) -> Void
  getWindowPosition : extern(al_get_window_position) func (x:Int *, y:Int *) -> Void
  setWindowConstraints : extern(al_set_window_constraints) func (min_w:Int, min_h:Int, max_w:Int, max_h:Int) -> Bool
  getWindowConstraints : extern(al_get_window_constraints) func (min_w:Int *, min_h:Int *, max_w:Int *, max_h:Int *) -> Bool
  setWindowTitle : extern(al_set_window_title) func (s: CString) -> Void
  setNewOption : extern(al_set_new_display_option) static func (option:Int, value:Int, importance:Int) -> Void
  getNewOption : extern(al_get_new_display_option) static func (option:Int, importance:Int *) -> Int
  resetNewOptions : extern(al_reset_new_display_options) static func (Void) -> Void
  setOption : extern(al_set_display_option) func (option:Int, value:Int) -> Void
  getOption : extern(al_get_display_option) func (option:Int) -> Int
  holdBitmapDrawing : extern(al_hold_bitmap_drawing) static func (hold:Bool) -> Void
  isBitmapDrawingHeld : extern(al_is_bitmap_drawing_held) static func (Void) -> Bool
  acknowledgeDrawingHalt : extern(al_acknowledge_drawing_halt) func () -> Void
}


Draw : cover {
  clearToColor : extern(al_clear_to_color) static func ( color:Color) -> Void
  clearDepthBuffer : extern(al_clear_depth_buffer) static func ( x:Float) -> Void
  pixel : extern(al_draw_pixel) static func ( x:Float,  y:Float,  color:Color) -> Void
}



ALLEGRO_RESOURCES_PATH : extern const Int
ALLEGRO_TEMP_PATH: extern const Int
ALLEGRO_USER_DATA_PATH: extern const Int
ALLEGRO_USER_HOME_PATH: extern const Int
ALLEGRO_USER_SETTINGS_PATH: extern const Int
ALLEGRO_USER_DOCUMENTS_PATH: extern const Int
ALLEGRO_EXENAME_PATH: extern const Int
ALLEGRO_LAST_PATH : extern const Int


