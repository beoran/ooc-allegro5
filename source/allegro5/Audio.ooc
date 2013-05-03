use allegro5

import allegro5/Event

AudioDepth : enum {
  
}

ChannelConf : cover from Int {
  
}

PlayMode : cover from Int { 
  
}

MixerQuality : cover from Int { 
  
}



Sample : cover from ALLEGRO_SAMPLE *  {
destroySample : extern(al_destroy_sample) func () -> Void
getSampleFrequency : extern(al_get_sample_frequency) func () -> UInt
getSampleLengthg : extern(al_get_sample_length) func () -> UInt
getSampleDepth : extern(al_get_sample_depth) func () -> AudioDepth
getSampleChannels : extern(al_get_sample_channels) func () -> ChannelConf
getSampleData : extern(al_get_sample_data) func () -> Pointer
}

SampleInstance : cover from ALLEGRO_SAMPLE_INSTANCE * {

getSampleInstanceFrequency : extern(al_get_sample_instance_frequency) func () -> UInt
getSampleInstanceLength : extern(al_get_sample_instance_length) func () -> UInt
getSampleInstancePosition : extern(al_get_sample_instance_position) func () -> UInt
getSampleInstanceSpeed : extern(al_get_sample_instance_speed) func () -> Float
getSampleInstanceGain : extern(al_get_sample_instance_gain) func () -> Float
getSampleInstancePan : extern(al_get_sample_instance_pan) func () -> Float
getSampleInstanceTime : extern(al_get_sample_instance_time) func () -> Float
getSampleInstanceDepth : extern(al_get_sample_instance_depth) func () -> AudioDepth
getSampleInstanceChannels : extern(al_get_sample_instance_channels) func () -> ChannelConf
getSampleInstancePlaymode : extern(al_get_sample_instance_playmode) func () -> PlayMode
getSampleInstancePlaying : extern(al_get_sample_instance_playing) func () -> Bool
getSampleInstanceAttached : extern(al_get_sample_instance_attached) func () -> Bool
setSampleInstancePosition : extern(al_set_sample_instance_position) func ( val:UInt) -> Bool
setSampleInstanceLength : extern(al_set_sample_instance_length) func ( val:UInt) -> Bool
setSampleInstanceSpeed : extern(al_set_sample_instance_speed) func ( val:Float) -> Bool
setSampleInstanceGain : extern(al_set_sample_instance_gain) func ( val:Float) -> Bool
setSampleInstancePan : extern(al_set_sample_instance_pan) func ( val:Float) -> Bool
setSampleInstancePlaymode : extern(al_set_sample_instance_playmode) func ( val:PlayMode) -> Bool
setSampleInstancePlaying : extern(al_set_sample_instance_playing) func ( val:Bool) -> Bool
detachSampleInstance : extern(al_detach_sample_instance) func () -> Bool
setSample : extern(al_set_sample) func ( data:Sample) -> Bool
getSample : extern(al_get_sample) func () -> Sample
playSampleInstance : extern(al_play_sample_instance) func () -> Bool
stopSampleInstance : extern(al_stop_sample_instance) func () -> Bool
} 

