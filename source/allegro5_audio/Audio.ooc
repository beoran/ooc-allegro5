use allegro5, allegro5_audio

import allegro5/Event


ALLEGRO_EVENT_AUDIO_STREAM_FRAGMENT : extern const Int
ALLEGRO_EVENT_AUDIO_STREAM_FINISHED : extern const Int
ALLEGRO_EVENT_AUDIO_RECORDER_FRAGMENT : extern const Int

ALLEGRO_MAX_CHANNELS                    : extern const Int
ALLEGRO_AUDIO_PAN_NONE                  : extern const Int
ALLEGRO_EVENT_AUDIO_ROUTE_CHANGE        : extern const Int
ALLEGRO_EVENT_AUDIO_INTERRUPTION        : extern const Int
ALLEGRO_EVENT_AUDIO_END_INTERRUPTION    : extern const Int


AudioDepth : enum {
   ALLEGRO_AUDIO_DEPTH_INT8     : extern(ALLEGRO_AUDIO_DEPTH_INT8)
   ALLEGRO_AUDIO_DEPTH_INT16    : extern(ALLEGRO_AUDIO_DEPTH_INT16)
   ALLEGRO_AUDIO_DEPTH_INT24    : extern(ALLEGRO_AUDIO_DEPTH_INT24)
   ALLEGRO_AUDIO_DEPTH_FLOAT32  : extern(ALLEGRO_AUDIO_DEPTH_FLOAT32)
   ALLEGRO_AUDIO_DEPTH_UNSIGNED : extern(ALLEGRO_AUDIO_DEPTH_UNSIGNED)
   ALLEGRO_AUDIO_DEPTH_UINT8    : extern(ALLEGRO_AUDIO_DEPTH_UINT8)
   ALLEGRO_AUDIO_DEPTH_UINT16   : extern(ALLEGRO_AUDIO_DEPTH_UINT16)
   ALLEGRO_AUDIO_DEPTH_UINT24   : extern(ALLEGRO_AUDIO_DEPTH_UINT24)
}


ChannelConf : enum {
   ALLEGRO_CHANNEL_CONF_1   : extern(ALLEGRO_CHANNEL_CONF_1)
   ALLEGRO_CHANNEL_CONF_2   : extern(ALLEGRO_CHANNEL_CONF_2)
   ALLEGRO_CHANNEL_CONF_3   : extern(ALLEGRO_CHANNEL_CONF_3)
   ALLEGRO_CHANNEL_CONF_4   : extern(ALLEGRO_CHANNEL_CONF_4)
   ALLEGRO_CHANNEL_CONF_5_1 : extern(ALLEGRO_CHANNEL_CONF_5_1)
   ALLEGRO_CHANNEL_CONF_6_1 : extern(ALLEGRO_CHANNEL_CONF_6_1)
   ALLEGRO_CHANNEL_CONF_7_1 : extern(ALLEGRO_CHANNEL_CONF_7_1)
}

PlayMode : enum {
  ALLEGRO_PLAYMODE_ONCE   : extern(ALLEGRO_PLAYMODE_ONCE)
  ALLEGRO_PLAYMODE_LOOP   : extern(ALLEGRO_PLAYMODE_LOOP)
  ALLEGRO_PLAYMODE_BIDIR  : extern(ALLEGRO_PLAYMODE_BIDIR)
}


MixerQuality : enum {
  ALLEGRO_MIXER_QUALITY_POINT   : extern(ALLEGRO_MIXER_QUALITY_POINT)
  ALLEGRO_MIXER_QUALITY_LINEAR  : extern(ALLEGRO_MIXER_QUALITY_LINEAR)
  ALLEGRO_MIXER_QUALITY_CUBIC   : extern(ALLEGRO_MIXER_QUALITY_CUBIC)
}



Sample : cover from ALLEGRO_SAMPLE *  {
  destroy: extern(al_destroy_sample) func () -> Void
  getFrequency : extern(al_get_sample_frequency) func () -> UInt
  getLength: extern(al_get_sample_length) func () -> UInt
  getDepth : extern(al_get_sample_depth) func () -> AudioDepth
  getChannels : extern(al_get_sample_channels) func () -> ChannelConf
  getData : extern(al_get_sample_data) func () -> Pointer
}

