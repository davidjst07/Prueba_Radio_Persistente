import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

class RadioPlayerHandler extends BaseAudioHandler {
  final _player = AudioPlayer();

  RadioPlayerHandler() {
    _player.playbackEventStream.listen((event) {
      final playing = _player.playing;
      playbackState.add(
        playbackState.value.copyWith(
          controls: [
            MediaControl.stop,
            if (playing) MediaControl.pause else MediaControl.play,
          ],
          systemActions: const {
            MediaAction.seek,
            MediaAction.pause,
            MediaAction.play,
            MediaAction.stop,
          },
          playing: playing,
          processingState: {
            ProcessingState.idle: AudioProcessingState.idle,
            ProcessingState.loading: AudioProcessingState.loading,
            ProcessingState.buffering: AudioProcessingState.buffering,
            ProcessingState.ready: AudioProcessingState.ready,
            ProcessingState.completed: AudioProcessingState.completed,
          }[_player.processingState]!,
        ),
      );
    });
  }

  Future<void> setUrl(String url) async {
    final mediaItem = MediaItem(
      id: url,
      album: 'Tu emisora',
      title: 'Emisora Online',
      artist: 'AzuraCast',
      artUri: Uri.parse(
        'https://elcontraste.co/wp-content/uploads/2024/04/Logo-el-contraste-RadioRecurso-1.png',
      ), // Cambia aquí
    );

    this.mediaItem.add(mediaItem);

    await _player.setAudioSource(
      AudioSource.uri(Uri.parse(url), tag: mediaItem),
    );
  }

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> stop() async {
    await _player.stop();
    return super.stop();
  }
}
