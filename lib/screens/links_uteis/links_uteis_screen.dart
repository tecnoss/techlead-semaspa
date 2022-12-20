import 'package:flutter/material.dart';

class LinksUteisScreen extends StatefulWidget {
  const LinksUteisScreen({super.key});

  @override
  State<LinksUteisScreen> createState() => _LinksUteisScreenState();
}

class _LinksUteisScreenState extends State<LinksUteisScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Links Úteis'),
      ),
      body: const Center(
        child: Text('Links Úteis'),
      ),
    );
  }
}
