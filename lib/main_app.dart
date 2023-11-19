import 'package:ernestas_jasiunas_psp_prif_21_2_2048_game/components/theme/sizes.dart';
import 'package:ernestas_jasiunas_psp_prif_21_2_2048_game/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    Sizes.configure(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '2048',
      home: HomeView(),
    );
  }
}
