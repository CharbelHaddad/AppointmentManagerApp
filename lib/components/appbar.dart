import 'package:appointment_manager/themes/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../db/db.dart';
import '../themes/theme_text.dart';
import '../utils/routes.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MyAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ThemeColor.secondary,
      title: Text(title, style: ThemeText.title.copyWith(color: Colors.white)),
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            // Add your logout functionality here
            Db.userEmail = '';
            Get.offAllNamed(Routes.loginPage);
          },
        ),
      ],
    );
  }
}
