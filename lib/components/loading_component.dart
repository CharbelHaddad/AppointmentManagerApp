import '../themes/theme_color.dart';
import 'package:flutter/cupertino.dart';

class LoadingComponent extends StatelessWidget {
  final Color? color;
  const LoadingComponent({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoActivityIndicator(color: color??ThemeColor.tertiary,);
  }
}
