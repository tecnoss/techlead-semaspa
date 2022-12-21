import 'package:flutter/material.dart';
import 'package:semasma/widgets/leading.dart';
import 'package:semasma/widgets/title_app_bar.dart';

class SelectDenunciaScreen extends StatefulWidget {
  const SelectDenunciaScreen({super.key});

  @override
  State<SelectDenunciaScreen> createState() => _SelectDenunciaScreenState();
}

class _SelectDenunciaScreenState extends State<SelectDenunciaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitleAppBar(
          title: 'Ouvidoria',
        ),
        leading: const Leading(),
      ),
      body: const Center(
        child: Text('SelectDenunciaScreen'),
      ),
    );
  }
}
