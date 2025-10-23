import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:prueba_radio_alpha/service/audio_handler_provider.dart';
import 'package:prueba_radio_alpha/widgets/RadioPlayerScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await JustAudioBackground.init(
    androidNotificationChannelId:
        'com.example.prueba_radio_alpha.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );

  AudioHandler? audioHandler;
  try {
    audioHandler = await initAudioHandler();
  } catch (e) {
    debugPrint('AudioService initialization error caught: $e');
    // No intentar AudioService.instance, crear dummy para continuar
    audioHandler = DummyAudioHandler();
  }

  runApp(MyApp(audioHandler: audioHandler));
}

// Dummy AudioHandler básico para fallback sin funcionalidad
class DummyAudioHandler extends BaseAudioHandler {
  @override
  Future<void> play() async {
    /* noop */
  }
  @override
  Future<void> pause() async {
    /* noop */
  }
  @override
  Future<void> stop() async {
    /* noop */
  }
}

// Asegúrate que esta clase esté en el mismo archivo o la importes
class MyApp extends StatelessWidget {
  final AudioHandler audioHandler;
  const MyApp({super.key, required this.audioHandler});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: RadioPlayerScreen(audioHandler: audioHandler));
  }
}
