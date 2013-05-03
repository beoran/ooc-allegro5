use allegro5

import allegro5/Event

/* Timer wrappers */

Timer : cover from ALLEGRO_TIMER * { 
  create: extern(al_create_timer) static func ( speed_secs:Double) -> Timer
  destroy: extern(al_destroy_timer) func () -> Void
  start: extern(al_start_timer) func () -> Void
  stop: extern(al_stop_timer) func () -> Void
  isStarted : extern(al_get_timer_started) func () -> Bool
  getSpeed : extern(al_get_timer_speed) func () -> Double
  setSpeed : extern(al_set_timer_speed) func ( speed_secs:Double) -> Void
  getCount : extern(al_get_timer_count) func () -> Int64
  setCount : extern(al_set_timer_count) func ( count:Int64) -> Void
  addCount : extern(al_add_timer_count) func ( diff:Int64) -> Void
  getEventSource : extern(al_get_timer_event_source) func () -> EventSource
}