SampleInstance : cover from ALLEGRO_SAMPLE_INSTANCE * {

getFrequency : extern(al_get_sample_instance_frequency) func () -> UInt
getLength : extern(al_get_sample_instance_length) func () -> UInt
getPosition : extern(al_get_sample_instance_position) func () -> UInt
getSpeed : extern(al_get_sample_instance_speed) func () -> Float
getGain : extern(al_get_sample_instance_gain) func () -> Float
getPan : extern(al_get_sample_instance_pan) func () -> Float
getTime : extern(al_get_sample_instance_time) func () -> Float
getDepth : extern(al_get_sample_instance_depth) func () -> AudioDepth
getChannels : extern(al_get_sample_instance_channels) func () -> ChannelConf
getPlaymode : extern(al_get_sample_instance_playmode) func () -> PlayMode
getPlaying : extern(al_get_sample_instance_playing) func () -> Bool
getAttached : extern(al_get_sample_instance_attached) func () -> Bool
setPosition : extern(al_set_sample_instance_position) func ( val:UInt) -> Bool
setLength : extern(al_set_sample_instance_length) func ( val:UInt) -> Bool
setSpeed : extern(al_set_sample_instance_speed) func ( val:Float) -> Bool
setGain : extern(al_set_sample_instance_gain) func ( val:Float) -> Bool
setPan : extern(al_set_sample_instance_pan) func ( val:Float) -> Bool
setPlaymode : extern(al_set_sample_instance_playmode) func ( val:PlayMode) -> Bool
setPlaying : extern(al_set_sample_instance_playing) func ( val:Bool) -> Bool
detach : extern(al_detach_sample_instance) func () -> Bool
setSample : extern(al_set_sample) func ( data:Sample) -> Bool
getSample : extern(al_get_sample) func () -> Sample
play : extern(al_play_sample_instance) func () -> Bool
stop : extern(al_stop_sample_instance) func () -> Bool
} 

AudioStream : cover from ALLEGRO_AUDIO_STREAM * { 
  
destroy : extern(al_destroy_audio_stream) func () -> Void
drain : extern(al_drain_audio_stream) func () -> Void
getFrequency : extern(al_get_audio_stream_frequency) func () -> UInt
getLength : extern(al_get_audio_stream_length) func () -> UInt
getFragments : extern(al_get_audio_stream_fragments) func () -> UInt
getAvailableFragments : extern(al_get_available_audio_stream_fragments) func () -> UInt
getSpeed : extern(al_get_audio_stream_speed) func () -> Float
getGain : extern(al_get_audio_stream_gain) func () -> Float
getPan : extern(al_get_audio_stream_pan) func () -> Float
getChannels : extern(al_get_audio_stream_channels) func () -> ChannelConf
getDepth : extern(al_get_audio_stream_depth) func () -> AudioDepth
getPlaymode : extern(al_get_audio_stream_playmode) func () -> PlayMode
getPlaying : extern(al_get_audio_stream_playing) func () -> Bool
getAttached : extern(al_get_audio_stream_attached) func () -> Bool
getFragment : extern(al_get_audio_stream_fragment) func () -> Pointer
setSpeed : extern(al_set_audio_stream_speed) func ( val:Float) -> Bool
setGain : extern(al_set_audio_stream_gain) func ( val:Float) -> Bool
setPan : extern(al_set_audio_stream_pan) func ( val:Float) -> Bool
setPlaymode : extern(al_set_audio_stream_playmode) func ( val:PlayMode) -> Bool
setPlaying : extern(al_set_audio_stream_playing) func ( val:Bool) -> Bool
detach : extern(al_detach_audio_stream) func () -> Bool
setFragment : extern(al_set_audio_stream_fragment) func ( val:Pointer) -> Bool
rewind : extern(al_rewind_audio_stream) func () -> Bool
seekSecs : extern(al_seek_audio_stream_secs) func ( time:Double) -> Bool
getPositionSecs : extern(al_get_audio_stream_position_secs) func () -> Double
getLengthSecs : extern(al_get_audio_stream_length_secs) func () -> Double
setLoopSecs : extern(al_set_audio_stream_loop_secs) func ( start:Double,  end:Double) -> Bool
getEventSource : extern(al_get_audio_stream_event_source) func () -> EventSource
} 

