use allegro5

ALLEGRO_ALPHA_TEST : extern const Int
ALLEGRO_WRITE_MASK: extern const Int
ALLEGRO_DEPTH_TEST: extern const Int
ALLEGRO_DEPTH_FUNCTION: extern const Int
ALLEGRO_ALPHA_FUNCTION: extern const Int
ALLEGRO_ALPHA_TEST_VALUE

ALLEGRO_RENDER_NEVER: extern const Int
ALLEGRO_RENDER_ALWAYS: extern const Int
ALLEGRO_RENDER_LESS: extern const Int
ALLEGRO_RENDER_EQUAL: extern const Int
ALLEGRO_RENDER_LESS_EQUAL: extern const Int
ALLEGRO_RENDER_GREATER: extern const Int
ALLEGRO_RENDER_NOT_EQUAL: extern const Int
ALLEGRO_RENDER_GREATER_EQUAL

ALLEGRO_MASK_RED : extern const Int
ALLEGRO_MASK_GREEN : extern const Int
ALLEGRO_MASK_BLUE : extern const Int
ALLEGRO_MASK_ALPHA : extern const Int
ALLEGRO_MASK_DEPTH : extern const Int
ALLEGRO_MASK_RGB : extern const Int
ALLEGRO_MASK_RGBA : extern const Int


RenderState : cover { 
  set : extern(al_set_render_state) func(state Int, value Int)
}



