# Formação Flutter

> DIO

## Introdução

[PDF - Primeiros passos](/files/Primeiros%20Passos%20com%20Flutter.pdf)

## Links

- [Flutter official page](https://flutter.dev/)

- [Dart official page](https://dart.dev/)

- [Android Studio](https://developer.android.com/studio?hl=pt-br)

- [Github da formação da DIO](https://github.com/digitalinnovationone/dio-flutter)

## VS Code

- extension: dart-code.dart-code

- extension: dart-code.flutter

## Linguagem Dart

- [PDF: Linguagem de programação Dart](files/Linguagem%20de%20Programação%20Dart.pdf)

- criar app dart: dart create -t console meu_app

- rodar: dart run

- [Dart lint](https://pub.dev/packages/lint)

- [Flutter lints](https://pub.dev/packages/flutter_lints)

- [Test Matchers](/dart/tests_app/matchers.md)

- [Dart Http](https://pub.dev/packages/http)

- [Dart Mockito](https://pub.dev/packages/mockito)

- [Dart Build Runner](https://pub.dev/packages/build_runner)

- gerar mock: dart run build_runner build --delete-conflicting-outputs

## Flutter

- criar um app flutter: flutter create -t app -a kotlin -i swift --org br.com.hioktec.trilhaapp trilha_inicial_app

- rodar app flutter: flutter run

### Pages, Widgets, Navegação e Funções

- [Flutter Google Fonts](https://pub.dev/packages/google_fonts)

- [PDF: Flutter - Pages, Widgets, Navegação e Funções](files/Pages,%20Widgets,%20Navegação%20e%20Funções.pdf)

### Persistência local de dados

- [PDF: Flutter - Persistência local de dados](files/Persistência%20local%20de%20dados.pdf)

- [shared_preferences](https://pub.dev/packages/shared_preferences)

- instalar um dependência : flutter pub add shared_preferences

- [hive](https://pub.dev/packages/hive)

- [path_provider](https://pub.dev/packages/path_provider)

- [hive_generator)](https://pub.dev/packages/hive_generator)

- [build_runner](https://pub.dev/packages/build_runner)

- [sqflite](https://pub.dev/packages/sqflite)

### Assincronismo e APIs REST

- [PDF](files/Assincronismo%20e%20APIs%20REST.pdf)

- [http](https://pub.dev/packages/http)

- [ViaCEP](https://viacep.com.br/)

- [json_to_dart](https://javiercbk.github.io/json_to_dart/)

- [JSONPlaceholder](https://jsonplaceholder.typicode.com/)

- [dio](https://pub.dev/packages/dio)

- [Developer Marvel](https://developer.marvel.com/)

- [crypto](https://pub.dev/packages/crypto)

- [flutter_dotenv](https://pub.dev/packages/flutter_dotenv)

- [back4app](https://www.back4app.com/)

### Trabalhando com pacotes externos no Flutter

- [PDF: Pacotes externos](files/Pacotes%20Externos.pdf)

- [pub.dev](https://pub.dev/)

- [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons)

- gerar ícones: flutter pub run flutter_launcher_icons

- [font_awesome_flutter](https://pub.dev/packages/font_awesome_flutter)

- [percent_indicator](https://pub.dev/packages/percent_indicator)

- [auto_size_text](https://pub.dev/packages/auto_size_text)

- [animated_text_kit](https://pub.dev/packages/animated_text_kit)

- [convex_bottom_bar](https://pub.dev/packages/convex_bottom_bar)

- [brasil_fields](https://pub.dev/packages/brasil_fields)

- [intl](https://pub.dev/packages/intl)

- [easy_localization](https://pub.dev/packages/easy_localization)

- [battery_plus](https://pub.dev/packages/battery_plus)

- [url_launcher](https://pub.dev/packages/url_launcher)

- [share_plus](https://pub.dev/packages/share_plus)

- [path_provider](https://pub.dev/packages/path_provider)

- [package_info_plus](https://pub.dev/packages/package_info_plus)

- [device_info_plus](https://pub.dev/packages/device_info_plus)

- [connectivity_plus](https://pub.dev/packages/connectivity_plus)

- [geolocator](https://pub.dev/packages/geolocator)

- [qr_code_scanner](https://pub.dev/packages/qr_code_scanner)

- [image_picker](https://pub.dev/packages/image_picker)

- [image_gallery_saver](https://pub.dev/packages/image_gallery_saver)

- [image_cropper](https://pub.dev/packages/image_cropper)

### Gerenciamento de Estado e Padrões no Flutter

- [PDF](files/Gerenciamento%20de%20Estado%20e%20Padrões%20em%20Flutter.pdf)

- [provider](https://pub.dev/packages/provider)

- [mobx](https://pub.dev/packages/mobx)

- [flutter_mobx](https://pub.dev/packages/flutter_mobx)

- [mobx_codegen](https://pub.dev/packages/mobx_codegen)

- [get](https://pub.dev/packages/get)

- [get_it](https://pub.dev/packages/get_it)

### Firebase

- [PDF](files/Introdução%20ao%20Firebase.pdf)

- [firebase flutter docs](https://firebase.google.com/docs/flutter/setup?hl=pt-br&platform=android)

- [firebase_core](flutter pub add firebase_core)

- [cloud_firestore](flutter pub add cloud_firestore)

- [cloud firestore docs](https://firebase.google.com/docs/firestore/quickstart?hl=pt-br)

- [firebase_remote_config](flutter pub add firebase_remote_config)

- [remote-config docs](https://firebase.google.com/docs/remote-config/get-started?platform=flutter&hl=pt-br)

- [crashlytics docs](https://firebase.google.com/docs/crashlytics/get-started?platform=flutter&hl=pt-br)

- [firebase_crashlytics](flutter pub add firebase_crashlytics)

- [analytics docs](https://firebase.google.com/docs/analytics/get-started?platform=flutter&hl=pt-br)

- [firebase_analytics](flutter pub add firebase_analytics)

- [cloud-messaging docs](https://firebase.google.com/docs/cloud-messaging/flutter/client?hl=pt-br)

- [firebase_messaging](flutter pub add firebase_messaging)

- [Chave de autenticação de APNs para IOS](https://developer.apple.com/help/account/manage-keys/create-a-private-key)

### Publicando os seus apps Flutter

- [PDF](/files/Publicando%20apps.pdf)

- [Flutter deployment Android](https://docs.flutter.dev/deployment/android)

- keytool -genkey -v -keystore upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias appkey

- flutter build apk

- flutter build appbundle