Mixer : cover from ALLEGRO_MIXER * { 
destroy : extern(al_destroy_mixer) func () -> Void
getFrequency : extern(al_get_mixer_frequency) func () -> UInt
getChannels : extern(al_get_mixer_channels) func () -> ChannelConf
getDepth : extern(al_get_mixer_depth) func () -> AudioDepth
getQuality : extern(al_get_mixer_quality) func () -> MixerQuality
getGain : extern(al_get_mixer_gain) func () -> Float
getPlaying : extern(al_get_mixer_playing) func () -> Bool
getAttached : extern(al_get_mixer_attached) func () -> Bool
setFrequency : extern(al_set_mixer_frequency) func ( val:UInt) -> Bool
setQuality : extern(al_set_mixer_quality) func ( val:MixerQuality) -> Bool
setGain : extern(al_set_mixer_gain) func ( gain:Float) -> Bool
setPlaying : extern(al_set_mixer_playing) func ( val:Bool) -> Bool
detach : extern(al_detach_mixer) func () -> Bool
} 

Voice : cover from ALLEGRO_VOICE * { 
destroyVoice : extern(al_destroy_voice) func () -> Void
detachVoice : extern(al_detach_voice) func () -> Void
getVoiceFrequency : extern(al_get_voice_frequency) func () -> UInt
getVoicePosition : extern(al_get_voice_position) func () -> UInt
getVoiceChannels : extern(al_get_voice_channels) func () -> ChannelConf
getVoiceDepth : extern(al_get_voice_depth) func () -> AudioDepth
getVoicePlaying : extern(al_get_voice_playing) func () -> Bool
setVoicePosition : extern(al_set_voice_position) func ( val:UInt) -> Bool
setVoicePlaying : extern(al_set_voice_playing) func ( val:Bool) -> Bool
} 

Audio : cover { 
install : extern(al_install_audio) static func (Void) -> Bool
uninstall : extern(al_uninstall_audio) static func (Void) -> Void
isInstalled : extern(al_is_audio_installed) static func (Void) -> Bool
getVersion : extern(al_get_allegro_audio_version) static func (Void) -> UInt32
getChannelCount : extern(al_get_channel_count) static func ( conf:ChannelConf) -> SizeT
getAudioDepthSize : extern(al_get_audio_depth_size) static func ( conf:AudioDepth) -> SizeT
reserveSamples : extern(al_reserve_samples) static func ( reserve_samples:Int) -> Bool
getDefaultMixer : extern(al_get_default_mixer) static func (Void) -> Mixer
setDefaultMixer : extern(al_set_default_mixer) static func (mix: Mixer) -> Bool
restoreDefaultMixer : extern(al_restore_default_mixer) static func (Void) -> Bool
stopSample : extern(al_stop_sample) func () -> Void
stopSamples : extern(al_stop_samples) static func (Void) -> Void
loadSample : extern(al_load_sample) static func ( filename:CString) -> Sample
loadSampleF : extern(al_load_sample_f) func ( ident:CString) -> Sample
getEventSource : extern(al_get_audio_event_source) static func (Void) -> EventSource
}


AudioRecorderEvent : cover from ALLEGRO_AUDIO_RECORDER_EVENT { 
  type         : extern UInt
  source       : extern Pointer
  timestamp    : extern Double
  buffer       : extern Pointer;
  samples      : extern UInt;
}


AudioRecorder : cover from ALLEGRO_AUDIO_RECORDER * {
start : extern(al_start_audio_recorder) func () -> Bool
stop : extern(al_stop_audio_recorder) func () -> Void
isRecording : extern(al_is_audio_recorder_recording) func () -> Bool
getEvent : extern(al_get_audio_recorder_event) static func ( event:Event) -> AudioRecorderEvent *
destroy : extern(al_destroy_audio_recorder) func () -> Void
}

