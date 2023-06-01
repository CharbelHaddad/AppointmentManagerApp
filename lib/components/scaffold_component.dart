import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScaffoldComponent extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final bool extendBodyBehindAppBar;
  final Widget? body;
  final bool hasSafeArea;
  final bool? top;
  final Widget? floatingActionButton;
  final Color? statusBarColor;
  const ScaffoldComponent({Key? key, this.body, this.appBar, this.extendBodyBehindAppBar = true, this.hasSafeArea = true, this.top, this.floatingActionButton, this.statusBarColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        backgroundColor: Colors.white,
        appBar: appBar??AppBar(
          toolbarHeight: 0,
          backgroundColor: statusBarColor??Colors.transparent,
          elevation: 0,
        ),
        body: hasSafeArea ?
          SafeArea(
            top: top??true,
            child: SizedBox(
              height: 1.sh,
              width: 1.sw,
              child: (body) ?? (const SizedBox())
            )
          )
            :
          SizedBox(
            height: 1.sh,
            width: 1.sw,
            child: body
          ),
      floatingActionButton: floatingActionButton,
    );
  }
}