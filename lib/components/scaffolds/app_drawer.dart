/*
import 'package:ernestas_jasiunas_psp_prif_21_2_2048_game/components/theme/styles.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          SafeArea(
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    Icons.close,
                    size: 40,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextButton(
                  child: Text(
                    'Button',
                    style: Styles.ag16Light(),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    Navigator.maybePop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
*/
