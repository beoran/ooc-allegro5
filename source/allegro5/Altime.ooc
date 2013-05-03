use allegro5

Timeout : cover from ALLEGRO_TIMEOUT * {
  init : extern(al_init_timeout) func (seconds: Double)
}

