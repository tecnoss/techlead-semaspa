import 'package:flutter/material.dart';

class TitleAppBar extends StatelessWidget {
  const TitleAppBar({super.key, this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? 'SEMAS',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