AudioStream : cover from ALLEGRO_AUDIO_STREAM * { 
  
destroyAudioStream : extern(al_destroy_audio_stream) func () -> Void
drainAudioStream : extern(al_drain_audio_stream) func () -> Void
getAudioStreamFrequency : extern(al_get_audio_stream_frequency) func () -> UInt
getAudioStreamLength : extern(al_get_audio_stream_length) func () -> UInt
getAudioStreamFragments : extern(al_get_audio_stream_fragments) func () -> UInt
getAvailableAudioStreamFragments : extern(al_get_available_audio_stream_fragments) func () -> UInt
getAudioStreamSpeed : extern(al_get_audio_stream_speed) func () -> Float
getAudioStreamGain : extern(al_get_audio_stream_gain) func () -> Float
getAudioStreamPan : extern(al_get_audio_stream_pan) func () -> Float
getAudioStreamChannels : extern(al_get_audio_stream_channels) func () -> ChannelConf
getAudioStreamDepth : extern(al_get_audio_stream_depth) func () -> AudioDepth
getAudioStreamPlaymode : extern(al_get_audio_stream_playmode) func () -> PlayMode
getAudioStreamPlaying : extern(al_get_audio_stream_playing) func () -> Bool
getAudioStreamAttached : extern(al_get_audio_stream_attached) func () -> Bool
getAudioStreamFragment : extern(al_get_audio_stream_fragment) func () -> Pointer
setAudioStreamSpeed : extern(al_set_audio_stream_speed) func ( val:Float) -> Bool
setAudioStreamGain : extern(al_set_audio_stream_gain) func ( val:Float) -> Bool
setAudioStreamPan : extern(al_set_audio_stream_pan) func ( val:Float) -> Bool
setAudioStreamPlaymode : extern(al_set_audio_stream_playmode) func ( val:PlayMode) -> Bool
setAudioStreamPlaying : extern(al_set_audio_stream_playing) func ( val:Bool) -> Bool
detachAudioStream : extern(al_detach_audio_stream) func () -> Bool
setAudioStreamFragment : extern(al_set_audio_stream_fragment) func ( val:Pointer) -> Bool
rewindAudioStream : extern(al_rewind_audio_stream) func () -> Bool
seekAudioStreamSecs : extern(al_seek_audio_stream_secs) func ( time:Double) -> Bool
getAudioStreamPositionSecs : extern(al_get_audio_stream_position_secs) func () -> Double
getAudioStreamLengthSecs : extern(al_get_audio_stream_length_secs) func () -> Double
setAudioStreamLoopSecs : extern(al_set_audio_stream_loop_secs) func ( start:Double,  end:Double) -> Bool
getAudioStreamEventSource : extern(al_get_audio_stream_event_source) func () -> EventSource
} 

Mixer : cover from ALLEGRO_MIXER * { 
destroyMixer : extern(al_destroy_mixer) func () -> Void
getMixerFrequency : extern(al_get_mixer_frequency) func () -> UInt
getMixerChannels : extern(al_get_mixer_channels) func () -> ChannelConf
getMixerDepth : extern(al_get_mixer_depth) func () -> AudioDepth
getMixerQuality : extern(al_get_mixer_quality) func () -> MixerQuality
getMixerGain : extern(al_get_mixer_gain) func () -> Float
getMixerPlaying : extern(al_get_mixer_playing) func () -> Bool
getMixerAttached : extern(al_get_mixer_attached) func () -> Bool
setMixerFrequency : extern(al_set_mixer_frequency) func ( val:UInt) -> Bool
setMixerQuality : extern(al_set_mixer_quality) func ( val:MixerQuality) -> Bool
setMixerGain : extern(al_set_mixer_gain) func ( gain:Float) -> Bool
setMixerPlaying : extern(al_set_mixer_playing) func ( val:Bool) -> Bool
detachMixer : extern(al_detach_mixer) func () -> Bool
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
installAudio : extern(al_install_audio) static func (Void) -> Bool
uninstallAudio : extern(al_uninstall_audio) static func (Void) -> Void
isAudioInstalled : extern(al_is_audio_installed) static func (Void) -> Bool
getAllegroAudioVersion : extern(al_get_allegro_audio_version) static func (Void) -> UInt32
getChannelCount : extern(al_get_channel_count) static func ( conf:ChannelConf) -> SizeT
getAudioDepthSize : extern(al_get_audio_depth_size) static func ( conf:AudioDepth) -> SizeT
reserveSamples : extern(al_reserve_samples) static func ( reserve_samples:Int) -> Bool
getDefaultMixer : extern(al_get_default_mixer) static func (Void) -> Mixer
setDefaultMixer : extern(al_set_default_mixer) func () -> Bool
restoreDefaultMixer : extern(al_restore_default_mixer) static func (Void) -> Bool
stopSample : extern(al_stop_sample) func () -> Void
stopSamples : extern(al_stop_samples) static func (Void) -> Void
loadSample : extern(al_load_sample) static func ( filename:CString) -> Sample
loadSampleF : extern(al_load_sample_f) func ( ident:CString) -> Sample
getAudioEventSource : extern(al_get_audio_event_source) static func (Void) -> EventSource
}

AudioRecorderEvent : cover from ALLEGRO_AUDIO_RECORDER_EVENT * {
  
}

AudioRecorder : cover from ALLEGRO_AUDIO_RECORDER * {
startAudioRecorder : extern(al_start_audio_recorder) func () -> Bool
stopAudioRecorder : extern(al_stop_audio_recorder) func () -> Void
isAudioRecorderRecording : extern(al_is_audio_recorder_recording) func () -> Bool
getAudioRecorderEvent : extern(al_get_audio_recorder_event) static func ( event:Event) -> AudioRecorderEvent *
destroyAudioRecorder : extern(al_destroy_audio_recorder) func () -> Void
}

