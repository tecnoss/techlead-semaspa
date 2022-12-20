import 'package:flutter/material.dart';

class PortalTransparenciaScreen extends StatefulWidget {
  const PortalTransparenciaScreen({super.key});

  @override
  State<PortalTransparenciaScreen> createState() =>
      _PortalTransparenciaScreenState();
}

class _PortalTransparenciaScreenState extends State<PortalTransparenciaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portal da Transparência'),
      ),
      body: const Center(
        child: Text('Portal da Transparência'),
      ),
    );
  }
}
