import 'package:flutter/material.dart';
import 'package:semasma/utils/app_colors.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(top: 2),
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: appColorPrimary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/new-logo.png',
            width: 250,
          ),
        ],
      ),
    );
  }
}
