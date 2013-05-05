use allegro5, allegro5_acodec
/* Cover: Acodec
 * Cover for Allegro audio codecs addon.
 */
Acodec : cover {
  
 
 
  /* Function: getVersion
   *
   * Gets the version of this addon.
   *
   * Returns:
   *
   * The version of the addon as a UInt32.
   */
  getVersion : extern(al_get_allegro_acodec_version) static func(Void) -> UInt32

  /* Function: initAddon
   * Initializes the Acodec addon.
   */
  initAddon : extern(al_init_acodec_addon) static func(Void) -> Bool

}



