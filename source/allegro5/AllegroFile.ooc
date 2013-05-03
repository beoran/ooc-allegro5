use allegro5


/* ALLEGRO_FILE wrappers. Not fully wrapped since 
 * costom file interfaces are not really that useful for now. 
 * I should call this cover File, but it's AllegroFile s File is used too much
 * by ooc its'elf.
 */

ALLEGRO_SEEK_SET : extern const Int
ALLEGRO_SEEK_CUR : extern const Int
ALLEGRO_SEEK_END : extern const Int


Ustr : cover from ALLEGRO_USTR * {

}

Path : cover from ALLEGRO_PATH * {

}

AllegroFileInterface : cover from ALLEGRO_FILE_INTERFACE {

}


AllegroFile : cover from ALLEGRO_FILE * {
  fopen : extern(al_fopen) static func ( path:CString,  mode:CString) -> AllegroFile
  /* TODO:
    fopenInterface : extern(al_fopen_interface) static func ( vt:const ALLEGRO_FILE_INTERFACE*,  path:CString,  mode:CString) -> AllegroFile
    createFileHandle : extern(al_create_file_handle) static func ( vt:const ALLEGRO_FILE_INTERFACE*,  userdata:Pointer) -> AllegroFile 
      /*
  getNewFileInterface : extern(al_get_new_file_interface) static func (Void) -> const ALLEGRO_FILE_INTERFACE *
  setNewFileInterface : extern(al_set_new_file_interface) static func ( file_interface:const ALLEGRO_FILE_INTERFACE*) -> Void
  */

  */
  fclose : extern(al_fclose) func () -> Void
  fread : extern(al_fread) func ( ptr:Pointer,  size:SizeT) -> SizeT
  fwrite : extern(al_fwrite) func ( ptr: Pointer, size:SizeT) -> SizeT
  fflush : extern(al_fflush) func () -> Bool
  ftell : extern(al_ftell) func () -> Int64
  fseek : extern(al_fseek) func ( offset:Int64,  whence:Int) -> Bool
  feof : extern(al_feof) func () -> Bool
  ferror : extern(al_ferror) func () -> Bool
  fclearerr : extern(al_fclearerr) func () -> Void
  fungetc : extern(al_fungetc) func ( c:Int) -> Int
  fsize : extern(al_fsize) func () -> Int64
  fgetc : extern(al_fgetc) func () -> Int
  fputc : extern(al_fputc) func ( c:Int) -> Int
  fread16le : extern(al_fread16le) func () -> Int16
  fread16be : extern(al_fread16be) func () -> Int16
  fwrite16le : extern(al_fwrite16le) func ( w:Int16) -> SizeT
  fwrite16be : extern(al_fwrite16be) func ( w:Int16) -> SizeT
  fread32le : extern(al_fread32le) func () -> Int32
  fread32be : extern(al_fread32be) func () -> Int32
  fwrite32le : extern(al_fwrite32le) func ( l:Int32) -> SizeT
  fwrite32be : extern(al_fwrite32be) func ( l:Int32) -> SizeT
  fgets : extern(al_fgets) func ( p : CString,  max:SizeT) -> CString
  fgetUstr : extern(al_fget_ustr) func () -> Ustr
  fputs : extern(al_fputs) func ( p:CString) -> Int
  fopenFd : extern(al_fopen_fd) static func ( fd:Int,  mode:CString) -> AllegroFile
  makeTempFile : extern(al_make_temp_file) static func ( tmpl:CString,  ret_path: Path *) -> AllegroFile
  setStandardFileInterface : extern(al_set_standard_file_interface) static func (Void) -> Void
  getFileUserdata : extern(al_get_file_userdata) func () -> Pointer

}


