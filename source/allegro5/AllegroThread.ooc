use allegro5

import allegro5/Altime



AllegroThread : cover from ALLEGRO_THREAD * {
  start : extern(al_start_thread) func () -> Void
  join : extern(al_join_thread) func (ret_value : Pointer) -> Void
  setShouldStop : extern(al_set_thread_should_stop) func () -> Void
  getShouldStop : extern(al_get_thread_should_stop) func () -> Bool
  destroy : extern(al_destroy_thread) func () -> Void
}


AllegroMutex: cover from ALLEGRO_MUTEX * { 
  create : extern(al_create_mutex) static func (Void) -> AllegroMutex
  createRecursive : extern(al_create_mutex_recursive) static func (Void) -> AllegroMutex
  lock : extern(al_lock_mutex) func () -> Void
  unlock : extern(al_unlock_mutex) func () -> Void
  destroy : extern(al_destroy_mutex) func () -> Void
}

AllegroCondition : cover from ALLEGRO_COND * {
  create : extern(al_create_cond) static func (Void) -> AllegroCondition
  destroy : extern(al_destroy_cond) func () -> Void
  wait  : extern(al_wait_cond) func(mutex: AllegroMutex) -> Void
  waitUntil : extern(al_wait_cond_until) func (mutex: AllegroMutex,  timeout: Timeout *) -> Int
  broadcast : extern(al_broadcast_cond) func () -> Void
  signal    : extern(al_signal_cond) func () -> Void
}


