import '../utils/utils.dart';
import '../themes/theme_text.dart';
import '../themes/theme_color.dart';
import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const ButtonComponent({
    Key? key,
    this.onTap,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsetsDirectional.all(10.0),
        height: 45,
        width: 250,
        decoration: BoxDecoration(
            color: ThemeColor.tertiary,
            borderRadius: BorderRadius.circular(Utils.borderRadius)
        ),
        child: Center(child: Text(text, style: ThemeText.subtitle.copyWith(color: Colors.white, height: 1.5),)),
      ),
    );
  }
}
