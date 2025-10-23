import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_service/audio_service.dart';

class RadioPlayerScreen extends StatefulWidget {
  final AudioHandler audioHandler;

  const RadioPlayerScreen({Key? key, required this.audioHandler})
    : super(key: key);

  @override
  State<RadioPlayerScreen> createState() => _RadioPlayerScreenState();
}

class _RadioPlayerScreenState extends State<RadioPlayerScreen> {
  late AudioPlayer _player;
  bool _isPlaying = false;

  // URL de tu emisora online (streaming)
  final String radioUrl =
      'https://a7.asurahosting.com:7170/radio.mp3'; // Cambia aquí

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _init();
  }

  Future<void> _init() async {
    try {
      await _player.setAudioSource(
        AudioSource.uri(
          Uri.parse(radioUrl),
          tag: MediaItem(
            id: radioUrl,
            album: "Tu emisora",
            title: "Emisora Online - En Vivo",
            artist: "AzuraCast",
            artUri: Uri.parse(
              "https://elcontraste.co/wp-content/uploads/2024/04/Logo-el-contraste-RadioRecurso-1.png",
            ), // opcional
          ),
        ),
      );
    } catch (e) {
      debugPrint('Error cargando la emisora: $e');
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  void _playPause() {
    if (_player.playing) {
      _player.pause();
    } else {
      _player.play();
    }
    setState(() {
      _isPlaying = _player.playing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Radio Online')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              iconSize: 80,
              icon: Icon(_isPlaying ? Icons.pause_circle : Icons.play_circle),
              onPressed: _playPause,
            ),
            const SizedBox(height: 20),
            Text(
              _isPlaying ? 'Reproduciendo' : 'Pausado',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
