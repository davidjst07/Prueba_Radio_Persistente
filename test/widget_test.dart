import 'package:flutter_test/flutter_test.dart';

import 'package:audio_service/audio_service.dart';
import 'package:prueba_radio_alpha/main.dart';
import 'package:prueba_radio_alpha/service/radio_player_handler.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    final audioHandler = await AudioService.init(
      builder: () => RadioPlayerHandler(),
      config: const AudioServiceConfig(
        androidNotificationChannelId:
            'com.example.prueba_radio_alpha.channel.audio',
        androidNotificationChannelName: 'Audio playback',
        androidNotificationOngoing: true,
      ),
    );

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(audioHandler: audioHandler));

    // Aquí deberás adaptar las expectativas o interacciones según tu UI real
    // Por ejemplo si tienes botones o texto diferente, cámbialo:

    // Ejemplo (si tienes un contador):
    // expect(find.text('0'), findsOneWidget);
    // expect(find.text('1'), findsNothing);
    //
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();
    //
    // expect(find.text('1'), findsOneWidget);
  });
}
