import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:semasma/utils/app_colors.dart';
import 'package:semasma/widgets/bottom_bar.dart';
import 'package:semasma/widgets/screen_title.dart';
import 'package:semasma/widgets/title_app_bar.dart';

import '../../widgets/leading.dart';

class ProcessoSimlamScreen extends StatefulWidget {
  const ProcessoSimlamScreen({super.key});

  @override
  State<ProcessoSimlamScreen> createState() => _ProcessoSimlamScreenState();
}

class _ProcessoSimlamScreenState extends State<ProcessoSimlamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitleAppBar(),
        leading: const Leading(),
      ),
      bottomNavigationBar: const BottomBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const ScreenTitle(title: 'Processos SIMLAM'),
                const Text(
                  'Consulta rápida dos processos do SIMLAM',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                16.height,
                TextField(
                  style: const TextStyle(fontSize: 12.0),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(),
                    labelText: 'Consultar Processo',
                    labelStyle: const TextStyle(fontSize: 12.0),
                    hintText:
                        'Consultar por nº do processo, empreendimento, interessado, situação',
                    hintStyle: const TextStyle(fontSize: 8.0),
                    isDense: true,
                    suffixIcon: Container(
                      width: 14,
                      height: 14,
                      margin: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                        color: appColorPrimary,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                16.height,
                Text(
                  'Foram encontrados 65 processos com os filtros informados.',
                  style: boldTextStyle(
                    size: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
