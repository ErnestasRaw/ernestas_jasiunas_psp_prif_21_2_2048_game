import 'package:ernestas_jasiunas_psp_prif_21_2_2048_game/components/scaffolds/app_scaffold.dart';
import 'package:ernestas_jasiunas_psp_prif_21_2_2048_game/views/widgets/game_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      titleText: '2048',
      child: GameWidget(),
    );
  }
}
