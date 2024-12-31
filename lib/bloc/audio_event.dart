import 'package:equatable/equatable.dart';

abstract class AudioEvent extends Equatable {
  const AudioEvent();

  @override
  List<Object> get props => [];
}

class PlayAudio extends AudioEvent {
  final String path;

  const PlayAudio(this.path);

  @override
  List<Object> get props => [path];
}

class PauseAudio extends AudioEvent {}

class StopAudio extends AudioEvent {}
