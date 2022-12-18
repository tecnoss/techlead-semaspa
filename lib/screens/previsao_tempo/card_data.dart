import 'package:flutter/material.dart';

class CardData extends StatelessWidget {
  const CardData({Key? key, required this.data}) : super(key: key);

  final Widget data;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: data,
      ),
    );
  }
}
