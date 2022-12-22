import 'package:flutter/material.dart';

class LocationDenunciaScreen extends StatefulWidget {
  const LocationDenunciaScreen({super.key});

  @override
  State<LocationDenunciaScreen> createState() => _LocationDenunciaScreenState();
}

class _LocationDenunciaScreenState extends State<LocationDenunciaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Localização'),
      ),
      body: const Center(
        child: Text('Localização'),
      ),
    );
  }
}
