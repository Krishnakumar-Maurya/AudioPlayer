import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/audio_bloc.dart';
import '../bloc/audio_event.dart' as custom;
import '../bloc/audio_state.dart';

class PlayPauseButton extends StatelessWidget {
  final String audioPath;

  const PlayPauseButton({required this.audioPath});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioBloc, AudioState>(
      builder: (context, state) {
        return TextButton(
          onPressed: () {
            if (state.isPlaying) {
              context.read<AudioBloc>().add(custom.PauseAudio());
            } else {
              context.read<AudioBloc>().add(custom.PlayAudio(audioPath));
            }
          },
          child: Text(state.isPlaying ? 'Pause' : 'Play'),
        );
      },
    );
  }
}
