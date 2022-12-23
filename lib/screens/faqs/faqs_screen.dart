import 'package:flutter/material.dart';
import 'package:semasma/widgets/custom_scaffold.dart';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({super.key});

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {
  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      appBarTitle: 'SEMAS',
      screenTitle: 'FAQs',
      child: [
        Text('FAQs'),
      ],
    );
  }
}
