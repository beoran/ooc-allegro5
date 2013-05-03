use allegro5

UStringStruct : cover from ALLEGRO_USTR {
  
}

UStringInfoStruct : cover from ALLEGRO_USTR_INFO {
  
}

UStringInfo : cover from ALLEGRO_USTR_INFO * { 
}


UString : cover from ALLEGRO_USTR * { 
  
new : extern(al_ustr_new) static func ( s:CString) -> UString
newFromBuffer : extern(al_ustr_new_from_buffer) static func ( s:CString,  size:SizeT) -> UString
free : extern(al_ustr_free) func () -> Void
cstr : extern(al_cstr) static func ( us:UString) -> CString
toBuffer : extern(al_ustr_to_buffer) static func ( us:UString,  buffer:CString,  size:Int) -> Void
cstrDup : extern(al_cstr_dup) static func ( us:UString) -> CString
dup : extern(al_ustr_dup) static func ( us:UString) -> UString
dupSubstr : extern(al_ustr_dup_substr) static func ( us:UString,  start_pos:Int,  end_pos:Int) -> UString
emptyString : extern(al_ustr_empty_string) static func (Void) -> UString
refCstr : extern(al_ref_cstr) static func ( info:UStringInfo,  s:CString) -> UString
refBuffer : extern(al_ref_buffer) static func ( info:UStringInfo,  s:CString,  size:SizeT) -> UString
refUstr : extern(al_ref_ustr) static func ( info:UStringInfo,  us:UString,  start_pos:Int,  end_pos:Int) -> UString
size : extern(al_ustr_size) static func ( us:UString) -> SizeT
length : extern(al_ustr_length) static func ( us:UString) -> SizeT
offset : extern(al_ustr_offset) static func ( us:UString,  index:Int) -> Int
next : extern(al_ustr_next) static func ( us:UString,  pos:Int *) -> Bool
prev : extern(al_ustr_prev) static func ( us:UString,  pos:Int *) -> Bool
get : extern(al_ustr_get) static func ( us:UString,  pos:Int) -> Int32
getNext : extern(al_ustr_get_next) static func ( us:UString,  pos:Int *) -> Int32
prevGet : extern(al_ustr_prev_get) static func ( us:UString,  pos:Int *) -> Int32
insertChr : extern(al_ustr_insert_chr) func ( pos:Int,  c:Int32) -> SizeT
append : extern(al_ustr_append) func ( us2:UString) -> Bool
appendCstr : extern(al_ustr_append_cstr) func ( s:CString) -> Bool
appendChr : extern(al_ustr_append_chr) func ( c:Int32) -> SizeT
vappendf : extern(al_ustr_vappendf) func ( fmt:CString,  ap: VaList) -> Bool
removeChr : extern(al_ustr_remove_chr) func ( pos:Int) -> Bool
truncate : extern(al_ustr_truncate) func ( start_pos:Int) -> Bool
ltrimWs : extern(al_ustr_ltrim_ws) func () -> Bool
rtrimWs : extern(al_ustr_rtrim_ws) func () -> Bool
trimWs : extern(al_ustr_trim_ws) func () -> Bool
assign : extern(al_ustr_assign) func ( us2:UString) -> Bool
assignCstr : extern(al_ustr_assign_cstr) func ( s:CString) -> Bool
setChr : extern(al_ustr_set_chr) func ( pos:Int,  c:Int32) -> SizeT
replaceRange : extern(al_ustr_replace_range) func ( start_pos1:Int,  end_pos1:Int,  us2:UString) -> Bool
findChr : extern(al_ustr_find_chr) static func ( us:UString,  start_pos:Int,  c:Int32) -> Int
rfindChr : extern(al_ustr_rfind_chr) static func ( us:UString,  start_pos:Int,  c:Int32) -> Int
findSet : extern(al_ustr_find_set) static func ( us:UString,  start_pos:Int,  accept:UString) -> Int
findSetCstr : extern(al_ustr_find_set_cstr) static func ( us:UString,  start_pos:Int,  accept:CString) -> Int
findCset : extern(al_ustr_find_cset) static func ( us:UString,  start_pos:Int,  reject:UString) -> Int
findCsetCstr : extern(al_ustr_find_cset_cstr) static func ( us:UString,  start_pos:Int,  reject:CString) -> Int
findStr : extern(al_ustr_find_str) static func ( haystack:UString,  start_pos:Int,  needle:UString) -> Int
findCstr : extern(al_ustr_find_cstr) static func ( haystack:UString,  start_pos:Int,  needle:CString) -> Int
rfindStr : extern(al_ustr_rfind_str) static func ( haystack:UString,  start_pos:Int,  needle:UString) -> Int
rfindCstr : extern(al_ustr_rfind_cstr) static func ( haystack:UString,  start_pos:Int,  needle:CString) -> Int
findReplace : extern(al_ustr_find_replace) func ( start_pos:Int,  find:UString,  replace:UString) -> Bool
findReplaceCstr : extern(al_ustr_find_replace_cstr) func ( start_pos:Int,  find:CString,  replace:CString) -> Bool
equal : extern(al_ustr_equal) static func ( us1:UString,  us2:UString) -> Bool
compare : extern(al_ustr_compare) static func ( u:UString,  v:UString) -> Int
hasPrefix : extern(al_ustr_has_prefix) static func ( u:UString,  v:UString) -> Bool
hasPrefixCstr : extern(al_ustr_has_prefix_cstr) static func ( u:UString,  s:CString) -> Bool
hasSuffix : extern(al_ustr_has_suffix) static func ( u:UString,  v:UString) -> Bool
hasSuffixCstr : extern(al_ustr_has_suffix_cstr) static func ( us1:UString,  s:CString) -> Bool
utf8Width : extern(al_utf8_width) static func ( c:Int32) -> SizeT
utf8Encode : extern(al_utf8_encode) static func ( s:Char *,  c:Int32) -> SizeT
newFromUtf16 : extern(al_ustr_new_from_utf16) static func ( s:UInt16*) -> UString
sizeUtf16 : extern(al_ustr_size_utf16) static func ( us:UString) -> SizeT
encodeUtf16 : extern(al_ustr_encode_utf16) static func ( us:UString,  s:UInt16*,  n:SizeT) -> SizeT
utf16Width : extern(al_utf16_width) static func ( c:Int) -> SizeT
utf16Encode : extern(al_utf16_encode) static func ( s:UInt16 *,  c:Int32) -> SizeT

}

