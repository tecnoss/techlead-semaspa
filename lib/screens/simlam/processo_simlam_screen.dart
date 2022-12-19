import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:semasma/screens/simlam/data_view.dart';
import 'package:semasma/screens/simlam/process.dart';
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
  final Proccess _proccess = Proccess();

  @override
  void initState() {
    _proccess.initData(20);
    super.initState();
  }

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
              const Text(
                'Obs.: Deslize para a direita para ver mais informações.',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),
              8.height,
              SizedBox(
                height: _proccess.proccessInfo.length * 33.0 + 34,
                width: double.infinity,
                child: SimpleTablePage(proccess: _proccess),
              ),
              Container(
                height: 24,
                padding: const EdgeInsets.only(left: 16.0),
                decoration: const BoxDecoration(
                  color: appColorPrimary,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Itens por página: 10',
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.white,
                      ),
                    ),
                    const Icon(
                      Icons.chevron_left,
                      color: Colors.grey,
                      size: 16,
                    ),
                    8.width,
                    const Text(
                      '1 - 10 de 65',
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.white,
                      ),
                    ),
                    8.width,
                    const Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
