import 'package:flutter/material.dart';
import 'package:semasma/widgets/title_app_bar.dart';

import '../widgets/bottom_bar.dart';
import '../widgets/screen_title.dart';

class PrevisaoTempo extends StatefulWidget {
  const PrevisaoTempo({Key? key}) : super(key: key);

  @override
  State<PrevisaoTempo> createState() => _PrevisaoTempoState();
}

class _PrevisaoTempoState extends State<PrevisaoTempo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitleAppBar(),
        centerTitle: true,
      ),
      bottomNavigationBar: const BottomBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ScreenTitle(title: 'Previsão do Tempo'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.location_on),
                            Text("REGIÃO METROPOLITANA DE BELÉM"),
                          ],
                        ),
                        const Text("Sexta, 21 de Outubro de 2022"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: const [
                        Text("Outras Cidades do Pará"),
                        Text("Sexta, 21 de Outubro de 2022"),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
