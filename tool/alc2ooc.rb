#!/usr/bin/env ruby

AL_FUNC_RE = %r{[A-Z_]+_FUNC\(([^,]+),\W*([^,]+),\W*\(([^\)]+)\)\W*\)\W*;}

def camelize(snake)
  parts = snake.strip.split('_')
  first = parts.shift
  res   = first
  if parts && !parts.empty? 
    res << parts.map { |s| s.capitalize}.join('')
  end
  return res
end

def deprefix(name, prefix)
  name.gsub(%r{\A#{prefix}}, '')
end

PARAM_RE = %r{(void|[A-Za-z0-9_]+(?:(?:\W*\*))*)\W*([A-Za-z0-9_]+)}

def parse_param(param)
  return PARAM_RE.match(param)
end

def split_params(params)
  params.split(',').map do |s|
    aid = s.strip.gsub(/\+/, ' ').gsub(/[ \t]*\*[ \t]*/, '*').gsub(/(\*+)/) {|m| m + ' '}
    # get rid of pesky consts
    aid = aid.gsub('const ', '').strip
    if aid == 'void'
      ['void', '']
    else
      i = aid.rindex(' ')
      if i
        [aid[0, i] , aid[i, s.size]]
      else
        [aid, '']
      end
    end
  end
end




TYPEMAP = {
  "int"                 => "Int",
  "uint32_t"            => "UInt32",
  "ALLEGRO_COLOR"       => "Color",
  "ALLEGRO_BITMAP"      => "Bitmap",
  "ALLEGRO_BITMAP *"    => "Bitmap",
  "ALLEGRO_BITMAP*"     => "Bitmap",
  "void"                => "Void",
  "void *"              => "Pointer",
  "void*"               => "Pointer",
  "int*"                => "Int *",
  "bool"                => "Bool",
  "float"               => "Float",
  "double"              => "Double",
  "float*"              => "Float *",
  "double*"             => "Double *",
  "ALLEGRO_LOCKED_REGION *" => "LockedRegion",
  "ALLEGRO_FILE*"           => "AllegroFile",
  "ALLEGRO_FONT*"           => "Font",
  "char*"                   => "CString",
  "char *"                  => "CString",
  "ALLEGRO_DISPLAY *"       => "Display",
  "const char *"            => "CString",
  "const char*"             => "CString",
  "ALLEGRO_DISPLAY_MODE*"   => "DisplayMode",
  "ALLEGRO_JOYSTICK*"       => "Joystick",
  "ALLEGRO_JOYSTICK_STATE"  => "JoystickState",
  "ALLEGRO_MOUSE_STATE"     => "MouseState",
  "ALLEGRO_MOUSE_STATE*"    => "MouseState *",
  "ALLEGRO_MOUSE_CURSOR*"   => "MouseCursor",
  "unsigned int"            => "UInt",
  "ALLEGRO_PATH*"           => "Path",
  "ALLEGRO_TIMER*"          => "Timer",
  "ALLEGRO_TRANSFORM *"     => "Transform",
  "ALLEGRO_TRANSFORM*"      => "Transform",
  "const ALLEGRO_USTR *"    => "UString",
  "const ALLEGRO_USTR*"     => "UString", 
  "const ALLEGRO_USTR_INFO *"    => "UStringInfo",
  "const ALLEGRO_USTR_INFO*"     => "UStringInfo", 
  "ALLEGRO_USTR *"    => "UString",
  "ALLEGRO_USTR*"     => "UString", 
  "ALLEGRO_USTR_INFO *"    => "UStringInfo",
  "ALLEGRO_USTR_INFO*"     => "UStringInfo", 
  "ALLEGRO_MIXER*"         => "Mixer",
  "ALLEGRO_SAMPLE*"        => "Sample",
  "ALLEGRO_SAMPLE_ID"      => "SampleId",
  "ALLEGRO_SAMPLE_ID*"     => "SampleId*",
  "ALLEGRO_SAMPLE_INSTANCE*" => "SampleInstance",
  "ALLEGRO_AUDIO_STREAM*"    => "AudioStream",
  "ALLEGRO_VOICE*"           => "Voice",
  "ALLEGRO_AUDIO_RECORDER*"  => "AudioRecorder",
  "ALLEGRO_AUDIO_DEPTH"      => "AudioDepth",
  "ALLEGRO_CHANNEL_CONF"     => "ChannelConf",
  "ALLEGRO_PLAYMODE"         => "PlayMode",
  "ALLEGRO_EVENT*"           => "Event",
  "ALLEGRO_EVENT_SOURCE*"    => "EventSource",
  "ALLEGRO_AUDIO_EVENT*"     => "AudioEvent",
  "unsignedint"              => "UInt"


}


def type_2_ooc(type) 
  aid    = type.gsub(' ', '')
  mapped = TYPEMAP[aid] || type
  return mapped
end
  

input      = $stdin
output     = $stdout

cover_types = [ "ALLEGRO_BITMAP*", "ALLEGRO_MIXER*", "ALLEGRO_COLOR", 
                "ALLEGRO_SAMPLE*", "ALLEGRO_LOCKED_REGION *",
                "ALLEGRO_FILE*"  , "ALLEGRO_FONT*",
                "ALLEGRO_DISPLAY*", "ALLEGRO_DISPLAY_MODE*",
                "ALLEGRO_JOYSTICK*",  "ALLEGRO_JOYSTICK_STATE",
                "ALLEGRO_MOUSE_STATE", "ALLEGRO_MOUSE_STATE*",
                "ALLEGRO_MOUSE_CURSOR*", "ALLEGRO_PATH*", "ALLEGRO_TIMER*", 
                "ALLEGRO_TRANSFORM *", "ALLEGRO_TRANSFORM*",
                "ALLEGRO_USTR*", "ALLEGRO_USTR_INFO*",
  "ALLEGRO_MIXER*",
  "ALLEGRO_SAMPLE*",
  "ALLEGRO_SAMPLE_ID",
  "ALLEGRO_SAMPLE_ID*",
  "ALLEGRO_SAMPLE_INSTANCE*",
  "ALLEGRO_AUDIO_STREAM*",
  "ALLEGRO_VOICE*",
  "ALLEGRO_AUDIO_RECORDER*"
              ]

input.each_line do  |line|
  aid = line.chomp.strip
  al_func = AL_FUNC_RE.match(line)
  if al_func
    oldname     = al_func[2]
    newname     = camelize(deprefix(oldname, 'al_'))
    rettype     = al_func[1]
    newret      = type_2_ooc(rettype)
    params      = split_params(al_func[3])
    newparstr   = ''
    static     = true
    if cover_types
      if cover_types.member?(params.first[0])
        static = false
        params.shift
      end
    end
    params.each do | param | 
      newparstr << ', ' unless newparstr.empty?
      if param[0] != 'void'
        newparstr << param[1]
        newparstr << ':'
      end
      newparstr << type_2_ooc(param[0])
    end
    # output.printf("// %s\n", line)
    # output.printf("// Cover type: %s vs %s\n", cover_type, params.first[0])
    if static
      output.printf("%s : extern(%s) static func (%s) -> %s\n", newname, oldname, newparstr, newret)
    else
      output.printf("%s : extern(%s) func (%s) -> %s\n", newname, oldname, newparstr, newret)
    end
  end
end






