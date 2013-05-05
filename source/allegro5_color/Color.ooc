use allegro5, allegro5_color

import allegro5/Allegro

extend Color { 

getVersion : extern(al_get_allegro_color_version) static func (Void) -> UInt32
colorHsvToRgb : extern(al_color_hsv_to_rgb) static func ( hue:Float,  saturation:Float,  value:Float,  red:Float *,  green:Float *,  blue:Float *) -> Void
colorRgbToHsl : extern(al_color_rgb_to_hsl) static func ( red:Float,  green:Float,  blue:Float,  hue:Float *,  saturation:Float *,  lightness:Float *) -> Void
colorRgbToHsv : extern(al_color_rgb_to_hsv) static func ( red:Float,  green:Float,  blue:Float,  hue:Float *,  saturation:Float *,  value:Float *) -> Void
colorHslToRgb : extern(al_color_hsl_to_rgb) static func ( hue:Float,  saturation:Float,  lightness:Float,  red:Float *,  green:Float *,  blue:Float *) -> Void
colorNameToRgb : extern(al_color_name_to_rgb) static func ( name:CString,  r:Float *,  g:Float *,  b:Float *) -> Bool
colorRgbToName : extern(al_color_rgb_to_name) static func ( r:Float,  g:Float,  b:Float) -> CString
colorCmykToRgb : extern(al_color_cmyk_to_rgb) static func ( cyan:Float,  magenta:Float,  yellow:Float,  key:Float,  red:Float *,  green:Float *,  blue:Float *) -> Void
colorRgbToCmyk : extern(al_color_rgb_to_cmyk) static func ( red:Float,  green:Float,  blue:Float,  cyan:Float *,  magenta:Float *,  yellow:Float *,  key:Float *) -> Void
colorYuvToRgb : extern(al_color_yuv_to_rgb) static func ( y:Float,  u:Float,  v:Float,  red:Float *,  green:Float *,  blue:Float *) -> Void
colorRgbToYuv : extern(al_color_rgb_to_yuv) static func ( red:Float,  green:Float,  blue:Float,  y:Float *,  u:Float *,  v:Float *) -> Void
colorRgbToHtml : extern(al_color_rgb_to_html) static func ( red:Float,  green:Float,  blue:Float,  string:CString) -> Void
colorHtmlToRgb : extern(al_color_html_to_rgb) static func ( string:CString,  red:Float *,  green:Float *,  blue:Float *) -> Void
colorYuv : extern(al_color_yuv) static func ( y:Float,  u:Float,  v:Float) -> Color
colorCmyk : extern(al_color_cmyk) static func ( c:Float,  m:Float,  y:Float,  k:Float) -> Color
colorHsl : extern(al_color_hsl) static func ( h:Float,  s:Float,  l:Float) -> Color
colorHsv : extern(al_color_hsv) static func ( h:Float,  s:Float,  v:Float) -> Color
colorName : extern(al_color_name) static func ( name:CString) -> Color
colorHtml : extern(al_color_html) static func ( string:CString) -> Color

}