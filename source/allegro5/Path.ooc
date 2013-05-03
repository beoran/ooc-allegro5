use allegro5

ALLEGRO_NATIVE_PATH_SEP         : extern const Char
ALLEGRO_NATIVE_DRIVE_SEP        : extern const Char


Path : cover from ALLEGRO_PATH * { 
  create : extern(al_create_path) static func ( str:CString) -> Path
  createForDirectory : extern(al_create_path_for_directory) static func ( str:CString) -> Path
  clone : extern(al_clone_path) func () -> Path
  getNumComponents : extern(al_get_path_num_components) func () -> Int
  getComponent : extern(al_get_path_component) func (i:Int) -> CString
  replachComponent : extern(al_replace_path_component) func (i:Int,  s:CString) -> Void
  removeComponent : extern(al_remove_path_component) func ( i:Int) -> Void
  insertComponent : extern(al_insert_path_component) func ( i:Int,  s:CString) -> Void
  getTail : extern(al_get_path_tail) func () -> CString
  dropTail : extern(al_drop_path_tail) func () -> Void
  appendComponent : extern(al_append_path_component) func ( s:CString) -> Void
  join : extern(al_join_paths) func ( tail : Path) -> Bool
  rebase : extern(al_rebase_path) static func (head: Path, tail:Path) -> Bool
  cstr : extern(al_path_cstr) static func (path: Path, delim: Char) -> CString
  destroy : extern(al_destroy_path) func () -> Void
  setDrive : extern(al_set_path_drive) func ( drive:CString) -> Void
  getDrive : extern(al_get_path_drive) func () -> CString
  setFilename : extern(al_set_path_filename) func ( filename:CString) -> Void
  getFilename : extern(al_get_path_filename) func () -> CString
  getExtension : extern(al_get_path_extension) func () -> CString
  setExtension : extern(al_set_path_extension) func (extension : CString) -> Bool
  getBasename : extern(al_get_path_basename) func () -> CString
  makeCanonical : extern(al_make_path_canonical) func () -> Bool
}




