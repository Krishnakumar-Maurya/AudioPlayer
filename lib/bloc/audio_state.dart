import 'package:equatable/equatable.dart';

class AudioState extends Equatable {
  final bool isPlaying;

  const AudioState({required this.isPlaying});

  factory AudioState.initial() {
    return AudioState(isPlaying: false);
  }

  AudioState copyWith({bool? isPlaying}) {
    return AudioState(
      isPlaying: isPlaying ?? this.isPlaying,
    );
  }

 

  @override
  List<Object> get props => [isPlaying];
}
