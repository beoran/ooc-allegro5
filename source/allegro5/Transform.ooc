

TransformStruct : cover from ALLEGRO_TRANSFORM {
  
}


Transform  : cover from ALLEGRO_TRANSFORM * { 
  useTransform: extern(al_use_transform) static func () -> Void

  // copies from src to this
  copy: extern(al_copy_transform) func ( src:Transform*) -> Void

  identity : extern(al_identity_transform) func () -> Void
  build : extern(al_build_transform) func ( x:Float,  y:Float,  sx:Float,  sy:Float, theta:Float) -> Void
  translate: extern(al_translate_transform) func ( x:Float,  y:Float) -> Void
  translate3d : extern(al_translate_transform_3d) func ( x:Float,  y:Float,  z:Float) -> Void
rotate : extern(al_rotate_transform) func ( theta:Float) -> Void
rotate3d : extern(al_rotate_transform_3d) func ( x:Float,  y:Float,  z:Float,  angle:Float) -> Void
scale : extern(al_scale_transform) func ( sx:Float,  sy:Float) -> Void
scale3d : extern(al_scale_transform_3d) func ( sx:Float,  sy:Float,  sz:Float) -> Void
transformCoordinates : extern(al_transform_coordinates) func (x:Float *,  y:Float *) -> Void
compose: extern(al_compose_transform) func (other:Transform*) -> Void
getCurrent : extern(al_get_current_transform) static func (Void) -> Transform*
getCurrentInverse : extern(al_get_current_inverse_transform) static func (Void) -> Transform*
invert: extern(al_invert_transform) func () -> Void
checkInverse : extern(al_check_inverse) func (tol:Float) -> Int
orthographic: extern(al_orthographic_transform) func ( left:Float,  top:Float,  n:Float,  right:Float,  bottom:Float,  f:Float) -> Void
perspective: extern(al_perspective_transform) func ( left:Float,  top:Float,  n:Float,  right:Float,  bottom:Float,  f:Float) -> Void
getProjection: extern(al_get_projection_transform) static func ( display: Display) -> Transform
setProjection: extern(al_set_projection_transform) static func ( display:Display, t:Transform) -> Void

}