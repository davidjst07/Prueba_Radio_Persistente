# Prueba_Radio_Persistente

Esta aplicación Flutter es un reproductor de radio online que funciona en segundo plano, garantizando la reproducción continua incluso cuando la app está minimizada o la pantalla apagada.

## Características

- Reproducción de streaming de radio en vivo usando `audio_service` y `just_audio`.
- Servicio en primer plano con notificación persistente.
- Control de reproducción: play, pause y stop.
- Manejo de optimización de batería en Android para evitar que el sistema suspenda la reproducción.
- Interfaz simple e intuitiva.
- Compatible con Android 12+ y versiones recientes.

## Uso

1. Al iniciar la aplicación se solicita al usuario que permita desactivar la optimización de batería para mantener la app activa en segundo plano.
2. Puedes reproducir, pausar o detener la radio con los botones en pantalla.
3. La música seguirá sonando incluso si minimizas la aplicación, siempre que hayas dado permiso para ignorar la optimización de batería.

## Dependencias principales

- [audio_service](https://pub.dev/packages/audio_service)
- [just_audio](https://pub.dev/packages/just_audio)
- [just_audio_background](https://pub.dev/packages/just_audio_background)
- [flutter_ignorebatteryoptimization](https://pub.dev/packages/flutter_ignorebatteryoptimization)

## Instalación

Clona el repositorio y ejecuta:

flutter pub get
flutter run


## Configuración adicional

- Asegúrate de otorgar permiso para ignorar la optimización de batería en Android.
- La URL de streaming está configurada en el archivo `RadioPlayerScreen.dart`.

---

Gracias por usar esta app, ¡disfruta escuchando tu radio en segundo plano!

---

Licencia: MIT
