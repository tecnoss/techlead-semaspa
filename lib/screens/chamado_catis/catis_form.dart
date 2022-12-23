import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:semasma/widgets/leading.dart';
import 'package:semasma/widgets/screen_title.dart';
import 'package:semasma/widgets/title_app_bar.dart';

class CatisFormScreen extends StatefulWidget {
  const CatisFormScreen({super.key});

  @override
  State<CatisFormScreen> createState() => _CatisFormScreenState();
}

class _CatisFormScreenState extends State<CatisFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitleAppBar(title: 'SEMAS'),
        leading: const Leading(),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const ScreenTitle(title: 'Solicitar chamados CATIS'),
                16.height,
              ],
            )),
      ),
    );
  }
}
