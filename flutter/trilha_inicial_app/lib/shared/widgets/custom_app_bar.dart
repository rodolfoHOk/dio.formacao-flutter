import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trilha_inicial_app/services/dark_mode_service.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    debugPrint("build");
    return AppBar(
      title: Text(
        widget.title,
      ),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      actions: [
        const Center(
          child: Text(
            "Dark Mode",
          ),
        ),
        Consumer<DarkModeService>(
          builder: (_, darkModeService, widget) {
            return Switch(
              value: darkModeService.darkMode,
              onChanged: (_) {
                darkModeService.darkMode = !darkModeService.darkMode;
              },
            );
          },
        ),
      ],
    );
  }
}
