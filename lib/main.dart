import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/audio_bloc.dart';
import 'widgets/PlayPauseButton.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => AudioBloc(),
        child: AudioPlayerScreen(),
      ),
    );
  }
}

class AudioPlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Audio Player with BLoC'),
      ),
      body: Center(
        child: PlayPauseButton(audioPath: 'assets/audio/sample.mp3'),
      ),
    );
  }
}
