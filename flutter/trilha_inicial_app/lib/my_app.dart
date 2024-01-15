import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:trilha_inicial_app/pages/splash_screen/splash_screen_delay_page.dart';
import 'package:trilha_inicial_app/services/counter_service.dart';
import 'package:trilha_inicial_app/services/dark_mode_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DarkModeService>(
          create: (_) => DarkModeService(),
        ),
        ChangeNotifierProvider<CounterService>(
          create: (_) => CounterService(),
        ),
      ],
      child: Consumer<DarkModeService>(
          builder: (context, darkModeService, widget) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme: darkModeService.darkMode
              ? ThemeData.dark(useMaterial3: true)
              : ThemeData.light(useMaterial3: true),
          home: const SplashScreenDelayPage(),
        );
      }),
    );
  }
}
