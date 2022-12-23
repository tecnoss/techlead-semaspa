import 'package:flutter/material.dart';
import 'package:semasma/widgets/leading.dart';
import 'package:semasma/widgets/title_app_bar.dart';

class ChamadoCatisSCreen extends StatefulWidget {
  const ChamadoCatisSCreen({super.key});

  @override
  State<ChamadoCatisSCreen> createState() => _ChamadoCatisSCreenState();
}

class _ChamadoCatisSCreenState extends State<ChamadoCatisSCreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitleAppBar(title: 'SEMAS'),
        leading: const Leading(),
      ),
      body: const Center(
        child: Text('Chamado Catis'),
      ),
    );
  }
}
