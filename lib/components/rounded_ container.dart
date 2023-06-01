import 'package:appointment_manager/themes/theme_color.dart';
import 'package:appointment_manager/themes/theme_text.dart';
import 'package:appointment_manager/utils/utils.dart';
import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final String title;
  final String location;
  final String dateTime;

  const RoundedContainer({
    super.key,
    required this.title,
    required this.location,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: ThemeColor.secondary,
        borderRadius: BorderRadius.circular(Utils.borderRadius),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Title: $title',
                  style: ThemeText.title.copyWith(color: Colors.white)),
              const SizedBox(height: 8.0),
              Text('Location: $location',
                  style: ThemeText.title.copyWith(color: Colors.white)),
              const SizedBox(height: 8.0),
              Text('DateTime: $dateTime',
                  style: ThemeText.title.copyWith(color: Colors.white)),
            ],
          ),
          Image.asset(
            'assets/images/main.png',
            width: 50,
          ),
        ],
      ),
    );
  }
}
