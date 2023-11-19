import 'package:ernestas_jasiunas_psp_prif_21_2_2048_game/components/scaffolds/app_drawer.dart';
import 'package:ernestas_jasiunas_psp_prif_21_2_2048_game/components/theme/palette.dart';
import 'package:ernestas_jasiunas_psp_prif_21_2_2048_game/components/theme/styles.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final String titleText;
  final Widget child;
  final Color? backgroundColor;

  const AppScaffold({
    super.key,
    required this.child,
    required this.titleText,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).focusedChild?.unfocus(),
      child: Scaffold(
      /*  appBar: AppBar(
       //   leading: DrawerButton(),
          centerTitle: true,
          title: Text(
            titleText,
            style: Styles.titleTextStyle(),
          ),
        ),
       // drawer: AppDrawer(),
        backgroundColor: backgroundColor ?? Palette.backgroundWhite,*/
        body: child,
      ),
    );
  }
}
