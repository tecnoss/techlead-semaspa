import 'package:flutter/material.dart';
import 'package:semasma/widgets/bottom_bar.dart';
import 'package:semasma/widgets/leading.dart';
import 'package:semasma/widgets/title_app_bar.dart';

class DenunciaOuvidoriaScreen extends StatefulWidget {
  const DenunciaOuvidoriaScreen({super.key});

  @override
  State<DenunciaOuvidoriaScreen> createState() =>
      _DenunciaOuvidoriaScreenState();
}

class _DenunciaOuvidoriaScreenState extends State<DenunciaOuvidoriaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitleAppBar(),
        leading: const Leading(),
      ),
      bottomNavigationBar: const BottomBar(),
      body: const Center(
        child: Text('Denúncia ou Ouvidoria'),
      ),
    );
  }
}
