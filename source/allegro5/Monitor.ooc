use allegro5

/* Monitor info wrappers. */

ALLEGRO_DEFAULT_DISPLAY_ADAPTER : extern const Int


MonitorInfo : cover from ALLEGRO_MONITOR_INFO * {
  x1 : extern Int;
  x2 : extern Int;
  y1 : extern Int;
  y2 : extern Int;

  getNumVideoAdapters : extern(al_get_num_video_adapters) static func (Void)     -> Int
  get: extern(al_get_monitor_info) static func(adapter:Int, info: MonitorInfo *) -> Bool

} 


