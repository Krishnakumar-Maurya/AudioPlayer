import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'audio_event.dart' as custom;
import 'audio_state.dart';

class AudioBloc extends Bloc<custom.AudioEvent, AudioState> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  AudioBloc() : super(AudioState.initial()) {
    on<custom.PlayAudio>(_onPlayAudio);
    on<custom.PauseAudio>(_onPauseAudio);
    on<custom.StopAudio>(_onStopAudio);
  }

  void _onPlayAudio(custom.PlayAudio event, Emitter<AudioState> emit) async {
    emit(state.copyWith(isPlaying: true));  // Update the state immediately
    await _audioPlayer.setAsset(event.path);
    await _audioPlayer.play();
  }

  void _onPauseAudio(custom.PauseAudio event, Emitter<AudioState> emit) async {
    emit(state.copyWith(isPlaying: false));  // Update the state immediately
    await _audioPlayer.pause();
  }

  void _onStopAudio(custom.StopAudio event, Emitter<AudioState> emit) async {
    emit(state.copyWith(isPlaying: false));  // Update the state immediately
    await _audioPlayer.stop();
  }

  @override
  Future<void> close() {
    _audioPlayer.dispose();
    return super.close();
  }
}
