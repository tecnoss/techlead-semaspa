import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:semasma/widgets/custom_button.dart';
import 'package:semasma/widgets/custom_scaffold.dart';

class DenunciaInfoScreen extends StatefulWidget {
  const DenunciaInfoScreen({Key? key}) : super(key: key);

  @override
  State<DenunciaInfoScreen> createState() => _DenunciaInfoScreenState();
}

class _DenunciaInfoScreenState extends State<DenunciaInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: 'Ouvidoria',
      screenTitle: 'Informações necessárias para abertura da denúncia',
      child: [
        24.height,
        const Text(
          'Ao abrir uma denúncia, tenha em mãos os seguintes dados:',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              8.height,
              subtitle(
                  '• Local do fato contendo endereço preciso, preferencialmente com coordenadas geográficas;'),
              8.height,
              subtitle('• Pontos de referência;'),
              8.height,
              subtitle('• Data do ilícito ambiental;'),
              8.height,
              subtitle('• Descrição detalhada do ocorrido;'),
              8.height,
              subtitle('• Número do CAR (se for o caso)'),
              8.height,
              subtitle('• Fotos ou documentos relacionados ao fato.'),
              24.height,
            ],
          ),
        ),
        CustomButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              '/denuncia_ouvidoria/identification',
            );
          },
          text: "Prosseguir",
        ),
      ],
    );
  }

  Widget subtitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
        color: Colors.black54,
      ),
    );
  }
}
